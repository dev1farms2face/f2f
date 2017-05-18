var url_add_fp_to_cart = "/post_add_cart/"
var url_remove_fp_from_cart = "/post_remove_cart/"

$(document).ready(function(){
    var d = new Date();
    // Reload page on back button
    d.getTime();
    if (jQuery('#reloadValue').val().length == 0)
    {
        jQuery('#reloadValue').val(d);
        jQuery('body').show();
    }
    else
    {
        jQuery('#reloadValue').val('');
        location.reload();
    }
    // ^ Reload page logic ends.
    $('.results-panel').on({
        'click': function() {
            if ($('.review:last') != undefined) {
                $('.review').each(function(){
                    $(this).clone().insertAfter($('.review:last'));
                });
            }
        }
    }, '.see-more');
    $('div.results-panel img.featured-right.arrow').click(function(){
        var pos = $('div.results-panel div.prepacks').scrollLeft() + 290;
        $('div.results-panel div.prepacks').animate( { scrollLeft: pos }, 400, 'easeOutQuad');
    });
    $('div.results-panel img.featured-left.arrow').click(function(){
        var pos = $('div.results-panel div.prepacks').scrollLeft() - 290;
        $('div.results-panel div.prepacks').animate( { scrollLeft: pos }, 400, 'easeOutQuad');
    });
    var addToCart = function(button) {
        // POST registration data to server
        // Check which button is clicked and add o_id accordingly for fp1, fp2 or fp3
        fp_id = button.closest('div.item').attr('id')
        $.ajax({ 
            url: url_add_fp_to_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'fp_type' : 'prepack', 
                    'fp_id' : fp_id, 
                    'type': button.attr('type'),
                })
            },
            success: function(data) {
                location.href="/cart/";
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
                    'facepack_id': button.closest('div.item').attr('id')
                })
            },
            success: function(data) {
                location.reload();
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    $('div.purchase-panel .button').click(function(){
        if($(this).hasClass('buy-clicked')) {
            removeFromCart($(this));
        }else{
            addToCart($(this));
        }
    });
});
