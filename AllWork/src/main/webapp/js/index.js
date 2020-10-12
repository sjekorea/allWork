
		jQuery(document).ready(function(){

		jQuery("#dropMenuWrap").hide();

		jQuery("#gnb #nav li").mouseover(function(){
		jQuery("#dropMenuWrap").stop().slideDown(500);
		});


		jQuery("#dropMenuWrap").mouseout(function(){
		jQuery("#dropMenuWrap").stop().slideUp(500);
		});

	
		jQuery("#searchBtn").click(function(){
		jQuery("#searchArea").css({"display":"block"});
		});

		jQuery(".searchx").click(function(){
		jQuery("#searchArea").css({"display":"none"});
		});

		jQuery(".sublist").css({"display":"none"});

		jQuery(".sublist").hide();
		jQuery("#moblist p").click(function(){
		jQuery(".sublist").slideUp(500,"swing");
		jQuery(this).next().slideDown(500,"swing");
		});

		jQuery(".mobMenu").click(function(){
		jQuery("#mobMenulist").css({"display":"block"});
		});

		jQuery(".menux").click(function(){
		jQuery("#mobMenulist").css({"display":"none"});
		});

		
		});
