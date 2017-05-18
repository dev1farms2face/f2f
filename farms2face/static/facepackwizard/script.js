var url__get_skinconcern_list = "/get_skinconcern_list";
var url__post_facepacks = "/post_facepacks/";
var url__post_add_cart = "/post_add_cart/";
var url__post_remove_cart = "/post_remove_cart/";

var skintype_id = null;
var skinconcern_ids = [];
var last_skinconcern = null;
var alreadysuggesting = false;
var skin_type_selected = false;

$(document).ready(function(){
    $(".skintype").hover(function(){
        $(this).addClass('skintype-hover', {duration: 100});
    }, function() {
        $(this).removeClass('skintype-hover', {duration: 100});
    });
    $(".skintype").click(function(){
        var this_selected = false;
        var attr = $(this).attr('selected');
        if (typeof attr !== typeof undefined && attr !== false) {
            this_selected = true;
        }
        if(this_selected) {
            $(this).removeAttr("selected");
            $(document).find('.skintype').removeClass('skintype-hover');
            $('.skinconcern-panel').find('.skinconcern').remove();
            $('.skinconcern-panel').hide();
            $('.facepack').remove();
            $('.wizard').hide();   
            alreadysuggesting = false;
            $(document).find('.skintype').removeClass('skintype-shadow');
            $(document).find('.skintype').removeClass('skintype-click');
            $(document).find('.skintype').removeAttr('selected');
            return;
        }
        $(document).find('.skintype').removeClass('skintype-shadow');
        $(document).find('.skintype').removeClass('skintype-click');
        $(document).find('.skintype').removeAttr('selected');
        if(!this_selected){
            $(document).find('.skintype').addClass('skintype-shadow');
	    $(this).removeClass('skintype-shadow').addClass('skintype-click');
            $(this).attr("selected","selected");
	}
        skintype_id = $('.skintypes').find('[selected="selected"]').find('label').attr('id');
        if(!$('.skinconcern-panel').is(':visible'))   
            fetch_skin_concern_list();
        if(alreadysuggesting &&
             $(".skinconcerns").find(".skinconcern[selected='selected']").length == 3 )
            fetch_facepacks(skintype_id, skinconcern_ids);
    });
    var fetch_skin_concern_list = function() {
        // GET skinconcern list from server
        $.ajax({
            url: url__get_skinconcern_list,
            type: 'GET',
            success: function(data) {
                data=$.parseJSON(data);
                skinconcern_list = []
                for(i=0; i<data.length; i++) {
                    skinconcern_list.push(data[i])          
                }
                skinconcern_list.reverse();
	        display_skin_concerns(skinconcern_list);
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    function display_skin_concerns(skinconcern_list) {
        for(i=0; i<skinconcern_list.length; i++) {
            var s = $('#skinconcern-dummy > .skinconcern').clone()
            s.find(".skinconcern-name").html(skinconcern_list[i]['name']);
            s.find(".skinconcern-name").attr('id',skinconcern_list[i]['id']);
            s.insertAfter($('.skinconcerns').find('.question'));
        }
        $('.skinconcern-panel').fadeIn("fast", function() {
        	$('.skinconcern-panel').fadeIn(200);   
	});
    }
    $(".skinconcerns").on({
        mouseenter: function() {
                $(this).addClass('skinconcern-hover', {duration: 100});
            },
        mouseleave: function() {
                $(this).removeClass('skinconcern-hover', {duration: 100});
            },
        click: function() {
            $(document).find('.skintype').removeClass('skinconcern-hover');
            if(!$(this).hasClass('skinconcern-click') &&
                $(".skinconcerns").find(".skinconcern[selected='selected']").length == 3) {
                //alert("Please limit your selection to 3 skin concerns only");
                last_skinconcern.removeAttr("selected");
                last_skinconcern.removeClass('skinconcern-click');
                last_skinconcern.removeClass('skinconcern-hover');
                $(this).addClass('skinconcern-click');
                $(this).attr("selected","selected");
                last_skinconcern = $(this);
                fn_skinconcern_next_step();
            } else {
                $('.facepack').remove();
                $('.wizard').hide();   
                if($(this).hasClass('skinconcern-click')) {
                    $(this).removeAttr("selected");
	            $(this).removeClass('skinconcern-click');
	            $(this).removeClass('skinconcern-hover');
                }else{
	            $(this).addClass('skinconcern-click');
                    $(this).attr("selected","selected");
                    last_skinconcern = $(this);
	        }
                fn_skinconcern_next_step();
            }
        }
    }, ".skinconcern");
    var fn_skinconcern_next_step = function() {
        if($(".skinconcerns").find(".skinconcern[selected='selected']").length == 3) {
            skinconcern_ids = []
            $('.skinconcerns').find('[selected="selected"]').find('label').each(function() {
                skinconcern_ids.push($(this).attr('id'));
            });
            $('.wizard').fadeIn(200);
            if(alreadysuggesting) {
                fetch_facepacks(skintype_id, skinconcern_ids);
            }
        }
    }
    $('.wizard').hover(function(){
        $(this).addClass('wizard-hover', {duration: 100}); 
    }, function() {
        $(this).removeClass('wizard-hover', {duration: 10}); 
    });
    $('.wizard').mousedown(function(){
        $(this).removeClass('wizard-hover', {duration: 100}); 
        $(this).addClass('wizard-click');
    });
    $('.wizard').mouseup(function(){
        $(this).removeClass('wizard-click');
        alreadysuggesting = true;
        fetch_facepacks(skintype_id, skinconcern_ids);
    });
    var fetch_facepacks = function(skintype_id, skinconcern_ids) {
        // POST skintype and skinconcern data to server, fetch facepacks
        $.ajax({
            url: url__post_facepacks,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify({
                    'skintype_id': skintype_id,
                    'skinconcern_ids': skinconcern_ids,
                })
            },
            success: function(data) {
	        display_facepacks(data);
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    var display_facepacks = function(facepack_list) {
        $('.wizard-panel').find('.facepack').remove();
        for(i=0; i<facepack_list.length; i++) {
            fp_str = facepack_list[i]['string'].join(' + ');
            recipe_ids = facepack_list[i]['recipe_ids'];
            optional_id = facepack_list[i]['optional_id'];
            base_id = facepack_list[i]['base_id'];
            mixing_agent_id = facepack_list[i]['mixing_agent_id'];
            $('.wizard-panel').append("<div class='facepack' "+
                               " recipe_ids='"+recipe_ids+"'"+
                               " optional_id='"+optional_id+"'"+
                               " base_id="+base_id+
                               " mixing_agent_id="+mixing_agent_id+
                               "><div class='facepack-name'>"+fp_str+"</dev></dev>");
        }
    }
    $(".wizard-panel").on({
        mouseenter: function() {
                if($('.user').text() == "")
                    return;
                if($(this).find('.added-to-cart').length == 0) {
                    $("<div class='add-to-cart'>Add to Cart</div>").insertAfter($(this).find('.facepack-name'));
                    $(this).addClass('facepack-hover', {duration: 10});
                }
            },
        mouseleave: function() {
                if($('.user').text() == "")
                    return;
                if($(this).find('.added-to-cart').length == 0) {
                    $(this).parent().find('.add-to-cart').remove();
                    $(this).removeClass('facepack-hover', {duration: 10});
                }
            },
    }, ".facepack");
    var add_fp_to_cart = function(facepack_data, parent) {
        $.ajax({
            url: url__post_add_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify(facepack_data)
            },
            success: function(data) {
                parent.attr('facepack_id',data['facepack_id'])
                $('.cart-count').text("{"+data['cart_size']+"}");
                $('.cart-link').effect("highlight", { 'color': '#FF3898' }, 300);
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    var remove_fp_from_cart = function(facepack_data, parent) {
        $.ajax({
            url: url__post_remove_cart,
            type: 'POST',
            dataType: "json",
            data: {
                'csrfmiddlewaretoken': $("[name='csrfmiddlewaretoken']").attr('value'),
                'data' : JSON.stringify(facepack_data)
            },
            success: function(data) {
                parent.removeAttr('facepack_id');
                $('.cart-count').text("{"+data['cart_size']+"}");
                $('.cart-link').effect("highlight", { 'color': '#FF3898' }, 300);
            },
            failure: function(data) {
                alert("Error: Please contact sysadmin");
            },
            error: function(data) {
                alert("Error: Please contact sysadmin");
            }
        })
    }
    $(".wizard-panel").on({
        mousedown: function() {
                $(this).addClass('add-to-cart-click');
                $("<div class='added-to-cart'>Added to Cart</div>").
                        insertAfter($(this).parent().find('.facepack-name'));
                facepack_data = {
                    'recipe_ids' : $(this).parent().attr('recipe_ids'),
                    'base_id': $(this).parent().attr('base_id'),
                    'mixing_agent_id': $(this).parent().attr('mixing_agent_id'),
                    'optional_id': $(this).parent().attr('optional_id')
                }
                add_fp_to_cart(facepack_data, $(this).parent());
                $(this).remove();
            },
        mouseup: function() {
                $(this).removeClass('add-to-cart-click');
            },
    }, ".add-to-cart");
    $(".wizard-panel").on({
        mousedown: function() {
                facepack_data = {
                    'facepack_id' : $(this).parent().attr('facepack_id'),
                } 
                remove_fp_from_cart(facepack_data, $(this).parent());
                $(this).remove();
            },
    }, ".added-to-cart");
});
