$(document).ready(function(){
    var target = $(".panel-1").offset().top;
    var target2 = $(".panel-2").offset().top;
    var target3 = $(".panel-3").offset().top;
    var last_scroll_position = 0;
    var i1 = $('img.lets-find-out-bg');
    var i2 = $('img.lets-find-out-fg');
    wnd_w = $('#woman-main-bg-panel').width();
    $(window).scroll(function() {
        if ($(window).scrollTop() >= target) {
            $('#woman-main-bg-panel').addClass('parallax');
            $('#woman-main-bg-panel').css('background-attachment', 'fixed');
        }else{
            $('#woman-main-bg-panel').css('background-attachment', '');
            $('#woman-main-bg-panel').removeClass('parallax');
        }
        if ($(window).scrollTop() + $(window).height() >= target3) {
            $('#featured-panel').addClass('parallax');
        }else{
            $('#featured-panel').removeClass('parallax');
        }
        window.updateBackground($('.parallax'));
    });
});
