$(document).ready(function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});
});