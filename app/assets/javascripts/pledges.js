function createPledge(e) {
	e.preventDefault();

	$.ajax({
		url: $(this).attr('action'),
		type: 'POST',
		datatype: 'script',
		beforeSend: function() {
			$(this).attr('disabled', 'disabled').css("background-color", "grey");
		},
		complete: function() {
			$(this).removeAttr('disabled').removeAttr("style");
		}
	});
}
