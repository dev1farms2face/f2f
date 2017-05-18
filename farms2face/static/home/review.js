$(document).ready(function(){
    $('.review-main').on({
        'click': function() {
            if ($('.review:last') != undefined) {
                $('.review').each(function(){
                    $(this).clone().insertAfter($('.review:last'));
                });
            }
        }
    }, '.see-more');
});
