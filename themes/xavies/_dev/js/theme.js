/**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
import 'expose-loader?Tether!tether';
import 'bootstrap/dist/js/bootstrap.min';
import 'flexibility';
import 'bootstrap-touchspin';

import './responsive';
import './checkout';
import './customer';
import './listing';
import './product';
import './cart';

import DropDown from './components/drop-down';
import Form from './components/form';
import ProductMinitature from './components/product-miniature';
import ProductSelect from './components/product-select';
import TopMenu from './components/top-menu';

import prestashop from 'prestashop';
import EventEmitter from 'events';

import './lib/bootstrap-filestyle.min';
import './lib/jquery.scrollbox.min';
import './lib/jquery.custom-scrollbar.min';
import './lib/jquery.mCustomScrollbar.concat.min';
import './lib/slick.min';

import './components/block-cart';

// "inherit" EventEmitter
for (var i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

if(jQuery('#module-prestablog-blog').length > 0) {
  let el = jQuery('#left-column');
  el.insertBefore('#content-wrapper');
}
if(window.outerWidth <= 1275){
  $('#left-column').addClass('hide_filters');

  let arr2 = $('body#history .show_scroll > .order_container');
  if($('body#history .show_scroll > .order_container').length > 3) {
    // $("body#history .show_scroll").customScrollbar();
    $("body#history .show_scroll").customScrollbar();
    // $('body#history .order_table').css({
    //   'min-height' : ($(arr2[0]).height() + $(arr2[1]).height() + $(arr2[3]).height()) + 'px',
    //   'height' : ($(arr2[0]).height() + $(arr2[1]).height() + $(arr2[3]).height()) + 'px',
    // });
  }
}

$(document).ready(() => {
  // if($('body').hasClass('recipes_page')){
  //   if(localStorage.getItem('recept_href',location.href) !== location.href){
  //     console.log('location.href');
  //     console.log(location.href);
  //     console.log('localStorage');
  //     console.log(localStorage.getItem('recept_href',location.href));
  //     localStorage.setItem('recept_href',location.href);
  //   }
  // }else if($('body').hasClass('recipes_detail_page')){
  //   $('.page_back_btn.back_recipe').attr('href',localStorage.getItem('recept_href',location.href))
  // }else{
  //   localStorage.setItem('recept_href',location.href);
  // }

  $('body#module-prestablog-blog #left-column.hide_filters').removeClass('hide_filters');

  let col1 = $('#footer .footer-container .footer_links > .block-contact.links.wrapper > .hidden-sm-down').html();
  $('#footer .footer-container .footer_links > .col-md-6.links > .row').prepend('<div class="col-md-6 wrapper copy_col"></div>');
  $('#footer .footer-container .footer_links > .col-md-6.links > .row > .col-md-6.wrapper:first-child').append(col1);
  $('#footer .footer-container .footer_links > .block-contact.links.wrapper').hide();

  let dropDownEl = $('.js-dropdown');
  const form = new Form();
  let topMenuEl = $('.js-top-menu ul[data-depth="0"]');
  let dropDown = new DropDown(dropDownEl);
  let topMenu = new TopMenu(topMenuEl);
  let productMinitature = new ProductMinitature();
  let productSelect  = new ProductSelect();
  dropDown.init();
  form.init();
  topMenu.init();
  productMinitature.init();
  productSelect.init();

  backButtonUrlRecipe();


  $(document).on('click','.header_search_icon_btn',function(){$('header').toggleClass('show_search')});
  $(document).on('click','.home_buy_product',function(){
    $('.home_buy_product_popup input[name="product_id"]').val($(this).data('product_id'));
    $('.home_buy_product_popup').show();
  });
  $(document).on('click','.close_popup',function(){
    $(this).parent().hide();
  });
  $(document).on('click','.show_all_testimonials_container .show_all_btn',function(){
    $('.testimonial-container #test-contents').toggleClass('show_all_comments');
  });
  $(document).on('click','.acordion_item',function(){
    $(this).toggleClass('open');
    if(window.outerWidth > 500) {
      if ($('.acordion_item.open').length > 0) {
        $('.faq_subtitle_open').show();
        $('.faq_subtitle_close').hide();
      } else {
        $('.faq_subtitle_open').hide();
        $('.faq_subtitle_close').show();
      }
    }
  });
  $(document).on('click','#authentication .custom-checkbox label',function(){
    if($('input:checked',this).length > 0){$(this).parent().addClass('checked')}
    else{$(this).parent().removeClass('checked')}
  });
  $(document).on('click','.help_btn',function(){
    if($(this).data('popup') == '#help_field_password_password') {
      location.href = $('.forgot-password a').attr('href');
    }else{
      $($(this).data('popup')).show();
      $($(this).data('popup')+' + .modal-backdrop').show();
    }
  });
  $(document).on('click','.modal-header .close',function(){
    $($(this).parents('.modal')).hide();
    $('.modal-backdrop').hide();
  });

  $(document).on('click','.prestablog_input_filtre_cat_title',function(){
    $(this).parents('form').toggleClass('hide_categories');
  });
  $(document).on('click','div.custom_filter .side_filter_title',function(){

    let containers = $('#left-column #amazzing_filter .af_filter .af_filter_content');
    for(let i = 0; i < containers.length; i++){
      if($('li',containers[i]).length < 2){
        $(containers[i]).parents('.af_filter').hide();
      }else{
        $(containers[i]).parents('.af_filter').show();
      }
    }
    $(this).parents('.custom_filter').toggleClass('hide_filters');
  });
  $(document).on('click','.custom_filter.hide_filters .side_filter_title_close',function(){

    let containers = $('#left-column #amazzing_filter .af_filter .af_filter_content');
    for(let i = 0; i < containers.length; i++){
      if($('li',containers[i]).length < 2){
        $(containers[i]).parents('.af_filter').hide();
      }else{
        $(containers[i]).parents('.af_filter').show();
      }
    }
    $(this).parents('.custom_filter').toggleClass('hide_filters');
  });
  $(document).on('click','.subscribe_container a.close_subscribe',function(){
	if ($('.subscribe_container').hasClass('hide')) {
	} else {
		sessionStorage.setItem('hide_subscribe_popup', 1);
	}
    $(this).parent().toggleClass('hide');
  });


  $(document).on('click','#left-column .side_filter_title',function(){
    $(this).parents('#left-column').toggleClass('hide_filters');
	// // clear all filters
	// if (!$('#amazzing_filter .clearAll').hasClass('hidden'))
	// {
	// 	$('#amazzing_filter .clearAll').children('a').click();
	// }
  });


  //$("body#cart .cart-items").customScrollbar();
  if(window.outerWidth > 1275) {
    $("body#history .show_scroll tbody").customScrollbar();
  }
  if(window.outerWidth <= 1275) {
    $(document).on('click','#left-column .side_filter_title_close',function(){
      $(this).parents('#left-column').toggleClass('hide_filters');
    });
  }else{

    $(document).on('click','#left-column.hide_filters .side_filter_title_close',function(){
      $(this).parents('#left-column').toggleClass('hide_filters');
    });
    $(document).on('click','body#module-prestablog-blog #left-column.hide_filters .side_filter_title',function(){
      $(this).parents('#left-column').toggleClass('hide_filters');
    });
  }


  $('.products>article .thumbnail-container .product_tips_list li').append('<div class="tips_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>')



  // $( window ).scroll(function() {
    // console.log('scroll');
    // var footer_offset = $('#footer .footer-container').offset();
    // var footer_top = footer_offset.top;
    // var window_bottom =  $(document).scrollTop() + $(window).height();
    //
    // var header_offset = $('#header').offset();
    // console.log(header_offset);
    // var header_bottom = header_offset.top + $('#header').height();
    // console.log(header_bottom);
    // var filter_max_height = footer_top - header_bottom;
    // console.log(filter_max_height);
    //
    //
    // if((footer_top - 1) == filter_bottom){
    //
    // }


/*
    if(window_bottom >= footer_top){
      $("#left-column").addClass('filter_absolute');
      $(".left-column_wrapper").addClass('wrapper_absolute');
      if(window_bottom >= footer_top) {
        $("#left-column").css('max-height', filter_max_height + 'px');
        $(".mCustomScrollBox").css('max-height', 'unset');
      }
    }else{
      $("#left-column").removeClass('filter_absolute');
      $(".left-column_wrapper").removeClass('wrapper_absolute');
      $("#left-column").css('max-height', '100%');
      // $("#left-column").css('max-height', 'calc(100% - 370px)');
      // $(".mCustomScrollBox").css('max-height', '100%');
    }
    */







  // });
  // max-height: 380px;
  // if($('body#contact').length == 0) {
  //   $("#left-column").mCustomScrollbar({
  //     scrollButtons: {enable: true},
  //     scrollInertia: 0,
  //     scrollbarPosition: "inside"
  //   });
  // }


  let slides_recipe = 1;
  let content_width = $('#content-wrapper #content').width();
  if(window.outerWidth > 2500){
    // let li_width = (content_width-16)/4;
    let li_width = 1220;
    $('#cms_pages_list li').attr('style','width:'+li_width+'px !important;max-width:'+li_width+'px !important');
  }else {
    if (window.outerWidth <= 1275 && window.outerWidth > 500) {
      let li_width = window.outerWidth - 36 - 36 - 16;
      $('#cms_pages_list li').attr('style', 'width:' + li_width + 'px !important;max-width:' + li_width + 'px !important');
    } else if (window.outerWidth <= 500) {
      let li_width = window.outerWidth - 36 - 36 - 16;
      $('#cms_pages_list li').attr('style', 'width:' + li_width + 'px !important;max-width:' + li_width + 'px !important');
    } else {
      $('#cms_pages_list li').width(content_width);
    }
  }

  // change for the tablet z-index of the chat after 2 seconds
  setTimeout(function() {
	if(window.outerWidth <= 1024 && window.outerWidth > 500){
	  $('#drift-frame-controller').css('z-index', 2000);
	}
  }, 2000);



  // alert('show_columns');
  // console.log('show_columns');
  // console.log('show_columns');
  // console.log('show_columns');
  /*
if(slides_recipe == 3) {
  console.log('test');
  let items_arr = $('.list-group-item');
  let items_container = $('ul#cms_pages_list');
  let per_column = 6;
  let columns = Math.ceil(items_arr.length/per_column-1);
  let show_columns = 3 - 1;
  let show_columns_max = show_columns;
  let from_column = 0;
  let columns_pages = Math.floor(columns/show_columns);
  let res = [];
  let active_col = 0;
  let page = 1;
  let active_page = 0;
  for (let i = 0; i < items_arr.length; i++) {
    if (!res[active_col]) {
      res.push([]);
    }

    // console.log(items_arr[i]);
    // console.log(res);
    console.log('active_col',active_col);
    res[active_col].push(items_arr[i]);

    if(show_columns > columns){
      if (active_col < columns) {
        // console.log('active_col +',active_col);
        active_col++;
      } else {
        // console.log('active_col RESET TO 0');
        active_col = 0;
      }
    }
    else{
      if (active_col < show_columns) {
        // console.log('active_col +',active_col,' show_columns*page',show_columns*page);
        console.log('GO-1');
        active_col++;
      } else {
        console.log('GO-2');
        if(i == ((per_column)*(show_columns+1)*page)-1){
          console.log('active_col RESET TO 0','page',page,' i=',i,' last on page=',((per_column)*(show_columns+1)*page)-1);
          console.log('page +');
          page++;
          from_column +=show_columns+1;
          show_columns_max += show_columns + 1;
          console.log('from_column',from_column,'show_columns',show_columns+1,'show_columns_max',show_columns_max);
        }
        if(page > 1){
          if (active_col < show_columns_max) {
            // 	    console.log('GO-2-1');
            active_col++;
          } else {
            active_col = from_column;
            // 	    console.log('GO-2-2');
            // 	    active_col = (show_columns+1)*(page-1);
          }
          //
          //     console.log('page',page);
        }
        else {
          active_col = 0;
        }
      }
    }

  }
  console.log('after res');
  console.log(res);
  for(let i=0;i<res.length;i++){
    let html = '<li>';
    for(let j=0;j<res[i].length;j++){
      html += $(res[i][j]).get(0).outerHTML;
      $(res[i][j]).remove();
    }
    html += '</li>';
    $('ul#cms_pages_list').append(html);
  }
}else{
  // chunkArray($('ul#cms_pages_list > div',$0), 6)
}
*/



  $("body#cms.recipes_page section#wrapper .container section#content>ul").slick({
    swipe: false,
    autoplay: false,
    lazyLoad: 'ondemand',
    dots: true,
    arrows: false,
    infinite: false,
    variableWidth: true,
    customPaging : function(slider, i) {
      // var thumb = $(slider.$slides[i]).data();
      return '<a class="slider_pagination_link">'+(i+1)+'</a>';
    },
    slidesToShow: (window.outerWidth <= 1275 && window.outerWidth > 500)? 1 : ((window.outerWidth > 2500)?1:slides_recipe),
    slidesToScroll: slides_recipe

    // responsive: [{
    //   breakpoint: 500,
    //   settings: {
    //     dots: false,
    //     arrows: false,
    //     infinite: false,
    //     slidesToShow: 3,
    //     slidesToScroll: 3
    //   }
    // }]
  });

  show_pagination_links();
  $(document).on('click','.slick-dots li',function(){
    show_pagination_links();
  });


  $( window ).scroll(function() {
    if(($(window).height() + $(document).scrollTop()) === $(document).height()){
      $('.back_to_top').show();
    }else{
      // $('.back_to_top').hide();
    }


    if($(document).scrollTop() >= 160){
      $('.scroll_logo').show();
    }else{
      $('.scroll_logo').hide();
    }
  });

  $(document).on('click','.back_to_top',function (){
    $('html, body').animate({scrollTop: '0px'}, 300);
  });


  if($('.text_switcher').length){
      let loop_duration = $('.text_switcher').data('duration');
      let loop = setInterval(function(){
      let active_index = $('.text_switcher .active').index();
      let slides = $('.text_switcher .txt_slide');
      let slides_n = slides.length;
      $('.text_switcher .txt_slide.active').removeClass('active');
      if(active_index === (slides_n-1)){
        $(slides[0]).addClass('active');
        // console.log(0);
      }else{
        $(slides[active_index+1]).addClass('active');
        // console.log(active_index+1);
      }
    },loop_duration)
  }

  // $( window ).scroll(function() {
  //   let footer_offset = $('#footer .footer-container').offset();
  //   let footer_top = footer_offset.top;
  //   let header_bottom = $('header#header').height() + $(document).scrollTop();
  //   let wrapper_max_height = footer_top - header_bottom;
  //   let product_grid_offset = $('.products .product-miniature').offset();
  //   console.log(product_grid_offset.top);
  //   if(header_bottom <= product_grid_offset.top){
  //     $('.left-column_wrapper').css('padding-top',product_grid_offset.top - $(document).scrollTop());
  //     $('#wrapper #left-column').css('max-height','calc(100% - '+(product_grid_offset.top - $(document).scrollTop())+'px)');
  //   }else{
  //
  //     if($('.left-column_wrapper').hasClass('wrapper_absolute')){
  //       $('.left-column_wrapper').css('height',wrapper_max_height+'px');
  //       $('#wrapper #left-column').css('max-height','100%');
  //     }else{
  //       $('.left-column_wrapper').css('height','100vh');
  //       $('.left-column_wrapper').css('padding-top',100);
  //       $('#wrapper #left-column').css('max-height','calc(100% - '+ 100 +'px)');
  //     }
  //
  //   }
  // });



  $(document).on('click','.mobile_menu',function (){
    $('body').toggleClass('open_menu');
  })
  $(document).on('click, mouseup, touchend','.menu > ul > li:not(.active_menu)',function(e){
    if($('div.sub-menu',$(this)).length){
      if ($(this).hasClass('active_menu')){
        $(this).removeClass('active_menu');
      }else{
		e.preventDefault();
        $(this).addClass('active_menu');
      }
    }
  });
  $(document).on('click, mouseup, touchend','.menu > ul > li.active_menu a',function(e){
    $(this).removeClass('active_menu');
  })


  $(document).on('click','.side_filter_title_close',function(){
    $('#amazzing_filter .compact-toggle').click();
  })



  if(window.outerWidth <= 1275){
    let arr1 = $('body#cart .cart-items > li');
    if($('body#cart .cart-items > li').length > 3) {
      $('body#cart .cart-items').css('min-height', ($(arr1[0]).height() + $(arr1[1]).height() + $(arr1[3]).height()) + 'px');
      $("body#cart .cart-items").customScrollbar();
    }
    let arr2 = $('body#history .show_scroll > .order_container');
    if($('body#history .show_scroll > .order_container').length > 3) {
      // $("body#history .show_scroll").customScrollbar();
      $("body#history .show_scroll").customScrollbar();
      $('body#history .show_scroll').css({
        'min-height' : ($(arr2[0]).height() + $(arr2[1]).height() + $(arr2[3]).height()) + 'px',
        'height' : ($(arr2[0]).height() + $(arr2[1]).height() + $(arr2[3]).height()) + 'px',
      });
    }

    $(document).on('click','#header .site_navigation .nav_line div.search input[type="text"]',function(){
      $('body').addClass('open_menu');
      $('#header .site_navigation .nav_line div.search input[type="text"]').focus();
    })



    // $(document).on('click','body#module-prestablog-blog #wrapper #left-column ul label',function(){
    //   $('#left-column').addClass('hide_filters')
    // })
  }

  if(location.href.indexOf('/blog')>0 && window.outerWidth <= 1275){
    if (!$('#amazzing_filter').hasClass('horizontal-layout')) {
      $('.af_subtitle').on('click', function(e){
        e.preventDefault();

        let parent = $(this).parent().parent();
        console.log(parent);
        console.log($('input:checked',parent).length);
        if($('input:checked',parent).length == 0) {
          var $filter = $(this).closest('.af_filter');
          $filter.toggleClass('closed');
          // if ($filter.hasClass('type-3') && !$filter.hasClass('closed')) {
          //   try {
          //     $filter.find('.af-select').uniform()
          //   } catch (err) {}
          // }
          // if ($filter.hasClass('has-slider') && !$filter.hasClass('closed')) {
          //   var type = $filter.data('trigger');
          //   updateAmazzingSlider(type, getSliderValues(type));
          // }
          // if (af_compactView) {
          //   $filter.siblings('.af_filter').addClass('closed');
          // }
        }
      });
    }
  }


  // if(window.outerWidth <= 1275 && window.outerWidth > 500){
  //   $(document).on('click','li#category-21 > a', function(){
  //     e.preventDefault()
  //   })
  // }

  if(location.href.indexOf('/order') > 0 && $('#checkout-delivery-step.is_current.active').length > 0){
    $(document).on('click','.js-gift-checkbox, .js-gift-checkbox+span',function (e){
      // alert('themes/xavies/_dev/js/theme.js:579');
      // e.preventDefault();
      $('label',$(this).parent()).click();
      $('#gift').collapse('toggle');
    });
  }

  // $(document).on('click','.back_recipe',goBackRecipe);
  // $(document).on('click','.page_back_btn:not(.back_recipe)',goBack);

  // $(document).on('click','.af_filter input',function(){
  //   if($('body').hasClass('recipes_page') > 0) {
  //     setTimeout(function () {
  //       localStorage.setItem('recept_href',location.href);
  //     }, 100);
  //   }
  // });



  if(window.outerWidth <= 1275){
    console.log('module-prestablog-blog click1');
    // $(document).on('click','body#module-prestablog-blog section#wrapper div#content-wrapper ul li .block_bas a.blog_link',function(e){
    //   console.log('module-prestablog-blog click2');
    //   if(!$(this).hasClass('click_go')) {
    //     console.log('module-prestablog-blog click3');
    //     e.preventDefault();
    //     $(this).addClass('click_go');
    //     $(this).parents('.blog-grid').toggleClass('show_text');
    //     console.log('module-prestablog-blog click4');
    //   }
    // });
    $(document).on('click','body#module-prestablog-blog section#wrapper div#content-wrapper ul li.blog-grid',function(e){

      // console.log('module-prestablog-blog click2');
      if(!$('a.blog_link',this).hasClass('click_go')) {
        // console.log('module-prestablog-blog click3');
        e.preventDefault();
        $('a.blog_link',this).addClass('click_go');
        $('a.blog_link',this).parents('.blog-grid').toggleClass('show_text');
        // console.log('module-prestablog-blog click4');
      }
    });
  }
});

