var url_vote='/post_vote/';

$(document).ready(function(){
    vote = function(r_id, vote, p) {
        $.ajax({ 
            url: url_vote,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({"r_id": r_id, "vote": vote})
            },
            success: function(data) {
                location.reload();
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
                location.reload();
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
                location.reload();
            }
        })
    }
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
    $('div.review-panel div.review div.details div.rating-help div.useful').on({
        'click' : function(e) {
            vote($(this).closest('div.rating-help').attr('id'), "up", $(this).next());
        }
    }, 'img'); 
    $('div.review-panel div.review div.details div.rating-help div.not-useful').on({
        'click' : function(e) {
            vote($(this).closest('div.rating-help').attr('id'), "down");
        }
    }, 'img'); 
});
