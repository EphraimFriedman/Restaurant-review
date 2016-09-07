$(document).ready(function() {

	$('#post_form').submit(function(event){
		event.preventDefault()
		
		$.ajax({
			method: 'post',
			url: $(event.target).attr('action'),
			data: $(event.target).serialize()
		}).done(function(response){
			$('.post').first().before(response)
			$(event.target).find('input[type=text]').val('')
			$(event.target).find('textarea').val('')
			});
	});

	









});