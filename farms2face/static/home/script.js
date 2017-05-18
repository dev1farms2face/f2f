var url__register = "/register/"
var url__login = "/login/"
var url__logout = "/logout/"

$(document).ready(function(){
    // Menu handling
    $(".app-panel").load("/home/");
    $(".menu-item").hover(function() {
        $(this).addClass('menu-item-hover', {duration: 100});
    }, function() {
        $(this).removeClass('menu-item-hover', {duration: 100});
    });
    $(".menu-item").click(function() {
        var $this = $(this);
        if(!$this.hasClass("selected")) {
            $(".menu-panel").find(".menu-item").removeClass("selected");
            $this.addClass("selected");
            $('.app-panel').hide().empty().fadeIn({'duration': 300}).load($(this).attr('link'));
        }
    });
    $(".cart-link").click(function() {
        var $this = $(this);
        $('.app-panel').empty().load($(this).attr('link'));
    });
    var addUser = function() {
        first_name = $('.register-first-name-input').val();
        last_name = $('.register-last-name-input').val();
        email = $('.register-email-input').val();
        password = $('.register-password-input').val();
        password_confirm = $('.register-password-confirm-input').val();
        if(password != password_confirm) {
            alert("Passwords don't match. Try again.")
            return;
        }
        // POST registration data to server
        $.ajax({
            url: url__register,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'first_name': first_name,
                    'last_name': last_name,
                    'password': password,
                    'email': email,
                })
            },
            success: function(data) {
                alert("You're all set! Please check your e-mail to complete registration");
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
        registerDialog.dialog( "close" );
    }
    registerDialog = $(".register-div").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
            "Create an account": addUser,
            Cancel: function() {
                registerDialog.dialog( "close" );
            }
        },
        close: function() {
            $('.register-div').find('input').each(function(){ $(this).val(""); });
        }
    }); 
    $('.register').click(function(){
        registerDialog.dialog( "open" );
    });
    var loginUser = function() {
        email = $('.login-email-input').val();
        password = $('.login-password-input').val();
        // POST login data to server
        $.ajax({
            url: url__login,
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
                    $('.user').text("Welcome "+data['first_name']+"!");
                    $('.login').text("Logout");
                    loginDialog.dialog( "close" );
                }
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
                loginDialog.dialog( "close" );
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
                loginDialog.dialog( "close" );
            }
        })
    }
    var logoutUser = function() {
        // POST logout data to server
        $.ajax({
            url: url__logout,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'junk': 'junk'
                })
            },
            success: function(data) {
                $('.login').text("Login");
                $('.user').empty();
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    loginDialog = $(".login-div").dialog({
        autoOpen: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "Log In": loginUser,
            Cancel: function() {
                loginDialog.dialog( "close" );
            }
        },
        close: function() {
            $('.login-div').find('input').each(function(){ $(this).val(""); });
        }
    }); 
    $('.login').click(function(){
        if($('.login').text() == "Login") {
            loginDialog.dialog( "open" );
        } else {
            if(!confirm("Are you sure you want to logout?")) {
                return;
            }
            logoutUser();
        }
    });
});
