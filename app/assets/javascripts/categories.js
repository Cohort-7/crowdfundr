$(document).ready(function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  // $('#search-form').on('submit ajax:beforeSend', function(ev){
  //   ev.preventDefatult();
  //   $('#search-submit').attr('disabled', 'disabled');

  //   $.getScript('categories/index')
  // });
});