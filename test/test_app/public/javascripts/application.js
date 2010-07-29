$(document).ready(function(){
	
	$('ul.star-rating li a').mouseover(function(){
		$(this).css('width',pixel_rating_width($(this).html()));
		$(this).css('left','0px');
	});
	
	$('ul.star-rating li a').mouseout(function(){
		$(this).css('width','25px');
		$(this).css('left',pixel_rating_left($(this).html()));
	});
	
	$('ul.star-rating li a').click(function(){
		$.post($(this).closest('.rating').find('input.url').val(), { rating: { score: parseInt($(this).html()) } },
		 		function(data){
					$('ul.star-rating li.current-rating').css('width',pixel_rating_width(data.rating.rateable_average_rating))
				});
	});
	
});

function pixel_rating_width(value){
	return Math.round(parseFloat(value) * 25.0)
}

function pixel_rating_left(value){
	return Math.round((parseFloat(value) * 25.0) - 25.0)
}