$(document).ready(function(){{var a=$("#baseurl").html(),t=$("#selCategory").html();parseInt($("#page_ajax").html())}$("#upload_items").scrollPagination({contentPage:a+"services/ajax_items/"+t+"/",contentData:{page_ajax:function(){return parseInt($("#page_ajax").html())}},scrollTarget:$(window),heightOffset:10,beforeLoad:function(){$("#ajax_loading").fadeIn()},afterLoad:function(a){$("#ajax_loading").fadeOut(),$("#page_ajax").html(parseInt($("#page_ajax").html())+1);$(a).fadeInWithDelay(),$("#stop_scroll").length>0&&$("#upload_items").stopScrollPagination()}}),$.fn.fadeInWithDelay=function(){var a=0;return this.each(function(){$(this).delay(a).animate({opacity:1},175),a+=100})}});