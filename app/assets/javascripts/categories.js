$(document).on('ready page: load', function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  $(function(){
    $('#search-form').on('submit', function(ev){
      ev.preventDefault();

      var searchValue = $('#search-input').val();
      $.getScript('categories?search=' + searchValue);
    });
  });
})