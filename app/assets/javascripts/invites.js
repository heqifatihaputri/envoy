# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(function() {
  var users;
  $('#invite_user_id').parent().hide();
  users = $('#invite_user_id').html();
  console.log(users);
  return $('#invite_location_id').change(function() {
    var location, escaped_location, options;
    location = $('#invite_location_id :selected').text();
    escaped_location = location.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(users).filter("optgroup[label=" + escaped_location + "]").html();
    console.log(options);
    if (options) {
      $('#invite_user_id').html(options);
      return $('#invite_user_id').parent().show();
    } else {
      $('#invite_user_id').empty();
      return $('#invite_user_id').parent().hide();
    }
  });
});