var states = ['WA', 'WI', 'WV', 'FL', 'FM', 'WY', 'NH', 'NJ', 'NM', 'NC', 'ND', 'NE', 'NY', 'RI', 'NV', 'GU', 'CO', 'CA', 'GA', 'CT', 'OK', 'OH', 'KS', 'SC', 'KY', 'OR', 'SD', 'DE', 'DC', 'HI', 'PR', 'PW', 'TX', 'LA', 'TN', 'PA', 'VA', 'VI', 'AK', 'AL', 'AS', 'AR', 'VT', 'IL', 'IN', 'IA', 'AZ', 'ID', 'ME', 'MD', 'MA', 'UT', 'MO', 'MN', 'MI', 'MH', 'MT', 'MP', 'MS'];
var id = "0";
var url = "";
var primary = undefined;

var post_data = function(container) {
    // POST registration data to server
    data = { 'id': id };
    if( primary ) {
        data['primary'] = true;
    } else {
        container.find('input.value').each(function(){
            key = $(this).closest('div.entry').attr('class').split(' ')[1];
            value = $(this).val();
            data[key] = value;
        });
    }
    //console.log(data);
    $.ajax({
        url: url,
        type: 'POST',
        dataType: "json",
        data: {
            'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
            'data' : JSON.stringify(data)
        },
        success: function(data) {
            location.reload();
        },
        failure: function(data) {
            alert("Failed: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert("Error: Please contact sysadmin");
            location.reload();
        }
    })
}

$(document).ready(function(){
    $('div.payments div.entry.expiry input').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'mm/y',
        onSelect: function (dateText, inst) {
            $('div.payments div.entry.expiry input:visible').blur();
        },
        change: function() {
            $('div.payments div.entry.expiry input:visible').blur();
        }
    });
    $('div.shipping div.address-panel input.value')
        .on('blur', function(){
            $(this).removeClass('error');
            completed = true;
            if($(this).val().trim().length < 2) {
                $(this).addClass('error');
            }
            if($(this).closest('div.entry').hasClass('state') && states.indexOf($(this).val()) == -1) {
                $(this).addClass('error');
            }
            if($(this).closest('div.entry').hasClass('phone') && $(this).val().trim.length > 0 &&  $(this).val().match(/\d/g).length != 10) {
                $(this).addClass('error');
            }
            if($(this).closest('div.entry').hasClass('street2')) {
                $(this).removeClass('error');
            }
            $(this).closest('div.address-panel').find('input.value').each(function(){
                if($(this).closest('div.entry').hasClass('street2')) {
                    return;
                }
                if($(this).val().trim().length < 2) {
                    completed = false;
                }
            });
            if(completed && $('div.shipping div.address-panel input.value.error').length == 0) {
                $('div.shipping div.address-panel p.save').show().css("display","inline-block");
            } else {
                $('div.shipping div.address-panel p.save').hide();
            }
        })
        .on('keyup', function(e){
            if (e.which == 27) {
                $(this).val($(this).attr('orig'));
                $(this).blur();
            }else if (e.which == 13) {
                $(this).blur();
            }
        });
    $('div.payments input.value')
        .on('blur', function(){
            $(this).removeClass('error');
            completed = true;
            if($(this).val().trim().length < 2) {
                $(this).addClass('error');
            }
            if($(this).closest('div.entry').hasClass('state') && states.indexOf($(this).val()) == -1) {
                $(this).addClass('error');
            }
            if($(this).closest('div.entry').hasClass('street2')) {
                $(this).removeClass('error');
            }
            $(this).closest('div.payments').find('input.value:visible').each(function(){
                if($(this).closest('div.entry').hasClass('street2')) {
                    return;
                }
                if($(this).val().trim().length < 2) {
                    completed = false;
                }
            });
            if(completed && $('div.payments input.value.error:visible').length == 0) {
                $('div.payments p.save').show().css("display","inline-block");
            } else {
                $('div.payments p.save').hide();
            }
        })
        .on('keyup', function(e){
            if (e.which == 27) {
                $(this).val($(this).attr('orig'));
                $(this).blur();
            }else if (e.which == 13) {
                $(this).blur();
            }
        });
    $( "div.entry.state input.value" ).autocomplete({
        source: states,
        close: function(){
            $(this).blur();
        }});
    $('div.shipping div.address-panel p.save').click(function(){
        if($('div.shipping div.address-panel input.value.error').length == 0) {
            container = $(this).closest('div.shipping').find('div.address-panel');
            post_data(container);
        }else{
            alert("Incomplete form, please correct errors");
        }
    });
    $('div.shipping div.address-panel p.cancel').click(function(){
         $(this).closest('div.address-panel').slideToggle();
         $('p.new-address').show();
    });
    $('div.shipping p.new-address').click(function(){
        $('div.shipping div.address-panel').find('input').removeClass('error').val('');
        $('div.shipping div.address-panel p.save').hide();
        $(this).hide();
        $('div.shipping div.address-panel').slideToggle();
        url = $('div.shipping div.address-panel').attr('url');
    });
    var copy_address = function(from, to) {
        to.find('div.entry.first_name input.value')
            .val(from.find('input.hidden.first_name').val());
        to.find('div.entry.last_name input.value')
            .val(from.find('input.hidden.last_name').val());
        to.find('div.entry.street1 input.value')
            .val(from.find('input.hidden.street1').val());
        to.find('div.entry.street2 input.value')
            .val(from.find('input.hidden.street2').val());
        to.find('div.entry.city input.value')
            .val(from.find('input.hidden.city').val());
        to.find('div.entry.state input.value')
            .val(from.find('input.hidden.state').val());
        to.find('div.entry.zip input.value')
            .val(from.find('input.hidden.zip').val());
        to.find('div.entry.phone input.value')
            .val(from.find('input.hidden.phone').val());
    }
    $('div.shipping-address p.edit').click(function(){
        $('p.new-address').hide();
        $('div.shipping div.address-panel p.save').hide();
        $('div.shipping div.address-panel').hide().slideToggle();
        copy_address($(this).closest('div.shipping-address'), $('div.shipping div.address-panel'));
        id = $(this).closest('div.shipping-address').attr('id');
        url = $(this).attr('url'); 
    });
    $('div.shipping-address p.delete').click(function(){
        if(confirm("Are you sure you want to delete this address?")) {
            id = $(this).closest('div.shipping-address').attr('id');
            url = $(this).attr('url'); 
            container = $(this).closest('div.shipping').find('div.address-panel');
            post_data(container);
        }
    });
    $('div.shipping-address div.primary input').change(function(){
        id = $(this).closest('div.shipping-address').attr('id');
        url = $(this).closest('div.shipping-address').find('p.edit').attr('url');
        primary = true;
        container = $(this).closest('div.shipping').find('div.address-panel');
        post_data(container);
    });

    // Payments
    $('div.payments div.same input').change(function(){
        $('div.payments div.address-panel').slideToggle();
    });
    $('div.payments p.save').click(function(){
        if($('div.payments div.credit-card-panel input.value.error').length == 0) {
            if($('div.payments div.same input').is(':checked')) { 
                from = $('div.shipping div.primary input[checked="checked"]').closest('div.shipping-address');
                to = $(this).closest('div.payments').find('div.address-panel'); 
                copy_address(from, to);
            }
            container = $(this).closest('div.payments');
            url = $(this).attr('url');
            post_data(container);
        }else{
            alert("Incomplete form, please correct errors");
        }
    });
    $('div.payment-types div.primary input').change(function(){
        id = $(this).closest('div.payment-type').attr('id');
        url = $(this).closest('div.payment-type').find('p.edit').attr('url');
        primary = true;
        container = $(this).closest('div.payments');
        post_data(container);
    });
    $('div.payment-types p.delete').click(function(){
        if(confirm("Are you sure you want to delete this address?")) {
            id = $(this).closest('div.payment-type').attr('id');
            url = $(this).attr('url'); 
            container = $(this).closest('div.payments');
            post_data(container);
        }
    });
    $('div.payment-types p.edit').click(function(){
        $('div.payments p.new-payment').hide();
        $('div.payments p.save').hide();
        $('div.payments div.address-panel').show();
        $('div.payments div.payments-panel').hide().slideToggle();
        copy_address($(this).closest('div.payment-type'), $('div.payments div.address-panel'));
        $('div.payments div.credit-card-panel').find('div.entry.expiry input.value')
            .val($(this).closest('div.payment-type').find('input.hidden.expiry').val());
        id = $(this).closest('div.payment-type').attr('id');
        url = $(this).attr('url'); 
        $('div.payments div.same input').attr('checked', false); 
    });
    $('div.payments p.new-payment').click(function(){
        $('div.payments div.payments-panel').find('input').removeClass('error').val('');
        $('div.payments div.payments-panel p.save').hide();
        $(this).hide();
        $('div.payments div.payments-panel').slideToggle();
        id="0";
    });
    $('div.payments p.cancel').click(function(){
        $('div.payments div.payments-panel').slideToggle();
        $('div.payments p.new-payment').show();
    });
});

