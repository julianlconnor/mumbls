
$(document).ready(function(){
  $('input').emptyonclick(); 
});

$(document).ready(function() {  
    $('#flash_notice').fadeIn('slow', function() {
      $('#flash_notice').delay(8000).fadeOut('slow'); 
    }); 
});


