(function(ctx,$){

	var app = {
		init : function(){
			/*this.deleteFiles();*/
		},
		deleteFiles : function(){
			var $checked = $('.check');
			var files = {};
			$checked.on('click', function(evt){

				for(var i = 0; i<$checked.length; i++){
					if($checked[i].checked === true){
						console.log($checked[i])
						$('.readyToSend').remove();
						files.url = $($checked[i]).attr('data-url');
						files.id = $($checked[i]).attr('data-id');
						$($checked[i]).after("<input class='readyToSend' type='hidden' name='url' value="+files.url+" />");
						$($checked[i]).after("<input class='readyToSend' type='hidden' name='id' value="+files.id+" />");
					}
					if($checked[i].checked === false){
						console.log($($checked[i]))
						$('.readyToSend').remove()
						/*$($checked[i]).first().remove();*/
					}
				}

				
			});
			
				}

	}
	ctx.app = app
	var self = app

})(window, jQuery);