$(document).ready(function(){
	$(".show_description").click(function(){
		div = $(this).attr("id");
		$("."+div).toggle();
		
		if ($(this).html() == "Detalhes"){
			$(this).html("Ocultar");
		}
		else{
			$(this).html("Detalhes");
		}
	})
	$(".message").click(function(){
		$(this).fadeOut();
	})
	
});
