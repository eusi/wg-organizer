$(document).ready(function(){
	$("a[rel='external']").attr('target','_blank');	        //automatically open external links open in new window/tab
	$("#topnav li a").addClass("hovFade");                  // for some things we add the hover fade class here instead of adding a class manually
	$("#topnav li a:not(:last)").bind("click", function(){	// nicify the site nav depressed states
		$("#topnav li a").css("background-position", "top left");
      $(this).css("background-position", "bottom left");
    });

	var oldOpacity = "0";
	$(".hovFade").hover(
		function () {
			oldOpacity = $(this).css("opacity");		
		$(this).animate({opacity: '1'},{"duration":200});
	},
	function () {
		$(this).animate({opacity: oldOpacity},{"duration":200});
	}
	);
});