function show_pagination_links(){
  $('.slick-dots').removeClass('show_all_links');
  $('.slick-dots li').removeClass('show_link');
  var pag = $('.slick-dots li');
  var active_slide_page = $('.slick-dots .slick-active').index();
  if(pag.length > 3){
    if(active_slide_page == 0){
      $(pag[active_slide_page]).addClass('show_link');
      $(pag[active_slide_page+1]).addClass('show_link');
      $(pag[active_slide_page+2]).addClass('show_link');
    }else if(active_slide_page+1 == pag.length){
      $(pag[active_slide_page]).addClass('show_link');
      $(pag[active_slide_page-1]).addClass('show_link');
      $(pag[active_slide_page-2]).addClass('show_link');
    }else{
      $(pag[active_slide_page]).addClass('show_link');
      $(pag[active_slide_page+1]).addClass('show_link');
      $(pag[active_slide_page-1]).addClass('show_link');
    }
  }else{
    $('.slick-dots').addClass('show_all_links');
  }
}

/**
 * Returns an array with arrays of the given size.
 *
 * @param myArray {Array} array to split
 * @param chunk_size {Integer} Size of every group
 */
function chunkArray(myArray, chunk_size){
  var index = 0;
  var arrayLength = myArray.length;
  var tempArray = [];

  for (index = 0; index < arrayLength; index += chunk_size) {
    myChunk = myArray.slice(index, index+chunk_size);
    // Do something if you want with the group
    tempArray.push(myChunk);
  }

  return tempArray;
}
// Split in group of 3 items
// var result = chunkArray([1,2,3,4,5,6,7,8], 3);
// Outputs : [ [1,2,3] , [4,5,6] ,[7,8] ]
// console.log(result);



function backButtonUrlRecipe() {
	// add filter options to the back button
	let storageName = 'recipebackbtn';
    if ($("body").is("#cms")) {
		let search = document.referrer.split('?')[1];
		let el = $('.back_recipe');
		let url = el.attr('href');

		if (typeof search !== 'undefined' && search != '' && (url && url.indexOf('?') == -1) ) {
			url = el.attr('href') + '?' + search;
			window.localStorage.setItem(storageName, url);
		}

		if ( window.localStorage.getItem(storageName) !== null) {
			url = window.localStorage.getItem(storageName);
		}

		el.attr('href', url);
    } else {
		window.localStorage.removeItem(storageName);
	}
}


function goBack() {
  window.history.back();
}
function goBackRecipe(e) {
  window.history.back();
}



