$(document).ready(function(){
    $('.review-main').on({
        'click': function() {
            if ($('.review:last') != undefined) {
            }
        }
    }, '.see-more');
    $('div.review-panel div.review div.pic-container div.pic').on({
        'click': function() {
            modal = $(this).next();
            target_img = $(modal).find('img.modal-content');
            $(target_img).attr('src', $(this).attr('src')); 
            $(modal).css('display', 'block');
        }
    }, 'img.thumbnail');
    $('div.review-panel div.review div.pic-container div.pic div.modal').on({
        'click': function() {
            $(this).closest('div.modal').hide();
        }
    }, '.close');
    $('div.review-panel div.review div.pic-container div.pic div.modal').on({
        'keyup': function(e) {
            if (e.which == 27) {
                console.log("HHHHHHHH");
                $(this).closest('div.modal').hide();
            }
        },
    }, 'img.modal-content');
    $('div.review-main div.filter').on({
        'change': function(e) {
            skin_type = $(this).val();
            url = window.location.href;
            if( url.indexOf('skin_type') >= 0 ) {
               url = url.replace(/skin_type=\w+/, "skin_type="+skin_type);
            } else {
               url += "&skin_type="+skin_type;
            }
            window.location.href = url;
        }
    }, 'select.skin-type');
});
