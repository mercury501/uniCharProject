
		function checkNamesurname(inputtxt) {
			var name = /^[a-zA-Z\s]*$/;;
			if(inputtxt.value.match(name)) 
				return true
		
			return false;	
		}
		
		function validate(obj) {	
			
			var valid = true;
			
			var name = document.getElementsByName("name")[0];
			if(!checkNamesurname(name)) {
				valid = false;
				//document.getElementById("error").style.display = 'block';
				document.getElementById("errorMessage").style.display = 'block';
			} else {
				//document.getElementById("error").style.display = 'none';
				document.getElementById("errorMessage").style.display = 'none';
				
			}
			
			if(valid) obj.submit();
		}