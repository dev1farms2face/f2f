var url_login="/post_login_user/"

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
});
