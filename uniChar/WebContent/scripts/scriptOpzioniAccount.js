
		function checkNamesurname(inputtxt) {
			var name = /^[A-Za-z]+$/;;
			if(inputtxt.value.match(name)) 
				return true
		
			return false;	
		}
		
		function checkEmail(inputtxt) {
			var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(inputtxt.value.match(email)) 
				return true;
			
			return false;	
		}

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
			
			}
			
			var name = document.getElementsByName("name")[0];
			if(!checkNamesurname(name)) {
				valid = false;
				document.getElementById("errorName").style.display = 'block';
				document.getElementById("errorMessageName").style.display = 'block';
			} else {
				document.getElementById("errorName").style.display = 'none';
				document.getElementById("errorMessageName").style.display = 'none';
			}
			
			var surname = document.getElementsByName("surname")[0];
			if(!checkNamesurname(surname)) {
				valid = false;
				document.getElementById("errorSurname").style.display = 'block';
				document.getElementById("errorMessageSurname").style.display = 'block';
			} else {
				document.getElementById("errorSurname").style.display = 'none';
				document.getElementById("errorMessageSurname").style.display = 'none';
			}	
	
			if(valid) obj.submit();
		}