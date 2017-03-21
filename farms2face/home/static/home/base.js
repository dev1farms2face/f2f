$(document).ready(function(){
    var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
    var is_explorer = navigator.userAgent.indexOf('MSIE') > -1;
    var is_firefox = navigator.userAgent.indexOf('Firefox') > -1;
    var is_safari = navigator.userAgent.indexOf("Safari") > -1;
    var is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1;
    if ((is_chrome)&&(is_safari)) {is_safari=false;}
    if ((is_chrome)&&(is_opera)) {is_chrome=false;}
    var speed = 0.3;
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
        $("html, body").animate({ scrollTop: $('#featured-panel').offset().top+75 });
    }
});

