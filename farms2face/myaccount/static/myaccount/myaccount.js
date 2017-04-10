var url_save_myaccount_details = "/post_save_myaccount_details/";

var saveMyAccountDetails = function(button) {
    // POST registration data to server
    data = {};
    $('table.account.details-panel').find('input.value.dirty').each(function(){
        key = $(this).closest('td').attr('class');
        value = $(this).val();
        data[key] = value;
    });
    $.ajax({
        url: url_save_myaccount_details,
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
            alert("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert("Error: Please contact sysadmin");
            location.reload();
        }
    })
}

var updatePh = function(id, key, val, url) {
    // POST purchase history update quantity (subscription type 4 vs 8)
    data = {
        'ph_id'  : id,
    }
    data[key] = val;
    $.ajax({
        url: url,
        type: 'POST',
        dataType: "json",
        data: {
            'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
            'data' : JSON.stringify(data),
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



$(document).ready(function(){
    $.ajaxSetup({
        headers: { "X-CSRFToken": $("[name='csrfmiddlewaretoken']").attr('value')},
    });
    $('.datepicker').datepicker({
            dateFormat: 'MM dd, yy',
            onSelect: function() {
                $('.datepicker').blur();
            }});
    $('table.account.details-panel input.value')
        .on('blur', function(){
            $(this).removeClass('dirty');
            if($(this).attr('orig') != $(this).val())
                $(this).addClass('dirty');
            if($('table.account.details-panel input.value.dirty').length > 0) {
                $('div.button-panel p.save').show().css("display","inline-block");
                $('div.button-panel p.cancel').show().css("display","inline-block");
            } else {
                $('div.button-panel p.save').hide();
                $('div.button-panel p.cancel').hide();
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
    $( "table.account.details-panel td.gender input.value" ).autocomplete({
        source: ['Male','Female'],
        close: function(){
            $(this).blur();
        }});
    $( "table.account.details-panel td.subscription input.value" ).autocomplete({
        source: ['Yes','No'],
        close: function(){
            $(this).blur();
        }});
    $('div.button-panel p.save').click(function(){
        saveMyAccountDetails(); 
    });
    $('div.button-panel p.cancel').click(function(){
        location.reload();
    });
    $('div.photo #upload').change(function(){
        var file, imgData;
        file = this.files[0];
        imgData = new FormData();
        imgData.append('pic', file);
        console.log("YYYY");
        $.ajax({
          type: 'POST',
          url: $('div.photo').attr('url'),
          data: imgData,
          processData: false,
          contentType: false,
          cache: false,
          success: function(result) {
              console.log(result);
              result = $.parseJSON(result);
              if(result['success'])
                  location.reload();
              else
                  alert("Invalid file. Please upload .jpg or .png");
          },
          error: function(result) {
              alert("Error: Please contact sysadmin");
          }
        });
    });
    $('div.photo label').click(function(e){
        e.preventDefault();
        $('div.photo #upload').trigger('click');
    });
    $('table.subscription-panel td.type select').on('change', function() {
        if(confirm("Are you sure you want to change your subscription type?")) {
            tr = $(this).closest('tr');
            updatePh(tr.attr('id'), 'ph_qty', $(this).val(), tr.attr('url'));
        }
    });
    $('table.subscription-panel td.item div.ship-date input').blur(function(){
        if($(this).attr('orig') != $(this).val()) {
            if(confirm("Are you sure you want to reset your subscription ship-date?")) {
                tr = $(this).closest('tr');
                console.log($(this).val());
                updatePh(tr.attr('id'), 'ph_date', $(this).val(), tr.attr('url'));
            }else{
                $(this).val($(this).attr('orig'));
            }
        } 
    });
});
