$(document).ready(function(){
    $('#woman-main-bg-panel').parallax({imageSrc: $('#woman-main-bg-panel').attr('imgSrc'), speed: 0.35});
    $('#featured-panel').parallax({imageSrc: $('#featured-panel').attr('imgSrc'), speed: 0.3});
    $('#featured-panel img.featured-right.arrow').click(function(){
        var pos = $('#featured-panel div.prepacks').scrollLeft() + 240;
        $('#featured-panel div.prepacks').animate( { scrollLeft: pos }, 400, 'easeOutQuad');
    });
    $('#featured-panel img.featured-left.arrow').click(function(){
        var pos = $('#featured-panel div.prepacks').scrollLeft() - 240;
        $('#featured-panel div.prepacks').animate( { scrollLeft: pos }, 400, 'easeOutQuad');
    });
});
