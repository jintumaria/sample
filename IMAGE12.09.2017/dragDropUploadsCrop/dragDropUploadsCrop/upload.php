<?php
session_start();
/**
 * Handle file uploads via XMLHttpRequest
 */
class qqUploadedFileXhr {
    /**
     * Save the file to the specified path
     * @return boolean TRUE on success
     */
    function save($path) {   
		$input = fopen("php://input", "r");
		if($tmpfile = tempnam( 'PATH_TO_YOUR_TEMP_FOLDER', 'tmpfile')){
			$temp = fopen($tmpfile,'w+');
			$realSize = stream_copy_to_stream($input, $temp);
			fclose($input);
	
			if ($realSize != $this->getSize()){           
				return false;
			}
	
			$target = fopen($path, "w");       
			fseek($temp, 0, SEEK_SET);
			stream_copy_to_stream($temp, $target);
			fclose($target);
			fclose($temp);
			unlink($tmpfile);
	
			return true;
		}else{
			die("{'error':'Could not create temporary file.'}"); // open_basedir restriction
		}
	}
    function getName() {
        return $_GET['qqfile'];
    }
    function getSize() {
        if (isset($_SERVER["CONTENT_LENGTH"])){
            return (int)$_SERVER["CONTENT_LENGTH"];            
        } else {
            throw new Exception('Getting content length is not supported.');
        }      
    }   
}

/**
 * Handle file uploads via regular form post (uses the $_FILES array)
 */
class qqUploadedFileForm {  
    /**
     * Save the file to the specified path
     * @return boolean TRUE on success
     */
    function save($path) {
        if(!move_uploaded_file($_FILES['qqfile']['tmp_name'], $path)){
            return false;
        }
        return true;
    }
    function getName() {
        return $_FILES['qqfile']['name'];
    }
    function getSize() {
        return $_FILES['qqfile']['size'];
    }
}

class qqFileUploader {
    private $allowedExtensions = array();
    private $sizeLimit = 10485760;
    private $file;

    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        
        $allowedExtensions = array_map("strtolower", $allowedExtensions);
            
        $this->allowedExtensions = $allowedExtensions;        
        $this->sizeLimit = $sizeLimit;
        
        $this->checkServerSettings();       

        if (isset($_GET['qqfile'])) {
            $this->file = new qqUploadedFileXhr();
        } elseif (isset($_FILES['qqfile'])) {
            $this->file = new qqUploadedFileForm();
        } else {
            $this->file = false; 
        }
    }
    
    private function checkServerSettings(){        
        $postSize = $this->toBytes(ini_get('post_max_size'));
        $uploadSize = $this->toBytes(ini_get('upload_max_filesize'));        
        
        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){
            $size = max(1, $this->sizeLimit / 1024 / 1024) . 'M';             
            die("{'error':'increase post_max_size and upload_max_filesize to $size'}");    
        }        
    }
    
    private function toBytes($str){
        $val = trim($str);
        $last = strtolower($str[strlen($str)-1]);
        switch($last) {
            case 'g': $val *= 1024;
            case 'm': $val *= 1024;
            case 'k': $val *= 1024;        
        }
        return $val;
    }
    
    /**
     * Returns array('success'=>true) or array('error'=>'error message')
     */
    function handleUpload($uploadDirectory, $replaceOldFile = FALSE){
	    
	    if (!is_dir($uploadDirectory))
	    {
		    mkdir($uploadDirectory, 0777);
		    mkdir($uploadDirectory.'thumbs/', 0777);
	    }
	    
        if (!is_writable($uploadDirectory)){
            return array('error' => "Server error. Upload directory isn't writable.");
        }
        
        if (!$this->file){
            return array('error' => 'No files were uploaded.');
        }
        
        $size = $this->file->getSize();
        
        if ($size == 0) {
            return array('error' => 'File is empty');
        }
        
        if ($size > $this->sizeLimit) {
            return array('error' => 'File is too large');
        }
        
        $pathinfo = pathinfo($this->file->getName());
        $filename = $pathinfo['filename'];
        // $filename = md5(uniqid());
        $ext = $pathinfo['extension'];

        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){
            $these = implode(', ', $this->allowedExtensions);
            return array('error' => 'File has an invalid extension, it should be one of '. $these . '.');
        }
        
        if(!$replaceOldFile){
            /// don't overwrite previous files that were uploaded
            while (file_exists($uploadDirectory . $filename . '.' . $ext)) {
                $filename .= rand(10, 99);
            }
        }
        
        if ($this->file->save($uploadDirectory . $filename . '.' . $ext)){
            return array('success'=>true, 'path' => $uploadDirectory . $filename . '.' . $ext, 'filename' => $filename, 'ext' => $ext, 'uploadedBy' => $_GET['uploadedBy']);
        } else {
            return array('error'=> 'Could not save uploaded file.' .
                'The upload was cancelled, or server error encountered');
        }
        
    }    
}

