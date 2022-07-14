
<link rel="stylesheet" href="styles/navbar-style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">




    <header class="nav">
        <input type ="checkbox" name ="" id ="chk1">
        <div class="logo"><h1>UC</h1></div>
            <div class="search-box">
                <form>
<input type ="text" name ="search" id ="srch" placeholder="Search">
<button type ="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="ourTeam.jsp">About</a></li>
                <li><a href="Catalog.jsp">Products</a></li>
                <li>
<a href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
<a href="#"><i class="fa fa-user"></i></a>
  
                </li>
            </ul>
            <div class="menu">
                <label for="chk1">
<i class="fa fa-bars"></i>
                </label>
            </div>
    </header>
  
	<script>
    
	function funzioneRicerca() {
		
		$("#risultati").empty();
    	//$("#risultatiResponsive").empty();
    	//$("#risultati").removeClass( "DivRisultati" );
		//$("#barraRicerca").css({"border-bottom-left-radius":"20px"});
    	//$("#barraRicerca").css({"border-bottom-right-radius":"20px"});
		
		console.log("Inizia la funzione di ricerca")
		var stringaParziale;
		
		
		if(document.getElementById("queryRicerca").value === ""){

			stringaParziale = document.getElementById("queryRicerca").value;
			console.log("Ricerca query normale");
			console.log(stringaParziale);
		}else{
			stringaParziale = document.getElementById("queryRicerca").value;
		}
		
		$.ajax({  
			async: true,
            //uri della servlet
            url: "HandleSearch",  
            //tipo di richiesta
            method: "POST",
            //dati inviati al server
            data: "stringaRicerca=" + stringaParziale,
            //tipo dato ricevuto dalla servlet
            dataType: "json",          
            success: function(data, textStatus, jqXHR) {
            	
            	
            	
            	$("#risultati").empty();
            	$("#risultatiResponsive").empty();
            	
            	
            	if( data.length >=1) {
            		
            		$("#risultati").empty();
	            	$("#barraRicerca").css({"border-bottom-left-radius":"0px"});
	            	$("#barraRicerca").css({"border-bottom-right-radius":"0px"});
	            	$("#risultati").addClass( "DivRisultati" );
	            	for (const i in data) {
	            		$( "#risultati" ).append('<div id=""><a href="product?action=product&id='+data[i].id+'&returnto=productPage.jsp">' + data[i].titolo+'</a></div>');
	            		

	            		
					}
	            	
	            	
	            	
            	} else {
            		
            		$("#risultati").empty();
            		$("#risultati").removeClass( "DivRisultati" );
            		$("#barraRicerca").css({"border-bottom-left-radius":"20px"});
	            	$("#barraRicerca").css({"border-bottom-right-radius":"20px"});
            	}
            	
            	if(stringaParziale === ""){
            		
            		$("#risultati").removeClass( "DivRisultati" );
            		$("#barraRicerca").css({"border-bottom-left-radius":"20px"});
	            	$("#barraRicerca").css({"border-bottom-right-radius":"20px"});
            	}
            	
            	
            },
            error: function(jqXHR, textStatus, errorThrown){
            	console.log(jqXHR);
            } 
        });
	}
	
</script>
    
    
  
   