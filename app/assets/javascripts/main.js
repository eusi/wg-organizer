$(document).ready(function(){

	//modal for main/payoff
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

	//select/unselect all for addjob/index
	$('#check_all').on("click", function(){ $('input[type="checkbox"]').click(); });

});


//converts username-string to hex and cuts the result after 6 chars = personal hex color - am a genius :)
function personalHexColor(str) 
{
	var hex = '';
	for(var i=0;i<str.length;i++) {
		hex += ''+str.charCodeAt(i).toString(16);
	}
	var backwayHex = hex.split("").reverse().join("");
	return backwayHex.substring(0, 6);;
}


//creates an gravatar url <3
function setPersonalGravatarUrl(str) 
{
	return 'http://www.gravatar.com/avatar/' + personalHexColor(str) + '?r=PG&s=150&default=identicon';
}


//shows unit for amount-checkbox for job-/index in placeholder of amount itself - really cool! ;D
function setSelect(element)
{
	var x = element.selectedIndex;
	var y = element.options;
	var amount = $(y[x]).attr('unit');
	$("#completedtask_amount").attr("placeholder", "Amount (in "+ amount + ", if needed)");
}


//shows unit for amount-checkbox for job-/index in placeholder of amount itself - really cool! ;D
function setSelectById(elementId)
{
	var x = document.getElementById( elementId ).selectedIndex;
	var y = document.getElementById( elementId ).options;
	var amount = $(y[x]).attr('unit');
	$("#completedtask_amount").attr("placeholder", "Amount (in "+ amount + ", if needed)");
}