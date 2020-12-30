//픽스네비게이션
    $(window).scroll(function(){
      var nowScroll=$(document).scrollTop();
      if(nowScroll>0){
        $("#headerWrap").stop().animate({"top":"-40px"},50);
      }
      else{
        $("#headerWrap").stop().animate({"top":"0px"},50);
      }
    });


jQuery(document).ready(function(){

  		jQuery("#allMenuWrap").css({"display":"none"});

  		jQuery("#headerWrap #head .nav").first().click(function(){
  			jQuery("#allMenuWrap").show();
  		});

      jQuery(".fa-times-circle").first().click(function(){
  		jQuery("#allMenuWrap").css({"display":"none"});
  		});
});
