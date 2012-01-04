// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require ./setup
//= require_tree ./support
//= require_tree ./libraries
//= require_tree ./src/helpers
//= require_tree ./src/views

$(function () {
  $('#header #nav li:last').addClass('nobg');
  $('.block table tr:odd').css('background-color', '#fbfbfb');
});

