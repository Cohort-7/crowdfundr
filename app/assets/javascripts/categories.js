$(document).on('page:load ready', function(){
	$("#category").on('change', function() {
		location.href = $(this).val()
	});
});
function ajaxSearch(ev){
  ev.preventDefault();
  $('#search-submit').val('Searching...').attr('disabled', 'dsiabled');
  var searchValue = $('#search-input').val();
  $.getScript('categories?search=' + searchValue).done(function(){
    $('#search-submit').val('Go!').removeAttr('disabled');
  });
};
