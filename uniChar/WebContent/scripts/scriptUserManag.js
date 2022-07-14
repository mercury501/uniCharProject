function validate(obj) {	
			var valid = true;
			
			var email = document.getElementsByName("email")[0];
			if(!checkEmail(email)) {
				valid = false;
				document.getElementById("errorMail").style.display = 'block';
				document.getElementById("errorMessageMail").style.display = 'block';
			} else {
				document.getElementById("errorMail").style.display = 'none';
				document.getElementById("errorMessageMail").style.display = 'none';
				document.getElementById("errorMessageMailUsed").style.display = 'none';
				
				
			}
			if(valid) obj.submit();
		}


function checkEmail(inputtxt) {
	var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(inputtxt.value.match(email)) 
		return true;
	
	return false;	
}