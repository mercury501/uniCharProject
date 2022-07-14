function validate(obj) {	
			var valid = true;

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
				
			if(valid) obj.submit();
		}