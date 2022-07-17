
		function checkNamesurname(inputtxt) {
			var name = /^[a-zA-Z\s]*$/;;
			if(inputtxt.value.match(name)) 
				return true
		
			return false;	
		}
		
		function checkNumber(inputtxt) {
			if (inputtxt.value.length != 16)
				return false;
			var num = /^[0-9]*$/;
			if (inputtxt.value.match(num))
				return true;
			return false;			
			
		}
		
		function checkCVV(inputtxt) {
			if (inputtxt.value.length != 3)
				return false;
			var num = /^[0-9]*$/;
			if (inputtxt.value.match(num))
				return true;
			return false;			
			
		}
		
		function validate(obj) {	
			
			var valid = true;
			
			var name = document.getElementsByName("name")[0];
			var number = document.getElementsByName("cardNumber")[0];
			var date = document.getElementsByName("expiry")[0];
			var cvv = document.getElementsByName("cvv")[0];
			
			if(!checkNamesurname(name)) {
				valid = false;

				document.getElementById("errorMessage").style.display = 'block';
				document.getElementById("errorMessage").innerHTML = "Nome non valido.";
				return;
			}
			
			else if (!checkNumber(number)) {
				valid = false;
				document.getElementById("errorMessage").style.display = 'block';
				document.getElementById("errorMessage").innerHTML = "Numero Carta non valido.";
			} else if (!checkCVV(cvv)) {
				valid = false;
				document.getElementById("errorMessage").style.display = 'block';
				document.getElementById("errorMessage").innerHTML = "CVV non valido.";
			} else if (date.value.length != 5) {
				valid = false;
				document.getElementById("errorMessage").style.display = 'block';
				document.getElementById("errorMessage").innerHTML = "Data di Scadenza non valido.";
			}
			
			 else {
					document.getElementById("errorMessage").style.display = 'none';
					
				}
			
			if(valid) obj.submit();
		}