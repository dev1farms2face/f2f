var alert_custom;
var confirm_custom;

$(document).ready(function(){
    var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
    var is_explorer = navigator.userAgent.indexOf('MSIE') > -1;
    var is_firefox = navigator.userAgent.indexOf('Firefox') > -1;
    var is_safari = navigator.userAgent.indexOf("Safari") > -1;
    var is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1;
    if ((is_chrome)&&(is_safari)) {is_safari=false;}
    if ((is_chrome)&&(is_opera)) {is_chrome=false;}
    var speed = 0.3;
    alert_custom = function(title, fn, args) {
        dialog.alert({
            title: title,
            message: "",
            button: "Close",
            animation: "fade",
            callback: function(value){
                if(fn != undefined)
                    fn(args);
            }
        }); 
    }
    confirm_custom = function(title, fn1, args1, fn2, args2) {
        dialog.confirm({
            title: title,
            message: "",
            cancel: "Cancel",
            button: "Yes",
            required: true,
            callback: function(value){
                if(value)
                    if(fn1 != undefined)
                        fn1(args1);
                else
                    if(fn2 != undefined)
                        fn2(args2);
            }
        });
    }
    setTimeout(function(){ 
        if(nobanner) return;
        $('div.banner').slideDown(200); 
        $('#title-panel').css('padding-top', '40px');
    }, 3000)
    $('div.banner').on({
        'click': function() {
            $(this).closest('div.banner').slideUp(100);
            $('#title-panel').css('padding-top', '0px');
        },
    }, 'label.cross')
    window.updateBackground = function($els) {
        if ((is_explorer) || (is_firefox) || (is_opera)) {
            return; // too jittery;
        }
        $els.each(function(){
            $el = $(this);
            if ($el == undefined || $el.offset() == undefined) {
                return;
            }
            var diff = $(window).scrollTop() - $el.offset().top;
            var yPos = -(diff * speed);
            var coords = '50% ' + yPos + 'px';
            $el.css({
                backgroundPosition: coords
            });
        });
    }
    if (window.location.href.indexOf("/shop/") >= 0) {
        $("html, body").animate({ scrollTop: $('#featured-panel').offset().top+45 });
    }
    if (window.location.href.indexOf("/process/") >= 0) {
        $("html, body").animate({ scrollTop: $('#how-panel').offset().top });
    }
    $(document).on({
        ajaxStart: function() { $('body').addClass("loading");  },
        ajaxStop: function() { $('body').removeClass("loading"); }    
    });
});

