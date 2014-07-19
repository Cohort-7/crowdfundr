$(document).ready(function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  $('#search-form').on('ajax:beforeSend', function(ev){
    ev.preventDefatult();
    $('')
    $.getScript('searches/index')
  });
});