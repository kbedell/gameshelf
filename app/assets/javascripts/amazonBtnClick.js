$(function() {
  $('#amazonbtn').mousedown(function() {
      $("#amazonbtn").attr('src','amazonbuttonclick.png');
  }).bind('mouseup mouseleave', function() {
      $("#amazonbtn").attr('src','amazonbutton.png');
  });
});
