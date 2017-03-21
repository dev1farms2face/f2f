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
});
