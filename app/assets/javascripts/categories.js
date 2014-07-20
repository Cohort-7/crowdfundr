$(document).on('ready page: load', function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});

  $(function(){
    $('#search-form').on('submit', function(ev){
      ev.preventDefault();
      $('#search-submit').val('Searching...').attr('disabled', 'dsiabled');
      var searchValue = $('#search-input').val();
      $.getScript('categories?search=' + searchValue).done(function(){
        $('#search-submit').val('Go!').removeAttr('disabled');
      });
    });
  });
})