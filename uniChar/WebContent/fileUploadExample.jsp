<!DOCTYPE html> 
<html> 
<head> 
<title> Java Ajax File Upload Example </title> 
</head> 
<body>
  <!-- HTML5 Input Form Elements -->
  <input id="ajaxfile" type="file"/> <br/>
  <button onclick="uploadFile()"> Upload </button>

  <!-- Ajax to Java File Upload Logic -->
  <script>
  async function uploadFile() {
    let formData = new FormData(); 

    formData.append("file", ajaxfile.files[0]);
    const response = await fetch('uploadFile', {
      method: "POST", 
      body: formData
      
    }); 
    
    const message = await response.text();
   	alert(message);
   	console.log(message);
    
  }
  


	  
  
  </script>
</body> 
<script src="JavaScript/jquery-3.6.0.min.js" type="text/javascript"></script>
</html>