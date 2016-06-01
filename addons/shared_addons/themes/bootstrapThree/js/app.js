// Autor: William Villalba
// Email: williamvillalba13@gmail.com}

$(window).load(function(){  
  $('#preload').slideUp(300);
  
  //MENU ACTIVO
  $(function(){    
      url_completa = location.href; 
      url_incio = url_completa.lastIndexOf("/"); 
      pagina_actual = url_completa.slice(url_incio+1);
      $("nav li a[href='"+ pagina_actual +"']").addClass("activo");            
      if(pagina_actual == ""){
          $("nav li a[href='index.php']").addClass("activo"); 
      }
  });

  //MENU POSICION
  $(window).scroll(function()  {
      if ($(this).scrollTop() > 110) $('header').addClass("fixed_menu").addClass("fadeInDownBig").addClass('animated');
      else $('header').removeClass("fixed_menu").removeClass("fadeInDownBig").removeClass('animated');;
  });  

  //ALERTAS
  setInterval(function() {
        $(".alert").slideUp();
  }, 3000);
});

$(function(){

  //HEADER LOGIN Y REGISTRO
  $(".login").click(function(){
    if($(".bg_login").css("margin-top")=="-165px" && $(".bg_register").css("margin-top")=="-165px"){
      $(".bg_login").removeClass("bg_action");
      $(".bg_login").animate({'margin-top':'0'},{queue:false, duration:800, easing:''});
      $('header').css({"position":"relative"});
      $('.barra_int').css({"display":"none"});
    }
    if($(".bg_login").css("margin-top")=="0px"){
      $(".bg_login").animate({'margin-top':'-165px'},500,
        function(){
          $(".bg_login").addClass("bg_action");
          $('header').removeAttr('style')
          $('.barra_int').css({"display":"block"});
        });
    }
    if($(".bg_register").css("margin-top")=="0px" && $(".bg_login").css("margin-top")=="-165px"){
      $(".bg_register").animate({'margin-top':'-165px'},500,
        function() {
          $(".bg_register").addClass("bg_action");
          $(".bg_login").removeClass("bg_action");
            $(".bg_login").animate({'margin-top':'0'},{queue:false, duration:800, easing:''});
          });
    }
  });
  $(".register").click(function(){
    if($(".bg_register").css("margin-top")=="-165px" && $(".bg_login").css("margin-top")=="-165px"){
      $(".bg_register").removeClass("bg_action");
      $(".bg_register").animate({'margin-top':'0'},{queue:false, duration:800, easing:''});
      $('header').css({"position":"relative"});
      $('.barra_int').css({"display":"none"});
    }
    if($(".bg_register").css("margin-top")=="0px"){
      $(".bg_register").animate({'margin-top':'-165px'},500,
        function(){
          $(".bg_register").addClass("bg_action");
          $('header').removeAttr('style')
          $('.barra_int').css({"display":"block"});
        });
    }
    if($(".bg_login").css("margin-top")=="0px" && $(".bg_register").css("margin-top")=="-165px"){
      $(".bg_login").animate({'margin-top':'-165px'},500,
        function() {
          $(".bg_login").addClass("bg_action");
          $(".bg_register").removeClass("bg_action");
            $(".bg_register").animate({'margin-top':'0'},{queue:false, duration:800, easing:''});
          });
    }
  });
  /*login head*/
  $(".close_login").click(function(){      
      if($(".bg_login").css("margin-top")=="0px"){
      $(".bg_login").animate({'margin-top':'-165px'},500,
        function(){
          $(".bg_login").addClass("bg_action");
          $('header').removeAttr('style')
          $('.barra_int').css({"display":"block"});
        });
      }    
  });
  $(".close_register").click(function(){      
      if($(".bg_register").css("margin-top")=="0px"){   
      $(".bg_register").animate({'margin-top':'-165px'},500,
        function(){
          $(".bg_register").addClass("bg_action");
          $('header').removeAttr('style')
          $('.barra_int').css({"display":"block"}); 
        });
    }
  });

  //IDIOMAS
  $('.idiomas a').click(function(event) {
    $(".idiomas a").removeClass('active_idiomas')    
  });

  //MENU DESPLEGABLE PERFIL
  $(".user_menu a").hover(function() {
      $(this).next(".subnav_menu").addClass("slow_nav")
  }, function() {
      $(this).next(".subnav_menu").removeClass("slow_nav")
  }); 
  $(".subnav_menu").hover(function() {
      $(this).addClass("slow_nav")
  }, function() {
      $(this).removeClass("slow_nav")
  });

  //SUBMENUS
  $('nav li .dropdown').css({'display':'none'}); 
  $('nav li').hover(
      function(){
        $('nav li').not($('.dropdown', this)).stop();
        $('.dropdown', this).slideDown('fast');
      },
      function(){
        $('.dropdown', this).slideUp('fast');
      }
  );  
  //SUB MENU PRODUCT
  $('nav li .subnav').css({'display':'none'}); 
  $('nav li').hover(
      function(){
        $('nav li').not($('.subnav', this)).stop();
        $('.subnav', this).slideDown('fast');
      },
      function(){
        $('.subnav', this).slideUp('fast');
      }
  );  
  $(".subnav ul.list-group li.list-group-item").children("a").addClass("lvl_1");
  $(".subnav ul.list-group li").hover(function(){
      var id_lvl_1 = $(this).attr("id");
      var position_right = $(this).width()+5;
      //alert(id_lvl_1);
      if(!$(".subnav .sub_"+id_lvl_1).is(":visible")){    
          $(".subnav .sub_"+id_lvl_1).css({"display":"block","position":"absolute","margin-left":position_right,"margin-top":"-29px"});
           $(".sub_"+id_lvl_1+" a").css({"color":"#FFF!important"});
      }else{
          $(".subnav .sub_"+id_lvl_1).css("display","none");
      }
  });





  
  //NAV RESPONSIVE
  $('.nav-resp').click(function() {
    $(this).toggleClass('activo-nav');
    $("html").toggleClass('nav_opened');    
  });
  $('.over_nav').click(function() {
    $('.nav-resp').removeClass('activo-nav');
    $("html").removeClass('nav_opened');    
  });  
  $('.menu_nav li a').click(function() {    
    $(this).toggleClass('active_responsivve_menu');    
    $(this).next('.sub_nav_resp').toggleClass('opening');
  });  
  $('.menu_nav .sub_nav_resp li a').click(function() {
    $(this).toggleClass('active_responsivve_menu');
    $(this).next('.subcateg').toggleClass('opening2');
  });    
  // $('.content_all').innerWidth($(window).innerWidth());
  // $(window).resize(function(){
  //   $('.content_all').innerWidth($(window).innerWidth());
  // });

  //TAB SUB MENU
  $('nav li .nav_vista').each(function() {
    var posicion;
    $(this).find('.submenu a').eq(0).addClass('activo_tab');
    $(this).find('.cont_nav .conten_categ').eq(0).fadeIn();

    $('.submenu a').hover(function(){      
      $('.submenu a').removeClass('activo_tab');      
      $(this).addClass('activo_tab');
      $('.cont_nav .conten_categ').hide();      
      posicion = $(this).index();
      $('.cont_nav .conten_categ').eq(posicion).fadeIn(100);

      $('.product_dest_nav .bounceIn').removeClass('animated').addClass('animated');
    });

  });  

  //SLIDER
  var slider;
  slider = jQuery('.tp-banner').revolution({
      delay:6000,
      startwidth:1170,
      startheight:547,
      hideThumbs:200,
      fullWidth:"on",
      forceFullWidth:"on",

      thumbWidth:100,
      thumbHeight:50,
      thumbAmount:5,
      
                              
      simplifyAll:"off",

      navigationType:"bullet",
      navigationArrows:"solo",
      navigationStyle:"preview4",

      touchenabled:"on",
      onHoverStop:"on",
      nextSlideOnWindowFocus:"off",

      swipe_threshold: 0.7,
      swipe_min_touches: 1,
      drag_block_vertical: false,
      
      parallax:"mouse",
      parallaxBgFreeze:"on",
      parallaxLevels:[7,4,3,2,5,4,3,2,1,0],                              
                              
      keyboardNavigation:"off",

      navigationHAlign:"center",
      navigationVAlign:"bottom",
      navigationHOffset:0,
      navigationVOffset:30,

      soloArrowLeftHalign:"left",
      soloArrowLeftValign:"center",
      soloArrowLeftHOffset:20,
      soloArrowLeftVOffset:0,

      soloArrowRightHalign:"right",
      soloArrowRightValign:"center",
      soloArrowRightHOffset:20,
      soloArrowRightVOffset:0,

      shadow:0,
      fullWidth:"on",
      fullScreen:"off",

      spinner:"spinner2",
      
      stopLoop:"off",
      stopAfterLoops:-1,
      stopAtSlide:-1,

      shuffle:"off",

      autoHeight:"off",
      forceFullWidth:"off",           
      
      hideThumbsOnMobile:"off",
      hideNavDelayOnMobile:1900,
      hideBulletsOnMobile:"off",
      hideArrowsOnMobile:"off",
      hideThumbsUnderResolution:0,

      hideSliderAtLimit:0,
      hideCaptionAtLimit:0,
      hideAllCaptionAtLilmit:0,
      startWithSlide:0
  });

  //MARCAS
  $('.carrusel_marcas').owlCarousel({
      loop:true,
      margin:0,
      nav:true,
      pagination : false,
      responsive:{
          0:{
              items:1
          },
          380:{
              items:2
          },
          620:{
              items:3
          },
          850:{
              items:5
          }
      }
  });

  //DETALLE    
  $('.cont_tab_det').eq(0).fadeIn();
  $('.tab_detalle a').click(function(){
      $('.tab_detalle a').removeClass('active_detalle');
      $(this).addClass('active_detalle');
      $('.cont_tab_det, .form_cometar').slideUp(400);
      var mostrar_tab = $(this).attr('href');
      $(mostrar_tab).slideDown(500);
      return false;
  });
  $('.comentar').click(function(){
      $('.cont_tab_det').slideUp(400);
      $('.form_cometar').slideDown(500);
      return false;
  });
  $('.comnet_user').owlCarousel({
      loop:true,
      margin:0,
      nav:true,
      pagination : true,
      responsive:{
          0:{
              items:1
          },
          380:{
              items:1
          },
          620:{
              items:1
          },
          850:{
              items:1
          }
      }
  });

  //DESTACADOS
  $('.destacados li .marco_prod').hover(function() {
    $(this).find('.btn_blanco').addClass('bounceInUp').addClass('animated');
  }, function() {
    $(this).find('.btn_blanco').removeClass('bounceInUp').removeClass('animated');  
  });

  //GALERIA MODAL
  $('.imagenes_peq_produc img').eq(0).addClass('activo_galeria_producto');
  var srcPoduc;
  if($('.imagenes_peq_produc img').length){
    $('.imagenes_peq_produc img').click(function() {
      $('.imagenes_peq_produc img').removeClass('activo_galeria_producto');
      $(this).addClass('activo_galeria_producto');
      srcPoduc = $(this).attr('src');
      $('.imagen_grande_produc img').attr('src',srcPoduc);
      $('.zoom').zoom();
    });
  }

  //TALLAS
  $('.detalle_prod .tallas a').click(function(event) {
    $('.detalle_prod .tallas a').removeClass('activo_talla');
    $(this).addClass('activo_talla');    
  }); 
  $('.datos_detalle .tallas a').click(function(event) {
    $('.datos_detalle .tallas a').removeClass('activo_talla');
    $(this).addClass('activo_talla');    
  }); 

  //MODALES  
  $('.modal_all').magnificPopup({
    delegate: 'a',
    removalDelay: 500, 
    callbacks: {
      beforeOpen: function() {
         this.st.mainClass = this.st.el.attr('data-effect');
      }
    },
    fixedContentPos: true,
    midClick: true
  }); 
  $('.popup_youtube, .popup_vimeo, .popup_gmaps').magnificPopup({
    disableOn: 1000,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false,
    zoom: {
      enabled: true,
      duration: 300, // don't foget to change the duration also in CSS
      opener: function(element) {
        return element.find('img');
      }
    }
    // iframe: {
    //   markup: '<div class="mfp-iframe-scaler">'+
    //             '<div class="mfp-close"></div>'+
    //             '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
    //             '<div class="mfp-title"><a href="https://www.youtube.com/channel/UCJ3KWv64AxrdfKRFKr2uBSw" target="_blank"><i  class="icon-youtube3"></i>Ir al Canal oficial</a></div>'+
    //           '</div>'
    // },
    // callbacks: {
    //   markupParse: function(template, values, item) {
    //    values.title = item.el.attr('title');
    //   }
    // }
  });
  $('.popup_gallery').magnificPopup({
    delegate: 'a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
    },
    zoom: {
      enabled: true,
      duration: 300, // don't foget to change the duration also in CSS
      opener: function(element) {
        return element.find('img');
      }
    }
  });

  //ANIMACIONES
  wow = new WOW(
      {
        animateClass: 'animated',
        offset: 1
      }
  );  
  wow.init();

  //ALL PRODUCTS
  $(function(){
    // $('.container').mixItUp();
    var $filterSelect = $('.filtro_select'),
        $sortSelect = $('.filtro_orden'),
        $container = $('.container');
    
    $container.mixItUp({
      animation: {
        duration: 400,
        effects: 'fade rotateX(-45deg) translateY(-10%)'
      },
      // load: {
      //   filter: '.category-1'
      // }
    });  
    
    // $filterSelect.on('change', function(){
    //   $container.mixItUp('filter', this.value);
    // });
    
    // $sortSelect.on('change', function(){
    //   $container.mixItUp('sort', this.value);
    // });
  });

  //PERFIL 
  // $('.sllider_option li a').eq(0).addClass('active_perf');
  // $('.cont_cat_perfil').eq(0).fadeIn();
  // $('.sllider_option li a').click(function(){
  //     $('.sllider_option li a').removeClass('active_perf');
  //     $(this).addClass('active_perf');
  //     $('.cont_cat_perfil').slideUp(400);
  //     var mostrar_prod = $(this).attr('href');
  //     $(mostrar_prod).slideDown(500);
  //     return false;
  // });
  $('.guardar_perfil').click(function(){
    $('.cont_cat_perfil input, .cont_cat_perfil select, .cont_cat_perfil textarea').attr({'disabled':'disabled'});
    $('.contra_new, .controles_perfil').removeClass('contra_new_open'); 
    $("body").animate({ scrollTop : $( $('.idiomas') ).offset().top}, 300); 
  });
  $('.guardar_perfil').click(function(){
    $('.cont_cat_perfil input, .cont_cat_perfil select, .cont_cat_perfil textarea').attr({'disabled':'disabled'});
    $('.contra_new, .controles_perfil').removeClass('contra_new_open'); 
    $("body").animate({ scrollTop : $( $('.idiomas') ).offset().top}, 300); 
  });

  //DIRECCIONES
  $('.sabe_dir').click(function(){
    $('.mis_dire_cread').slideDown(200);
    $('.form_direc').slideUp(200);
  });
  

  //LISTA DE PRODUCTOS
  $('.conten_subCagtegori').eq(0).addClass('conten_subCagtegori_open');
  $('.list_cat a').eq(0).addClass('active_acord');
  $('.list_cat a').click(function() {
    $(this).toggleClass('active_acord');
    $(this).parent().find('.conten_subCagtegori').toggleClass('conten_subCagtegori_open');
  }); 

  //QUIENES SOMOS MULTIPLE
  $(".nosotros_items a").eq(0).addClass("activo_item");
  $(".cont_tab").eq(0).slideDown();
  $(".nosotros_items a").click(function() {
      $(".cont_tab").slideUp();
      var e = $(this).attr("href");
      $(".nosotros_items a").removeClass("activo_item");
      $(this).addClass("activo_item");
      $(e).slideDown(600);
      return false
  });

  //BUSCADOR
   $('.search_button').click(function() {
      $('.bg_buscador_over').addClass('bg_buscar_open');
  });
  $('.bg_buscador_over .close_login').click(function() {
      $('.bg_buscador_over').removeClass('bg_buscar_open');
  });

  //ALERT
  //$('.session-message-box').addClass('open_alert').delay(3000).removeClass('open_alert'); 
  $('.session-message-box').fadeIn('fast').delay(3000).fadeOut('slow'); 
  $('.alert-success').click(function(event) {
    $('.session-message-box').fadeOut('slow'); 
  });

  //PAGINADOR

  //IFRAME
  $('iframe').each(function(){
    var ifr_source = $(this).attr('src');
    var wmode = 'wmode=opaque';
    if(ifr_source.indexOf('?') != -1) {
    var getQString = ifr_source.split('?');
    var oldString = getQString[1];
    var newString = getQString[0];
    $(this).attr('src',newString+'?'+wmode+'&'+oldString);
    }
    else $(this).attr('src',ifr_source+'?'+wmode);
  });

  //PROMO HOME
  var count = $(".product_promocion_home").children().length;
  if(count > 1){    
    $(".product_promocion_home li").removeClass('large-12').addClass('large-6').removeClass('medium-12').addClass('medium-6').removeClass('promo_uno');
  }else{    
    $(".product_promocion_home li").removeClass('large-6').addClass('large-12').removeClass('medium-6').addClass('medium-12').addClass('promo_uno');
  } 

  //TOP UP
  $(window).scroll(function(){
    if ($(this).scrollTop() > 200) {
      $('.top_up').css("bottom","0px");
    } else {
      $('.top_up').css("bottom","-115px");
    }
  });
  $('.top_up').click(function(){
    $("html, body").animate({ scrollTop: 0 }, 600);
    return false;
  });

});


// $(document).ready(function(){
//   //PERFIL CARRUSEL
//    window.onresize = function() {  
//     var anchoPantalla = document.documentElement.offsetWidth;    
//     if(anchoPantalla <= 620 ){
//         $('.sllider_option').owlCarousel({
//             loop:false,
//             margin:0,
//             nav:true,
//             pagination : false,
//             responsive:{
//                 0:{
//                     items:2
//                 },
//                 380:{
//                     items:2
//                 },
//                 620:{
//                     items:3
//                 },
//                 850:{
//                     items:5
//                 },
//                 1200:{
//                     items:5
//                 }
//             }
//         });   
//     }
//     else
//       $(".sllider_option").data('owlCarousel').destroy();
//     }

// });


//CHAT
function abrir_chat(){
  if ($('#chat').hasClass('chat_close')){
    document.getElementById('chat').className='client-window';
  }else{
    document.getElementById('chat').className='chat_close';
  }
}

function cerrar_chat(){
  if ($('#chat').hasClass('client-window')){
    document.getElementById('chat').className='chat_close';
  }else{
    document.getElementById('chat').className='client-window';
  }
}