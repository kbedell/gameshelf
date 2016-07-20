$(function() {
  $('#amazonbtn').mousedown(function() {
      $("#amazonbtn").attr('src','/assets/amazonbuttonclick.png');
  }).bind('mouseup mouseleave', function() {
      $("#amazonbtn").attr('src','/assets/amazonbutton.png');
  });
});
