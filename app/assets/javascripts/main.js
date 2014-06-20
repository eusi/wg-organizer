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


//converts username-string to hex and cuts the result after 6 chars = personal hex color
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

//shows unit for amount-checkbox in div aside
/* //, :onchange => 'setSelect();'
function setSelect()
{
	var x = document.getElementById("completedtask_task_id").selectedIndex;
	var y = document.getElementById("completedtask_task_id").options;
	$("#amountName").text( y[x].name );
}*/