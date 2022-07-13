
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
		
		function checkPassword(inputtxt) {
			var name = /[^\s-]/;
			if(inputtxt.value.match(name)) 
				return true
		
			return false;	
		}
		
		function checkPhonenumber(inputtxt) {
			var phoneno = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
			if(inputtxt.value.match(phoneno)) 
				return true;
			
			return false;
		}
		
		
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
				
				var emailTestPass = document.getElementsByName("email")[0].value;
				console.log(emailTestPass);
		        $.ajax({
		        	async: false,
		            url: "HandleAjaxUser",  
		            method: "POST",
		            data: "checkEmail=" + emailTestPass,
		            dataType: "json",        
		            
		            success: function(data, textStatus, jqXHR) {  
		            	console.log("username libero: " + data);
		            	var contenutoJSON = JSON.parse(data);
		            	if(contenutoJSON){
		            		console.log("L'username e' libero");
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
			
			var pass1 = document.getElementById("password");
			var pass2 = document.getElementById("confirm-password");
			
			if( checkPassword(pass1) ){
				document.getElementById("errorPassword").style.display = 'none';
				document.getElementById("errorMessagePassword").style.display = 'none';
			} else {
				valid = false;
				document.getElementById("errorPassword").style.display = 'block';
				document.getElementById("errorMessagePassword").style.display = 'block';
			}
			if( pass1.value === pass2.value ) {
				console.log('Le password coincidono');
				document.getElementById("errorPassword2").style.display = 'none';
				document.getElementById("errorMessagePasswordDifferent").style.display = 'none';
			} else {
				valid = false;
				console.log('Le password non coincidono');
				document.getElementById("errorPassword2").style.display = 'block';
				document.getElementById("errorMessagePassword2").style.display = 'block';
			}
				
			
			if(valid) obj.submit();
		}