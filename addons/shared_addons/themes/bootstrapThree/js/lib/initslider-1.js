jQuery(document).ready(function(){

    var scripts = document.getElementsByTagName("script");

    var jsFolder = "";

    for (var i= 0; i< scripts.length; i++)

    {

        if( scripts[i].src && scripts[i].src.match(/initslider-1\.js/i))

            jsFolder = scripts[i].src.substr(0, scripts[i].src.lastIndexOf("/") + 1);

    }

    jQuery("#amazingslider-1").amazingslider({

        jsfolder:jsFolder,

        width:547,

        height:340,

        skinsfoldername:"",

        loadimageondemand:false,

        enabletouchswipe:true,

        fullscreen:false,

        autoplayvideo:false,

        addmargin:true,

        randomplay:false,

        isresponsive:false,

        pauseonmouseover:false,

        playvideoonclickthumb:true,

        slideinterval:5000,

        fullwidth:false,

        transitiononfirstslide:false,

        scalemode:"fill",

        loop:0,

        autoplay:true,

        navplayvideoimage:"../../img/play-32-32-0.png",

        navpreviewheight:60,

        timerheight:2,

        descriptioncssresponsive:"font-size:12px;",

        shownumbering:false,

        skin:"Gallery",

        textautohide:true,

        addgooglefonts:true,

        navshowplaypause:true,

        navshowplayvideo:true,

        navshowplaypausestandalonemarginx:8,

        navshowplaypausestandalonemarginy:8,

        navbuttonradius:0,

        navpreviewposition:"top",

        navmarginy:16,

        showshadow:false,

        navfeaturedarrowimagewidth:16,

        navpreviewwidth:120,

        googlefonts:"Inder",

        textpositionmarginright:0,

        bordercolor:"#ffffff",

        navthumbnavigationarrowimagewidth:32,

        navthumbtitlehovercss:"text-decoration:underline;",

        texteffectresponsivesize:600,

        arrowwidth:32,

        texteffecteasing:"easeOutCubic",

        texteffect:"fade",

        navspacing:8,

        playvideoimage:"../../img/playvideo-64-64-0.png",

        ribbonimage:"../../img/ribbon_topleft-0.png",

        navwidth:48,

        navheight:48,

        arrowimage:"../../img/arrows-32-32-0.png",

        timeropacity:0.6,

        titlecssresponsive:"font-size:12px;",

        navthumbnavigationarrowimage:"../../img/carouselarrows-32-32-0.png",

        navshowplaypausestandalone:false,

        texteffect1:"slide",

        navpreviewbordercolor:"#ffffff",

        ribbonposition:"topleft",

        navthumbdescriptioncss:"display:block;position:relative;padding:2px 4px;text-align:left;font:normal 12px Arial,Helvetica,sans-serif;color:#333;",

        navborder:2,

        navthumbtitleheight:20,

        textpositionmargintop:24,

        texteffectdelay:500,

        navswitchonmouseover:false,

        navarrowimage:"../../img/navarrows-28-28-0.png",

        arrowtop:50,

        textstyle:"dynamic",

        playvideoimageheight:64,

        navfonthighlightcolor:"#666666",

        showbackgroundimage:false,

        navpreviewborder:4,

        navopacity:0.8,

        shadowcolor:"#aaaaaa",

        navbuttonshowbgimage:true,

        navbuttonbgimage:"../../img/navbuttonbgimage-28-28-0.png",

        navthumbnavigationarrowimageheight:32,

        textbgcss:"display:block; position:absolute; top:0px; left:0px; width:100%; height:100%; background-color:#fff; opacity:0.7; filter:alpha(opacity=70);",

        navpreviewarrowwidth:16,

        playvideoimagewidth:64,

        navshowpreviewontouch:false,

        bottomshadowimagewidth:110,

        showtimer:true,

        navradius:0,

        navshowpreview:false,

        navpreviewarrowheight:8,

        navmarginx:16,

        navfeaturedarrowimage:"../../img/featuredarrow-16-8-0.png",

        showribbon:false,

        navstyle:"thumbnails",

        textpositionmarginleft:0,

        descriptioncss:"display:block; position:relative; font:12px \"Lucida Sans Unicode\",\"Lucida Grande\",sans-serif,Arial; color:#333; white-space:nowrap; margin-top:8px;",

        navplaypauseimage:"../../img/navplaypause-48-48-0.png",

        backgroundimagetop:-10,

        timercolor:"#ffffff",

        numberingformat:"%NUM/%TOTAL ",

        navfontsize:12,

        navhighlightcolor:"#333333",

        texteffectdelay1:1000,

        navimage:"../../img/bullet-24-24-5.png",

        texteffectduration1:600,

        navshowplaypausestandaloneautohide:true,

        navbuttoncolor:"",

        navshowarrow:false,

        texteffectslidedirection:"left",

        navshowfeaturedarrow:true,

        lightboxbarheight:48,

        titlecss:"display:block; position:relative; font:bold 14px \"Lucida Sans Unicode\",\"Lucida Grande\",sans-serif,Arial; color:#333; white-space:nowrap;",

        ribbonimagey:0,

        ribbonimagex:0,

        texteffectslidedistance1:120,

        texteffectresponsive:true,

        navshowplaypausestandaloneposition:"bottomright",

        shadowsize:5,

        arrowhideonmouseleave:1000,

        navshowplaypausestandalonewidth:48,

        navfeaturedarrowimageheight:8,

        navshowplaypausestandaloneheight:48,

        backgroundimagewidth:120,

        navcolor:"#999999",

        navthumbtitlewidth:120,

        texteffectseparate:false,

        arrowheight:32,

        arrowmargin:8,

        texteffectduration:600,

        bottomshadowimage:"../../img/bottomshadow-110-95-4.png",

        border:6,

        timerposition:"bottom",

        navfontcolor:"#333333",

        navthumbnavigationstyle:"arrow",

        borderradius:0,

        navbuttonhighlightcolor:"",

        textpositionstatic:"bottom",

        navthumbstyle:"imageonly",

        texteffecteasing1:"easeOutCubic",

        textcss:"display:block; padding:8px 16px; text-align:left;",

        navbordercolor:"#ffffff",

        navpreviewarrowimage:"../../img/previewarrow-16-8-0.png",

        showbottomshadow:true,

        texteffectslidedistance:30,

        navdirection:"horizontal",

        textpositionmarginstatic:0,

        backgroundimage:"",

        navposition:"bottom",

        texteffectslidedirection1:"right",

        arrowstyle:"mouseover",

        textformat:"Light box",

        bottomshadowimagetop:95,

        textpositiondynamic:"bottomleft",

        navshowbuttons:false,

        navthumbtitlecss:"display:block;position:relative;padding:2px 4px;text-align:left;font:bold 14px Arial,Helvetica,sans-serif;color:#333;",

        textpositionmarginbottom:24,

        fade: {

            duration:1000,

            easing:"easeInCubic",

            checked:true

        },

        transition:"fade",

        isfullscreen:false,

        textformat: {



        }

    });

});