

<link rel="stylesheet" href="styles/navbar-style.css">





<div class="navbar">
            <div class="icon">
                <a href="index.jsp"><h2 class="logo">UC</h2></a>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="ourTeam.jsp">ABOUT</a></li>
                    <li><a href="Catalog.jsp">PRODUCTS</a></li>
                </ul>
            </div>

            <div class="search">
                <input class="srch"type="search"id="queryRicerca" onkeyup="funzioneRicerca()" placeholder="Cerca prodotti">
                <button class="btn-search" id="pulsanteRicercaResponsive">Search</button>
                <div id="risultati">
                </div>
            </div>
            

            <div class="shop">

            <ul>
              	<li><a href="cart.jsp"><img class="shop_icon" src="images/navbar/shop.png" alt=""></a></li>
                <li><a href="AreaUtente.jsp"><ion-icon name="person-outline" class="icona"></ion-icon></a></li>
            </ul>


            </div>



  </div>

     <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="JavaScript/jquery-3.6.0.min.js" type="text/javascript"></script>	
    
    
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
    
    
  
   