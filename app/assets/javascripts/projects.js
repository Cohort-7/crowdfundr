$(document).on('ready page:load', function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 400) {
        $('.pagination').text("Fetching more projects...");
        return $.getScript(url);
      }
    });
  }
});