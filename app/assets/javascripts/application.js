// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require turbolinks
//= require_tree .

$(document).on('page:load ready', function() {
  var menu = $('.centered-navigation-menu');
  var menuToggle = $('.centered-navigation-menu-button');
  var signUp = $('.sign-up');
  $('#search-form').on('submit', ajaxSearch)

  $('#new_comment').submit(ajaxComment);
  $('#load-comments').click(loadComments);
  $('.create-pledge').submit(createPledge);

  $(menuToggle).on('click', function(e) {
    e.preventDefault();
    menu.slideToggle(function(){
      if(menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    });
  });
});
