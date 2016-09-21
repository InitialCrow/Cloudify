(function(ctx,$){

	var app = {
		init : function(){
			this.deleteFiles();
			this.addFile();
			this.switchFolder();
		},

		deleteFiles : function(){
			var $checked = $('.check');
			var $delete = $('.delete');
			var $form = $('.uploaded-form');
			
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
					if($($this.next()).attr('class') === 'readyToSend'){
						$this.next().next().remove();
						$this.next().remove();
					}

				}
			});
			$delete.on('click', function(evt){
				evt.preventDefault();

			
				$form.attr('action','delete');
				$form.submit();
			});

			
		},
		switchFolder : function(){
			var $folder = $('.folder');
			var $panel = $('.panel-body');
			var $id = null;
			var $nameFolder = null;


			$folder.on('click', function(evt){
				evt.preventDefault();
				
				$id= $(this).attr('data-id-folder');
				$nameFolder = $(this).attr('data-name-folder');
				$panel.empty();
				
				$panel.prepend('<a href="#" class="return-btn"><-</a>');
				
				if($(this).attr('href') === 'uploads/'+$nameFolder){
					evt.preventDefault();


				
					$('.panel-body').append("<ul class='file-list'></ul>")

					
				
					$('.uploaded-form').attr(('action'),'uploads/'+$nameFolder+'/folder');//ajoute un nouveau dossier
					
					$('#upload-form').append("<input class='folder-id' type='hidden' name='folder_id' value="+$id+">")
					$('.uploaded-form').append("<input class='folder-id' type='hidden' name='folder_id' value="+$id+">")

					$.ajax({
						headers: {
						    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
						},
						url : $('.uploaded-form').attr('action'),
						type :'post',
						datatype:'json',
						
						

						
						success : function(result, http, msg){
							var $fileList= $('.panel-body');
							for(var i =0; i<result.length; i++){
								
								$fileList.append("<li><input type='checkbox' class='check' name='check' data-url="+result[i].url+" data-id="+result[i].id+"><span class='file'><a href='uploads"+result[i].url+"'>"+result[i].name+"</a></span> <span class='size'>size : "+result[i].size+" octet</span> <span class='download'><a href='uploads"+result[i].url+" download='"+result[i].name+"'>Download</a></span></li>")


								
								
							}
							self.deleteFiles();
						},
						error : function(result, http, msg){
							console.log(msg);
						},

					});
				}
				
			});
		
				
				
		
		},
		addFile : function(){
			var $add = $('.add-folder');
			var $form = $('.uploaded-form');

			$add.on('click', function(evt){
				evt.preventDefault();
				$form.attr('action','/addFolder');

				$form.prepend("<input type='text' class='form-control add' placeholder='name of folder' name='addFolder'>");
				$form.prepend("<h2>Name your folder</h2>");
				$('.add').after("<button type= 'submit' class='btn btn-success add-button' >add</button>")

			});
		}

	}
	ctx.app = app
	var self = app

})(window, jQuery);
