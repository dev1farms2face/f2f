var url_save_myaccount_details = "/post_save_myaccount_details/";
var url_upload_review_pic = "/post_upload_review_pic/";
var url_associate_review_pic = "/post_associate_review_pic/";
var url_save_review = "/post_save_review/";
var url_delete_review = "/post_delete_review/";
var url_delete_review_pic = "/post_delete_review_pic/";
var url_get_review = "/get_review/";

var removeReviewPic = function(ri) {
    $.ajax({
        url: url_delete_review_pic,
        type: 'POST',
        dataType: "json",
        data: {
            'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
            'data' : JSON.stringify({"ri_id": ri.attr('id')})
        },
        success: function(data) {
            $(ri).remove();
        },
        failure: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        }
    })
}

var getReview = function(tr, r_id) {
    div_pic = $(tr).find('div.pic-container');
    $.ajax({
        url: url_get_review+r_id,
        type: 'GET',
        success: function(data) {
            data=$.parseJSON(data);
            $(tr).find('input.title').val(data['title']);
            $(tr).find('textarea').val(data['details']);
            $(tr).find('img.star:lt('+data['rating']+')').each(function(){
                $(this).attr('src', $(this).attr('full_star'));
            });
            $.each(data['pics'], function(i, v) {
                pic_url = v['url']
                ri_id = v['id'];
                div_pic.append("<div class='pic' id='"+ri_id+
                  "'><img class='review-pic' src='"+pic_url+
                  "'><div class='remove'><p>delete</p></div></div>");
            });
            $(tr).find('img.star:eq('+(parseInt(data['rating'])-1)+')').mouseover().click();
        },
        failure: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        }
    })
}
var saveReview = function(r) {
    $.ajax({
        url: url_save_review,
        type: 'POST',
        dataType: "json",
        data: {
            'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
            'data' : JSON.stringify(r)
        },
        success: function(data) {
            alert_custom("Thanks for the Review!", function(){
                location.reload(); 
            }, "");
        },
        failure: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        }
    })
}

