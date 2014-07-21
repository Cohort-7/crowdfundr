function ajaxComment(e) {
	e.preventDefault();
	$.ajax({
		url: window.location.pathname + '/comments',
		type: 'POST',
		dataType: 'script',
		data: $(this).serialize(),
		beforeSend: function() {
			$('#new_comment input[type="submit"]').attr('disabled', 'disabled').css("background-color", "grey");
		},
		complete: function() {
			$('#new_comment input[type="submit"]').removeAttr('disabled').removeAttr("style");
		}
	});
}

function loadComments(e) {
	e.preventDefault();
	if ( !$(this).hasClass('disabled') ) {
		var c = $(this).data('c');
		$.ajax({
			url: window.location.pathname + '?c=' + c,
			type: 'GET',
			dataType: 'script',
			context: this,
			beforeSend: function() {
				$(this).addClass('disabled').css("background-color", "grey");
				$(this).data('c', c + 1);
			},
			complete: function() {
				$(this).removeClass('disabled').removeAttr("style");
			}
		});
	}
}
