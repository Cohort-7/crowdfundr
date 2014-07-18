function ajaxComment(e) {
	$.ajax({
		url: window.location.pathname + '/comments',
		type: 'POST',
		dataType: 'script'
	})
}
