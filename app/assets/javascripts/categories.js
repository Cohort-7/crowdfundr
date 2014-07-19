$(document).ready(function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  $('#search').on('submit', function(ev){
    ev.preventDefatult();
  });
});