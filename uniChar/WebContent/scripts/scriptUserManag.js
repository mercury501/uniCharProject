function validate(obj) {	
			var valid = true;
			
			var email = document.getElementsByName("email")[0];
			console.log('Mail:');
			console.log(email);
			if(!checkEmail(email)) {
				valid = false;
				document.getElementById("errorMail").style.display = 'block';
				document.getElementById("errorMessageMail").style.display = 'block';
			} else {
				document.getElementById("errorMail").style.display = 'none';
				document.getElementById("errorMessageMail").style.display = 'none';
				document.getElementById("errorMessageMailUsed").style.display = 'none';
				
				var emailTestPass = document.getElementsByName("email")[0].value;
				console.log(emailTestPass);
		        $.ajax({
		        	async: false,
		            url: "HandleAjaxUser",  
		            method: "POST",
		            data: "checkEmail=" + emailTestPass,
		            dataType: "json",        
		            
		            success: function(data, textStatus, jqXHR) {  
		            	var contenutoJSON = JSON.parse(data);
		            	if(contenutoJSON){
		            		document.getElementById("errorMessageMailUsed").style.display = 'none';
		            	} else {
		            		valid = false;
		            		document.getElementById("errorMail").style.display = 'block';
		            		document.getElementById("errorMessageMailUsed").style.display = 'block';
		            	}
		            },
		            error: function(jqXHR, textStatus, errorThrown){
		            	console.log(jqXHR);
		            } 
		        }); 
			}
			if(valid) obj.submit();
		}


function checkEmail(inputtxt) {
	var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(inputtxt.value.match(email)) 
		return true;
	
	return false;	
}