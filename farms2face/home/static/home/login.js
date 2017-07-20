var url_login="/post_login_user/"
var new_user = false;

$(document).ready(function(){
    $('div.login-panel input').focus(function(){
        if(!$(this).hasClass('valid')) {
            $(this).val("");
            $(this).addClass('valid');
        }
    });
    $('div.login-panel input').blur(function(){
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
            alert("Enter valid email/password");
            return;
        } 
        if(new_user) {
            password_confirm = $('div.login-panel input.password-confirm').val();
            if(password != password_confirm) {
                alert("Passwords don't match, try again");
                return;
            }
        }
        console.log(new_user); 
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
                if(data != null && data['success'] == false) {
                    alert("Invalid email or password")
                }else{
                    $('#title-panel #login').hide();
                    $('#title-panel #user').text("Welcome "+data['first_name']+"!");
                    window.location = data['next'];
                }
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
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
});
