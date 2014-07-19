$(document).ready(function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  $('#search-form').on('submit', function(ev){
    ev.preventDefault();

    var searchValue = $('#search-input').val();
    $.getScript('categories?search=' + searchValue);
  });
});