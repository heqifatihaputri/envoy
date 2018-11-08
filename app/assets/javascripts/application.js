// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-dynamic-selectable
//= require turbolinks
//= require_tree .

// jQuery(function() {
//   var users;
//   $('#invite_user_id').parent().hide();
//   users = $('#invite_user_id').html();
//   console.log(users);
//   return $('#invite_location_id').change(function() {
//     var location, escaped_location, options;
//     location = $('#invite_location_id :selected').text();
//     escaped_location = location.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
//     options = $(users).filter("optgroup[label=" + escaped_location + "]").html();
//     console.log(options);
//     if (options) {
//       $('#invite_user_id').html(options);
//       return $('#invite_user_id').parent().show();
//     } else {
//       $('#invite_user_id').empty();
//       return $('#invite_user_id').parent().hide();
//     }
//   });
// });