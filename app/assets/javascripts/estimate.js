$(window).scroll(function(){
  var top = $(this).scrollTop();
  var height = $(window).height();
  if(top < (80)){
    $(".header-title").fadeOut(500);
  }
  else if(top < height-130) {
    $(".header-title").fadeIn(500);
  }
});


// to prevent a form from submitting w/out being fully filled out.
$(function(){
  $("form").submit(function(e){
    var form_elements = $('.f-elem');
    var incomplete = false;
    for(var i=0 ; i< form_elements.length ; i++ ){
      if(form_elements[i]==''){
        incomplete = true;
      }
    }
    if(incomplete == true){

      e.preventDefault();
      return false;
    }
  })
})