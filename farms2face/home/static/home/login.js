var url_login="/post_login_user/"
var new_user = false;
var url_forgot_pass="/post_forgot/";

$(document).ready(function(){
    var forgot_pass = function(email) {
        $.ajax({
            url: url_forgot_pass,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'email': email,
                })
            },
            success: function(data) {
                if(data == null || data['success'] == false) {
                    alert_custom("Invalid email or password")
                } else {
                    alert_custom("Email sent with password reset link.");
                    $('#myModal').hide();
                }
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        });

    }
    $('div.login-panel input').focus(function(){
        if($(this).hasClass('password')) {
            $(this).attr('type', 'password');
        }
        if(!$(this).hasClass('valid')) {
            $(this).val("");
            $(this).addClass('valid');
        }
    });
    $('div.login-panel input').blur(function(){
        if($(this).hasClass('password') && $(this).val().trim().length == 0) {
            $(this).attr('type', 'text');
        }
        if($(this).val().trim().length == 0) {
            $(this).val($(this).attr('orig'));
            $(this).removeClass('valid');
        } 
    });
    var loginUser = function() {
        email = $('div.login-panel input.email').val();
        password = $('div.login-panel input.password').val();
        if ( email == "Email" || email.trim().length == 0 || 
            password == "Password" || password.trim().length == 0) {
            alert_custom("Enter valid email/password");
            return;
        } 
        if(new_user) {
            password_confirm = $('div.login-panel input.password.confirm').val();
            if(password != password_confirm) {
                alert_custom("Passwords don't match, try again");
                return;
            }
        }
        //console.log(new_user); 
        // POST login data to server
        $.ajax({
            url: url_login,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'email': email,
                    'password': password,
                    'new': new_user,
                })
            },
            success: function(data) {
                //console.log(data);
                if(data != null && data['error'] == 'exists') {
                    confirm_custom("User already exists, would you like to signin instead?", function() {
                        window.location = '/signin/';
                    }, '');
                } else if(data != null && data['success'] == false) {
                    alert_custom("Invalid email or password")
                } else {
                    $('#title-panel #login').hide();
                    $('#title-panel #user').text("Welcome "+data['first_name']+"!");
                    window.location = data['next'];
                }
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        });
    }
    $('div.login-panel p.login-submit').click(function(){
        loginUser();
    });
    $('div.login-panel').keyup(function(e){
        if (e.which == 13) {
            loginUser();
            return false;
        }
    });
    $('div.login-panel').on({
        'click': function() {
            $('#myModal').show();
        }
    }, 'p.forgot');
    $('div.modal').on({
        'click': function() {
            $('#myModal').hide();
        }
    }, 'p.close');
    $('div.modal').on({
        'click': function() {
            email = $('#myModal').find('input.email').val();
            if ( email == "Email" || email.trim().length == 0)
                alert_custom("Enter valid (registered) email");
            else
                forgot_pass(email);
        }
    }, 'p.forgot-submit');
    $('div.modal').on({
        'focus': function(e) {
            if($(this).hasClass('password')) {
                $(this).attr('type', 'password');
            }
            if(!$(this).hasClass('valid')) {
                $(this).val("");
                $(this).addClass('valid');
            }
        },
        'blur': function(e) {
            if($(this).hasClass('password') && $(this).val().trim().length == 0) {
                $(this).attr('type', 'text');
            }
            if($(this).val().trim().length == 0) {
                $(this).val($(this).attr('orig'));
                $(this).removeClass('valid');
            } 
        },
        'keyup': function(e) {
            if (e.which == 27) {
                $(this).val("");
                $(this).blur();
            }
        }
    }, 'input.email');
});
