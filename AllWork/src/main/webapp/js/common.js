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

  //드랍메뉴 열고 닫기
  		jQuery("#allMenuWrap").css({"display":"none"});

  		jQuery("#headerWrap #head .nav").first().click(function(){
  		jQuery("#allMenuWrap").show();
  		});

      jQuery(".fa-times").first().click(function(){
  		jQuery("#allMenuWrap").css({"display":"none"});
  		});

  //메인페이지 팝업창 닫기
  		jQuery("#popupClose").click(function(){
  		jQuery("#popupWrap").hide();
  		});

  //유료옵션서비스 팝업창 닫기
  		jQuery("#popupClose").click(function(){
  		jQuery("#popupWrap_payService").hide();
  		});

      jQuery(".descBtn01").click(function(){
  jQuery(".agreeDesc01").slideToggle(50);
});

jQuery(".descBtn02").click(function(){
jQuery(".agreeDesc02").slideToggle(50);
});

jQuery(".question").click(function(){
jQuery(".answer").slideUp(50);
jQuery(this).next(".answer").slideDown(50);
});


});
