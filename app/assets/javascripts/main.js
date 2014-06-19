$(document).ready(function(){

	//modal for main (payoff)
        $(function() {
            $('#payoffOpener').bind('click', function(e) {
                e.preventDefault();
                $('#payoffModal').bPopup({
                    appendTo: 'body'
                    , zIndex: 120
                    , modalClose: false
                });
            });
         });

	//select/unselect all for addjob
	$('#check_all').on("click", function(){ $('input[type="checkbox"]').click(); });

	//load 
	//$("#payoffOpener").on("click", function(){ $("#payoffModal").load("payoff"); });
	//$("#check_all").click(function() { $("#payoffModal").load("/main/payoff"); });
	//$('#payoffModal').html('<%= escape_javascript (render :partial => "payoff") %>')
});


//convert username-string to hex and cut the result after 6 chars = personal hex color
function personalHexColor(str) 
{
	var hex = '';
	for(var i=0;i<str.length;i++) {
		hex += ''+str.charCodeAt(i).toString(16);
	}
	var backwayHex = hex.split("").reverse().join("");
	return backwayHex.substring(0, 6);;
}

//creates an gravatar url
function setPersonalGravatarUrl(str) 
{
	return 'http://www.gravatar.com/avatar/' + personalHexColor(str) + '?r=PG&s=150&default=identicon';
}