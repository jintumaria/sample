// JavaScript Document
function checkpercentage()
	{
		
			if(document.wizardForm.percent_1.value!="")
			{
				var checkOK = "123456789.";
				var checkStr = document.wizardForm.percent_1.value;
				var allValid = true;
				for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOK.length;  j++)
					if (ch == checkOK.charAt(j))
					break;
					if (j == checkOK.length)
					{
						allValid = false;
						break;
					}
				}
				if (!allValid)
				{
					alert("No Alphabets Or Special Characters Allowed !! !!");
					document.wizardForm.percent_1.value="";
					document.wizardForm.percent_1.focus();
					return (false);
				}
			}
			if(document.wizardForm.percent_2.value!="")
			{
				var checkOK = "123456789.";
				var checkStr = document.wizardForm.percent_2.value;
				var allValid = true;
				for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOK.length;  j++)
					if (ch == checkOK.charAt(j))
					break;
					if (j == checkOK.length)
					{
						allValid = false;
						break;
					}
				}
				if (!allValid)
				{
					alert("No Alphabets Or Special Characters Allowed !! !!");
					document.wizardForm.percent_2.value="";
					document.wizardForm.percent_2.focus();
					return (false);
				}
			}
			if(document.wizardForm.percent_3.value!="")
			{
				var checkOK = "123456789.";
				var checkStr = document.wizardForm.percent_3.value;
				var allValid = true;
				for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOK.length;  j++)
					if (ch == checkOK.charAt(j))
					break;
					if (j == checkOK.length)
					{
						allValid = false;
						break;
					}
				}
				if (!allValid)
				{
					alert("No Alphabets Or Special Characters Allowed !! !!");
					document.wizardForm.percent_3.value="";
					document.wizardForm.percent_3.focus();
					return (false);
				}
			}
			
	
	}