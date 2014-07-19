function ajaxComment(e) {
	e.preventDefault();
	$.ajax({
		url: window.location.pathname + '/comments',
		type: 'POST',
		dataType: 'script',
		data: $(this).serialize()
	});
}
