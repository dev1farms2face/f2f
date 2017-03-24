$(document).ready(function(){
    $('.results-panel').on({
        'click': function() {
            if ($('.review:last') != undefined) {
                $('.review').each(function(){
                    $(this).clone().insertAfter($('.review:last'));
                });
            }
        }
    }, '.see-more');
    $('.learn-more-panel').click(function(){
        $('div.first-match table.summary').fadeToggle('slow');
    });
});
