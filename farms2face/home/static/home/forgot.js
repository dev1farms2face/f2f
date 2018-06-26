var url_pass_change="/post_change_password/"

$(document).ready(function(){
    var submit_pass_change = function(p) {
        key = $('div.forgot-panel').attr('key');
        $.ajax({
            url: url_pass_change,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'key': key,
                    'password': p,
                })
            },
            success: function(data) {
                alert_custom("Password successfully changed! Please login again using new credentials");
                window.location = "/signin/"; 
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        })
    };

    var do_change = function() {
        p  = $('div.forgot-panel').find('input.pass').val();
        cp = $('div.forgot-panel').find('input.cpass').val();
        if(p != cp) {
            alert_custom("Passwords don't match"); 
        } else if (p.length < 8 || p.length > 20) {
            alert_custom("Password needs to be between 8 and 20 character length");
        } else {
            submit_pass_change(p);
        }
    }
    $('div.forgot-panel').on({
        'click': function() {
            do_change();
        }
    }, 'p.submit-new-password');
    $('div.forgot-panel').keyup(function(e) {
        if (e.which == 13) {
            do_change();
        }
    });
});
