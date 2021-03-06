// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require flat-ui
//= require unslider
$(document).ready(function(){
  slider = $('.banner').unslider({
    dots: true,
    arrows:false,
    nav:false,
    delay:1000,
  });
  data = slider.data('unslider');

  $('.category-option').each(function(){
    $(this).on('click',function(){
      data.move($(this).attr("value"));
    });
  })
  $("#vcode").click(function(){
    currentSrc = $(this).attr('src');
    $(this).attr('src', currentSrc.split('?')[0] + '?' + (new Date()).getTime());
  })
})
