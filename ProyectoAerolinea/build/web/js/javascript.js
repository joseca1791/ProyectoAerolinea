 $( function() {							//Para la Ventana de promo de CANCUN
    $( ".dialogCancun" ).dialog({
      autoOpen: false,
	  modal:true,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".openerCancun" ).on( "click", function() {
      $( ".dialogCancun" ).dialog( "open" );
    });
  } );


 $( function() {						//Para la Ventana de promo de PERU
    $( ".dialogPeru" ).dialog({
      autoOpen: false,
	  modal:true,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".openerPeru" ).on( "click", function() {
      $( ".dialogPeru" ).dialog( "open" );
    });
  } );
  
  
  $( function() {								//Para la Ventana de promo de NEW YORK
    $( ".dialogNY" ).dialog({
      autoOpen: false,
	  modal:true,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".openerNY" ).on( "click", function() {
      $( ".dialogNY" ).dialog( "open" );
    });
  } );
  
  
  
  $( function() {									//Para la Ventana de promo de Paris
    $( ".dialogParis" ).dialog({
      autoOpen: false,
	  modal:true,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".openerParis" ).on( "click", function() {
      $( ".dialogParis" ).dialog( "open" );
    });
  } );
  
  
    $( function() {									//Para la Ventana de promo de Paris
    $( ".dialogParis" ).dialog({
      autoOpen: false,
	  modal:true,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( ".openerParis" ).on( "click", function() {
      $( ".dialogParis" ).dialog( "open" );
    });
  } );
  

    $( function() {
    var availableTags = [
            "COSTA RICA",
			"CANCUN",
			"PERU",
			"NEW YORK",
			"PARIS",
			"GUATEMALA",
			"LA HABANA",
			"BARCELONA"
			
    ];
    $( ".paises" ).autocomplete({
      source: availableTags
    });
  } );