$('body').on('click', '.submit-save', function(){
	//e.preventDefault();
alert('a');	
var client=$('.test-client').val();
var projectName=$('.test-project-name').val();
var projectCode=$('.test-project-code').val();
var startingDate=$('.test-starting-date').val();
var endingDate=$('.test-ending-date').val();
var specialNotes=$('.test-special-notes').val();
var teamName=$('.test-team').val();
var statusValue=$('.test-status').val();
var id=$('.test-id').val();
var base_url=window.location.origin;

console.log(client);
console.log(projectName);
console.log(projectCode);
console.log(startingDate);
console.log(endingDate);
console.log(specialNotes);
console.log(teamName);
console.log(statusValue);
console.log(id);
console.log(base_url);

$.ajax({
	url: base_url + "/fshdesign.in/jadmin/projects-submit.jsp",
	async: false,
	type: "POST",
	dataType: 'json',
	data: {
		'client': client,
		'projectName': projectName,
		'projectCode': projectCode,
		'startingDate': startingDate,
		'endingDate': endingDate,
		'specialNotes': specialNotes,
		'teamName': teamName,
		'statusValue': statusValue,
		'id': id
	},
	success: function(json) {
		alert('s');
	var obj = jQuery.parseJSON(json);
	console.log(obj);


	}


});

});
