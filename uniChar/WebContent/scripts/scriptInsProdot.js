
		function validate(obj) {	
			var valid = true;
			
			document.getElementById("errorMess").style.display = 'none';
			document.getElementById("errorMessageMess").style.display = 'none';
			
			var id = document.getElementByName("prodid")[0].value;
			
			if (id == -1) {
				var title = document.getElementsByName("title")[0].value;
				console.log(title);
		        $.ajax({
		        	async: false,
		            url: "HandleAjaxProduct",  
		            method: "POST",
		            data: "prodtitle=" + title,
		            dataType: "json",        
		            
		            success: function(data, textStatus, jqXHR) {  
		            	var contenutoJSON = JSON.parse(data);
		            	if(contenutoJSON){
		            		document.getElementById("errorMessageMess").style.display = 'none';
		            	} else {
		            		valid = false;
		            		document.getElementById("errorMess").style.display = 'block';
		            		document.getElementById("errorMessageMess").style.display = 'block';
		            	}
		            },
		            error: function(jqXHR, textStatus, errorThrown){
		            	console.log(jqXHR);
		            } 
		        }); 
			
			}

			if(valid) obj.submit();
		}