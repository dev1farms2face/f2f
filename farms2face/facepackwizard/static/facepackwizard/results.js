var url_add_fp_to_cart = "/post_add_cart/"
var url_remove_fp_from_cart = "/post_remove_cart/"

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
    var addToCart = function(button) {
        // POST registration data to server
        // Check which button is clicked and add o_id accordingly for fp1, fp2 or fp3
        o_id = undefined;
        if ( button.parent().parent().hasClass('second')) {
            o_id = o1_id;
        }else if ( button.parent().parent().hasClass('third')) {
            o_id = o2_id;
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
                    'o_id' : o_id,
                })
            },
            success: function(data) {
                $('#title-panel div.cart p').html(data['cart_size']);
                button.attr('facepack_id', data['facepack_id']);
            	button.addClass('buy-clicked'); 
                button.html("ADDED TO CART");
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
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
                $('#title-panel div.cart p').html(data['cart_size']);
                button.attr('facepack_id', '');
            	button.removeClass('buy-clicked'); 
                button.html("BUY A-LA-CARTE");
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    $('div.purchase-panel .a-la-carte').click(function(){
        if($(this).hasClass('buy-clicked')) {
            removeFromCart($(this));
        }else{
            addToCart($(this));
        }
    });
});
