$(window).scroll(function(){
  var top = $(this).scrollTop();
  var height = $(window).height();
  if(top < (height/2)){
    $(".header-title").fadeOut(500);
  }
  else {
    $(".header-title").fadeIn(500);
  }
});