var deleteReview = function(tr, id) {
    $.ajax({
        url: url_delete_review,
        type: 'POST',
        dataType: "json",
        data: {
            'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
            'data' : JSON.stringify({"review_id": id})
        },
        success: function(data) {
            location.reload();
        },
        failure: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        }
    })
}

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
            alert_custom("Error: Please contact sysadmin");
            location.reload();
        },
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
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
            alert_custom("Error: Please contact sysadmin");
        },  
        error: function(data) {
            alert_custom("Error: Please contact sysadmin");
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
    $('table.account.details-panel img.pen').click(function(){
        $(this).prev('input.value').focus();
    });
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
        $.ajax({
          type: 'POST',
          url: $('div.photo').attr('url'),
          data: imgData,
          processData: false,
          contentType: false,
          cache: false,
          success: function(result) {
              result = $.parseJSON(result);
              if(result['success'])
                  location.reload();
              else
                  alert_custom("Invalid file. Please upload .jpg or .png");
          },
          error: function(result) {
              alert_custom("Error: Please contact sysadmin");
          }
        });
    });
    $('div.photo label').click(function(e){
        e.preventDefault();
        $('div.photo #upload').trigger('click');
    });
    $('table.subscription-panel td.type select').on('change', function() {
        confirm_custom("Are you sure you want to change your subscription type?", function(t) {
            tr = t.closest('tr');
            updatePh(tr.attr('id'), 'ph_qty', t.val(), tr.attr('url'));
        }, $(this));
    });
    $('table.subscription-panel td.item div.ship-date input').blur(function(){
        if($(this).attr('orig') != $(this).val()) {
            t = $(this);
            confirm_custom("Are you sure you want to reset your subscription ship-date?", 
            function(t){
                tr = t.closest('tr');
                updatePh(tr.attr('id'), 'ph_date', t.val(), tr.attr('url'));
            }, t,
            function(t) {
                t.val(t.attr('orig'));
            }, t);
        } 
    });
    $('div.myaccount-panel div.content-panel table.order-history p.review').click(function(){
        if($(this).attr('open')) {
            $(this).removeAttr('open');
            $(this).closest('tr').next().slideUp().remove();
            $(this).text($(this).attr('orig')); 
            $(this).removeAttr('orig');
        } else {
            var newReview = $('div.myaccount-panel div.content-panel div.review-dialog tr').clone();
            $(this).closest('tr').after(newReview);
            newReview.slideDown();
            newReview.find('input').css('width','100%');
            newReview.find('textarea').css('width','100%');
            newReview.find('textarea').css('height','200px');
            newReview.find('p.rating-status').css('min-height','20px');
            //newReview.find('p.submit').hide();
            if($(this).attr('id')) {
                getReview(newReview, $(this).attr('id'));
                newReview.find('p.submit').text('Update Review');
            } else {
                newReview.find('p.delete').hide();
            }
            $(this).attr('open','open');
            $(this).attr('orig',$(this).text());
            $(this).text("Hide"); 
            $("html, body").animate({ scrollTop: newReview.offset().top - 100 });
        }
    });
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'keyup paste': function() {
            this_val = $(this).val();
            len = this_val.length;
            $(this).next('p.error').remove();
            if(len > 1000) {
                $(this).after("<p class='error'>Cannot be more than 1000 characters</p>");
            }
            submit_button = $(this).siblings('p.submit'); 
            if(len > 1000) {
                $(this).val(this_val.substring(0,1000)); 
                submit_button.unbind('click');
                submit_button.hide();
            }else{
                submit_button.bind('click');
                submit_button.show();
            }
        }
    }, 'textarea');
    $('div.myaccount-panel div.content-panel table.order-history').on({
      'mouseover': function() {
          parent = $(this).closest('div.rating');
          if(parent.attr('clicked'))
              return;
          rating = $(this).closest('tr').find('img.star').index($(this)) + 1; 
          $(this).parent().find('img.star:lt('+rating+')').each(function(){
              $(this).attr('src', $(this).attr('full_star'));
          });
          $(this).closest('tr').find('p.rating-status').text($(this).attr('helper'));
      },
      'mouseout': function() {
          parent = $(this).closest('div.rating');
          if(parent.attr('clicked'))
              return;
          rating = $(this).closest('tr').find('img.star').index($(this)) + 1; 
          $(this).parent().find('img.star').each(function(){
              $(this).attr('src', $(this).attr('empty_star'));
          });
          $(this).closest('tr').find('p.rating-status').text("");
      },
      'click': function() {
          parent = $(this).closest('div.rating');
          if(parent.attr('clicked')) {
              parent.removeAttr('clicked');
              parent.removeAttr('rating');
              parent.find('img.star').each(function(){
                  $(this).attr('src', $(this).attr('empty_star'));
              }); 
              parent.closest('tr').find('p.rating-status').text("");
          } else {
              parent.attr('clicked','clicked');
              rating = $(this).closest('tr').find('img.star').index($(this)) + 1; 
              parent.attr('rating',rating);
          }
          parent.siblings('textarea').keyup();
      }
    }, 'img.star');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'click': function() {
            $(this).closest('tr').prev().find('p.review').click();
        }
    }, 'p.cancel');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'click': function() {
            review_details = $(this).siblings('textarea').val();
            review_title = $(this).siblings('input').val();
            review_rating = $(this).siblings('div.rating').attr('rating');
            fp_id = $(this).closest('tr').prev('tr').attr('id');
            review_id = $(this).closest('tr').prev('tr').find('p.review').attr('id');
            review = $(this).closest('tr').prev('tr').find('p.review');
            if(review_title.trim().length == 0) {
                alert_custom('Choose valid title');
            }
            else if(!review_rating) {
                alert_custom('Choose valid rating');
            } else {
                ri_ids = [];
                $(this).closest('tr').find('div.pic').each(function(){
                    ri_ids.push($(this).attr('id'));
                });
                saveReview({
                    'review_id'  : review_id,
                    'review'     : review,
                    'fp_id'      : fp_id,
                    'details'    : review_details,
                    'title'      : review_title,
                    'rating'     : review_rating,
                    'ri_ids'     : ri_ids,
                });
            }
        }
    }, 'p.submit');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'click': function() {
            t = $(this);
            review_id = t.closest('tr').prev('tr').find('p.review').attr('id');
            confirm_custom("Are you sure you want to delete this review?", function(t){
                deleteReview(t.closest('tr').prev('tr').find('p.review'), review_id);
            }, t);
        }
    }, 'p.delete');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'change' : function(){
            var file, imgData;
            file = this.files[0];
            imgData = new FormData();
            imgData.append('pic', file);
            div_pic = $(this).closest('td').find('div.pic-container');
            $.ajax({
              type: 'POST',
              url: url_upload_review_pic,
              data: imgData,
              processData: false,
              contentType: false,
              cache: false,
              success: function(result) {
                  result = $.parseJSON(result);
                  if(result['success']) {
                      pic_url = result['pic_url'];
                      ri_id = result['ri_id'];
                      div_pic.append("<div class='pic' id='"+ri_id+
                        "'><img class='review-pic' src='"+pic_url+
                        "'><div class='remove'><p>delete</p></div></div>");
                  } else {
                      alert_custom("Invalid file. Please upload .jpg or .png");
                  }
              },
              error: function(result) {
                  alert_custom("Error: Please contact sysadmin");
              }
            });
        }
    }, 'input.upload-review-pic');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'click': function() {
            review_id = $(this).closest('tr.review').prev().attr('id');
            input = $(this).prev();
            input.trigger('click');
        }
    }, 'label.upload');
    $('div.myaccount-panel div.content-panel table.order-history').on({
        'click': function() {
            confirm_custom("Delete pic? This cannot be undone", function(t) {
                removeReviewPic(t.closest('div.pic'));
            }, $(this));
        }
    }, 'div.remove');
});
