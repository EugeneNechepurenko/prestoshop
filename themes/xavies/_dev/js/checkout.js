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
import $ from 'jquery';
import prestashop from 'prestashop';

function setUpCheckout() {
  $('.js-terms a').on('click', (event) => {
    event.preventDefault();
    var url = $(event.target).attr('href');
    if (url) {
      // TODO: Handle request if no pretty URL
      url += `?content_only=1`;
      $.get(url, (content) => {
        $('#modal').find('.js-modal-content').html($(content).find('.page-cms').contents());
      }).fail((resp) => {
        prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
      });
    }

    $('#modal').modal('show');
  });

  // $(document).on('click','.js-gift-checkbox, .js-gift-checkbox+span',function (e){
  //   // alert('themes/xavies/_dev/js/checkout.js:46');
  //   // e.preventDefault();
  //   $('label',$(this).parent()).click();
  //   $('#gift').collapse('toggle');
  // });
}

function toggleImage() {
  // Arrow show/hide details Checkout page
  $('.card-block .cart-summary-products p a').on('click', function (icon) {
    icon = $(this).find('i.material-icons');
    if (icon.text() == 'expand_more') { 
      icon.text('expand_less'); 
    } else { 
      icon.text('expand_more'); 
    }
  });
}

function updateTabs(){
  if ($('#checkout-addresses-step-tab').hasClass('active')) {
	$('.checkout-card-div').show();
	$('#content .cart-grid-body').addClass('col-lg-8').removeClass('full_width');
  } else {
	$('.checkout-card-div').hide();	
	$('#content .cart-grid-body').removeClass('col-lg-8').addClass('full_width');
  }
}

$(document).ready(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
    toggleImage();
  }
  
  //checkout page
  updateTabs();
  $('#checkout_tabs li a').click(function() {
	  window.setTimeout(updateTabs, 300); 
  }); 
  
  // active tab
  $('#checkout_tabs a.is_current').tab('show');
  
  // back btn
  $('body#checkout .back_button_container a').click(function() {
	  var link = $(this).attr('data-id');
	  $('#'+link).click();
  }); 
  
  prestashop.on('updatedDeliveryForm', (params) => {
    if (typeof params.deliveryOption === 'undefined' || 0 === params.deliveryOption.length) {
        return;
    }
    // Hide all carrier extra content ...
    $(".carrier-extra-content").hide();
    // and show the one related to the selected carrier
    params.deliveryOption.next(".carrier-extra-content").slideDown();
  });
  
  
  
});


