var url_remove_fp_from_cart = "/post_remove_cart/"
var url_update_cart_quantity = "/post_update_cart_quantity/"
var url_update_cart_type = "/post_update_cart_type/"
var url_checkout = "/post_checkout/"
var checkout = undefined;

$(document).ready(function(){
    $('div.cart-panel').on({
        'click': function() {
            item = $(this).closest('tr.item');
            confirm_custom("Are you sure you want to remove item from cart?", removeFromCart, item);
        }
    }, 'p.remove');
    checkout = function(token_id, args) {
        //console.log(token_id);
        // POST cart remove to server
        if( is_anonymous == "True" ) {
            //console.log("/signin/new/?next=/cart/");
            return;
            //window.location = "/signin/new/?next=/cart/";
        }
        $.ajax({
            url: url_checkout,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'shipping_id': $('div.cart-panel div.shipping-panel select').val(),
                    'token_id': token_id,
                    'b_name': args.billing_name,
                    'b_addr1': args.billing_address_line1,
                    'b_zip': args.billing_address_zip,
                    'b_city': args.billing_address_city,
                    'b_state': args.billing_address_state,
                    'b_country': args.billing_address_country,
                    's_name': args.shipping_name,
                    's_addr1': args.shipping_address_line1,
                    's_zip': args.shipping_address_zip,
                    's_city': args.shipping_address_city,
                    's_state': args.shipping_address_state,
                    's_country': args.shipping_address_country,
                })
            },
            success: function(data) {
                if(data['success']) {
                    window.location = "/thanks/";
                } else {
                    alert_custom("Error: Please contact sysadmin");
                    window.location = "/myaccount/shipping-&-payments/";
                }
            },
            failure: function(data) {
                alert_custom("Failed: "+data['error']); 
            },
            error: function(data) {
                alert_custom("Error: "+data['error']); 
                //alert_custom("Error: Please contact sysadmin");
            }
        })
    }
    var removeFromCart = function(item) {
        // POST cart remove to server
        $.ajax({
            url: url_remove_fp_from_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'facepack_id': item.attr('item-id'),
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
    var updateQty = function(item, op) {
        // POST cart update quantity
        $.ajax({
            url: url_update_cart_quantity,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'cart_id'  : item.attr('id'),
                    'operation': op,
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
    var updateType = function(item, type) {
        // POST cart update type
        $.ajax({
            url: url_update_cart_type,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'cart_id'  : item.attr('id'),
                    'type': type,
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
    $('div.cart-panel td.quantity').on({
        'click': function() {
            item = $(this).closest('tr.item'); 
            updateQty(item, "up");
        }
    }, 'img.up');
    $('div.cart-panel td.quantity').on({
        'click': function() {
            qty = $(this).prev().html().split(" ")[1];
            if(parseInt(qty) <= 1) {
                $(this).closest('tr.item').find('p.remove').click();
            }else{ 
                item = $(this).closest('tr.item'); 
                updateQty(item, "down");
            }
        }
    }, 'img.down');
    $('div.cart-panel div.shipping-panel select').on('change', function() {
        window.location = "/cart?shipping="+$(this).val();
    })
    $('div.checkout-panel p.checkout').click(function(){
        if(confirm("Are you sure you want to make the purchase?")) {
            checkout();
        }
    });
    $('div.cart-panel table.item-panel td.type select').on('change', function() {
        updateType($(this).closest('tr.item'), $(this).val());
    });
    $('div.cart-panel table.item-panel td.frequency select').on('change', function() {
        updateQty($(this).closest('tr.item'), $(this).val());
    });
    $('div.cart-panel table.item-panel td.type p.save-auto').on('click', function() {
        $(this).closest('tr.item').find('td.type select').val('subscribe').change();
    });
    
});
