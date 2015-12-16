// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require flat-ui
$(document).ready(function(){
  $("#vcode").click(function(){
    currentSrc = $(this).attr('src')
    $(this).attr('src', currentSrc.split('?')[0] + '?' + (new Date()).getTime())
  })
})
