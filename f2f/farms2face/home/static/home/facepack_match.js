var url_add_fp_to_cart = "/post_add_cart/"
var url_remove_fp_from_cart = "/post_remove_cart/"

$(document).ready(function(){
    var addToCart = function(button) {
        // POST registration data to server
        // Check which button is clicked and add o_id accordingly for fp1, fp2 or fp3
        type = button.attr('type');
        fp_id = button.siblings('p.buy-clicked').attr('facepack_id');
        if(button.closest('div.facepack-match').attr('type') == "primary") {
            o1_id = '';
            o2_id = '';
            o3_id = '';
        }
        $.ajax({ 
            url: url_add_fp_to_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'r1_id': r1_id,
                    'r2_id': r2_id,
                    'r3_id': r3_id,
                    'b_id' : b_id,
                    'm_id' : m_id,
                    'o1_id' : o1_id,
                    'o2_id' : o2_id,
                    'o3_id' : o3_id,
                    'type' : type, 
                    'qd_id' : qd_id, 
                    'fp_id' : fp_id, 
                })
            },
            success: function(data) {
                location.href="/cart/";
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        })
    }
    var removeFromCart = function(button) {
        // POST registration data to server
        $.ajax({ 
            url: url_remove_fp_from_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'facepack_id': button.attr('facepack_id'),
                })
            },
            success: function(data) {
                location.reload();
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        })
    }
    $('div.facepack-match div.purchase-panel .button').off('click').on('click', function(){
        if($(this).hasClass('buy-clicked')) {
            removeFromCart($(this));
        }else{
            addToCart($(this));
        }
    });
    $('div.facepack-match div.learn-more-panel').off('click').on('click', function(evet){
        summary = $(this).closest('div.facepack-match').find('table.summary');
        summary.fadeToggle(100, function(){
            if(summary.is(':visible')) {
                $("html, body").animate({ scrollTop: summary.offset().top-125 });
            }else{
                $("html, body").animate({ scrollTop: $(this).closest('div.facepack-match').offset().top-200 });
            }
        });
    });
    $('div.facepack-match table.summary p.hide-summary').off('click').on('click', function(evet){
        $(this).closest('table.summary').fadeToggle();
        $("html, body").animate({ scrollTop: $(this).closest('div.facepack-match').offset().top-200 });
    });
});
