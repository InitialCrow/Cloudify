(function(ctx,$){

	var app = {
		init : function(){
			this.deleteFiles();
		},

		deleteFiles : function(){
			var $checked = $('.check');
			
			$checked.on('change', function(evt){
				var file = {};
				var $this = $(this);
				file.url = $this.attr('data-url');
				file.id = $this.attr('data-id');

				if($this[0].checked === true){
					if($($this.next()).attr('class') === 'readyToSend'){
						$this.next().next().remove();
						$this.next().remove();
					}
					$this.after("<input class='readyToSend' name='url[]' type='hidden' value="+file.url+">");
					$this.after("<input class='readyToSend' name='id[]' type='hidden' value="+file.id+">")
				}
				else{
					console.log($this.next())
					if($($this.next()).attr('class') === 'readyToSend'){
						$this.next().next().remove();
						$this.next().remove();
					}

				}

				
			});
			
			}

	}
	ctx.app = app
	var self = app

})(window, jQuery);