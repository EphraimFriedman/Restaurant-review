$(document).ready(function() {

	$('#post_form').submit(function(event){
		event.preventDefault()
		
		$.ajax({
			method: 'post',
			url: $(event.target).attr('action'),
			data: $(event.target).serialize()
		}).done(function(response){
			$('.post').first().before(response)
			$(event.target).find('input[type=text], textarea').val('')
			});
	});

	$('#posts').on('submit', '.post_like', function(event){
		event.preventDefault()

		$.ajax({
			method: 'put',
			url: $(event.target).attr('action')
		})
		.done(function(response) {
			$(event.target).parent().find('.like_count').text(response['likes'])
		});
	});

});