// list of valid extensions, ex. array("jpeg", "xml", "bmp")
$allowedExtensions = array();
// max file size in bytes
$sizeLimit = 10 * 1024 * 1024;

$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);
$result = $uploader->handleUpload('uploads/'.session_id().'/');

// Get dimensions of the original image
list($currentWidth, $currentHeight) = getimagesize($result['path']);
 
// The x and y coordinates on the original image where we will begin cropping the image
$left = $_GET['x1'] * ($currentWidth / $_GET['oWidth']);
$top = $_GET['y1'] * ($currentHeight / $_GET['oHeight']);

// This will be the final size of the image (e.g. how many pixels left and down we will be going)
$cropWidth = $_GET['cWidth'] * ($currentWidth / $_GET['oWidth']);
$cropHeight = $_GET['cHeight'] * ($currentHeight / $_GET['oHeight']);
 
// Crop the image
$canvas = imagecreatetruecolor($cropWidth, $cropHeight);
$currentImage = imagecreatefromjpeg($result['path']);
imagecopy($canvas, $currentImage, 0, 0, $left, $top, $currentWidth, $currentHeight);
imagejpeg($canvas, $result['path'], 100);

// Get dimensions of the cropped image
list($currentWidth, $currentHeight) = getimagesize($result['path']);

// Resize the image
$canvas = imagecreatetruecolor($_GET['rWidth'], $_GET['rHeight']);
$currentImage = imagecreatefromjpeg($result['path']);
imagecopyresampled($canvas, $currentImage, 0, 0, 0, 0, $_GET['rWidth'], $_GET['rHeight'], $currentWidth, $currentHeight);
imagejpeg($canvas, $result['path'], 100);

// At this point you could use $result to do resizing of images or similar operations
if(strtolower($result['ext']) == 'jpg' || strtolower($result['ext']) == 'jpeg'){
	$thumbnailPath = createThumbnails($result, 'uploads/'.session_id().'/thumbs/', 75); // Function to create thumbnails
	
	$result['thumbnailPath'] = $thumbnailPath;
}

$result['uploadedBy'] = $_GET['uploadedBy'];

// to pass data through iframe you will need to encode all html tags
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);

// Function to create thumbnails only for JPG
function createThumbnails($resultArr, $thumbnailSavePath, $thumbnailWidth = 100){
	// Load image and get image size
	$img = imagecreatefromjpeg($resultArr['path']);
	$width = imagesx($img);
	$height = imagesy($img);
	
	// Calculate thumbnail size
	$newWidth = $thumbnailWidth;
	$newHeight = floor($height * ($thumbnailWidth / $width));

	// Create a new temporary image
	$tmpImg = imagecreatetruecolor($newWidth, $newHeight);

	// Copy and resize old image into new image
	imagecopyresized($tmpImg, $img, 0, 0, 0, 0, $newWidth, $newHeight, $width, $height);

	$filename = $resultArr['filename'];

	while (file_exists($uploadDirectory . $filename . '.' . $ext)) {
        $filename .= rand(10, 99);
    }

	// Save thumbnail into a file
	imagejpeg($tmpImg, $thumbnailSavePath.$filename. '.' .$resultArr['ext']);
	
	return $thumbnailSavePath.$filename. '.' .$resultArr['ext'];
}

?>