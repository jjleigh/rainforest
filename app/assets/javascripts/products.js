# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready page:load', functon() {
	$(window).scroll(function() {
		if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
			console.log($('.pagination span.next').children().attr('href'));
			$.getScript($('.pagination span.next').children().attr('href'));
		}
	});
	// $('#search-form').submit(function(event) {
	// 	event.preventDefault();
	// 	var searchValue = $('#search').val();

	// 	$.get('/products?search=' +searchValue)
	// 		.done(function(data){
	// 			console.log(data);
	// 			$('#products').html(data);
	// 		});
	// 	});
	});