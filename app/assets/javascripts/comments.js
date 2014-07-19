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
