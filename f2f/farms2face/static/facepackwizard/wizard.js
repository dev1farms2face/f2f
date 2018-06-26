var submit_url="/post_wizard_submit/"
$(document).ready(function(){
    setTimeout(
        function() {
            $('.question-panel:first').show();
            $('.question-panel:first').find('.option').removeClass('option-selected');
            $('.question-panel:first').nextAll().hide();
            $('.show-matches').hide();
            $("html, body").animate({ scrollTop: $('.question-panel:first').offset().top-130 });
    }, 2000);
    $('div.wizard-panel').on({
        'mouseenter': function() {
                hr = $(this).siblings('.hr');
                hr.stop().animate({width:'toggle'},200,function() {
                    why = $(this).siblings('.why-footer');
                    why.stop().fadeIn();
                    hr.css('width',why.width()+"px");
                });
            },
        'mouseleave': function() {
                $(this).siblings('.why-footer').stop().fadeOut();
                $(this).siblings('.hr').stop().animate({width:'toggle'}); 
            }
    }, '.why');
    var last_selected_opt;
    $('div.wizard-panel').on({
        'click': function() {
            if ($(this).hasClass('multiple')) {
                if ($(this).hasClass('option-selected')) {
                    $('.show-matches').hide();
                    $(this).removeClass('option-selected');
                    $('.wizard-panel').removeClass('enableHover');
                    setTimeout(
                        function() {
                            $('.wizard-panel').addClass('enableHover');
                        }, 1000);
                    return;
                }else if ($(this).parent().parent().find('.option-selected').length == 3) {
                    last_selected_opt.removeClass('option-selected');
                    last_selected_opt = $(this);
                    show_matches();
                }else if ($(this).parent().parent().find('.option-selected').length == 2) {
                    last_selected_opt = $(this);
                    show_matches();
                }
            }
            curr_q = $(this).parent().parent().parent();
            if (!$(this).hasClass('multiple') && curr_q.find('.option-selected').length > 0) {
                curr_q.find('.option-selected').removeClass('option-selected');
            }
            $(this).addClass('option-selected');
            if ($(this).hasClass('multiple')) {
                return;
            }
            //$(this).parent().parent().find('.option').removeClass('option-selected');
            next_q = curr_q.next();
            curr_q.nextAll('.question-panel').hide();
            $('.show-matches').hide();
            next_q.find('.option').removeClass('option-selected');
            next_q.find('.hr').hide();
            next_q.find('.how-footer').hide();
            next_q.show();
            if (next_q.is(':visible')) {
                $("html, body").animate({ scrollTop: next_q.offset().top-130 }); 
            } else {
                $("html, body").animate({ scrollTop: curr_q.offset().top-100 }); 
            }
        }
    }, '.option');
    var gather_questionnaire = function() {
        questionnaire = [];
        $('.wizard-panel').find('.question-panel').each(function(){
            options = [];
            $(this).find('.option-selected').each(function(){
                options.push($(this).attr('id'));
            });
            questionnaire.push({
                'id': $(this).attr('id'),
                'options': options 
            });
        });
        return questionnaire;
    }
    var submit_wizard = function(questionnaire) {
        $.ajax({
            url: submit_url,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify(questionnaire)
            },
            success: function(data) {
                get_params = $.param(data);
                window.location = "/wizard/results?"+get_params;
            },
            failure: function(data) {
                alert_custom("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert_custom("Error: Please contact sysadmin");
            }
        })
    }

    var show_matches = function() {
        //$('.show-matches').closest('.question-panel').height("600px");
        $('.show-matches').fadeIn();
        $("html, body").animate({ scrollTop: $('.show-matches').offset().top-200 });
    };
    $('.wizard-panel').on({
        'click': function() {
            submit_wizard(gather_questionnaire());
        }
    }, '.show-matches');
});
