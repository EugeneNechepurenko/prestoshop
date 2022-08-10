{**
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
 *}
<div id="blockcart-modal" class="modal fade custom_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="material-icons">close</i></span>
        </button>
        <h4 class="modal-title h6 text-sm-center" id="myModalLabel"><span class="cart_title_icon">&gt;</span>{l s='We hebben %s toegevoegd aan jouw winkelmandje!' sprintf=[$product.name] d='Shop.Theme.Checkout'}</h4>
        <p class="cart_title_total">
		  {l s='Totale prijs:' d='Shop.Theme.Checkout'}
          {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
            <strong>{$cart.totals.total_including_tax.value}</strong>
          {else}
          <strong>{$cart.totals.total.value}</strong>
          {/if}
        </p>

        <p class="cart_weight">
		  {l s='Totale gewicht:' d='Shop.Theme.Checkout'}
          <strong>{$cart.total_weight|string_format:"%.2f"}{Configuration::get('PS_WEIGHT_UNIT')}</strong>
        </p>		
      </div>
      <div class="modal-body">
        <div class="row cart_discount_row">
          <div class="cart_discount_container">
			{**
			* Value that are left to get discount are hardcoded in /home/xavies/domains/dev.xavies.be/htdocs/src/Adapter/Presenter/Cart/CartPresenter.php
			* function present
			* ---Jusja--- 04/01/2021
			*}
			{if isset($cart.discountWeightLeft) && $cart.discountWeightLeft>0}
				<p>{l s='Bestel nog %weight% %unit% voor GRATIS levering.' sprintf=['%weight%' => $cart.discountWeightLeft, '%unit%' => Configuration::get('PS_WEIGHT_UNIT')] d='Shop.Theme.Checkout'}</p>
            {/if}
			
			{if isset($cart.discountAmountLeft) && !empty($cart.discountAmountLeft)}
				<p>{l s='Bestel nog %amount% voor 10 %prc% KORTING.' sprintf=['%amount%' => $cart.discountAmountLeft, '%prc%' => '%'] d='Shop.Theme.Checkout'}</p>
			{/if}
          </div>
        </div>
		{*
        <div class="row cart_product_lines">
          <div class="col-md-5 divide-right">
            <div class="row">
              <div class="col-md-6">
                <img class="product-image" src="{$product.cover.medium.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
              </div>
              <div class="col-md-6">
                <h6 class="h6 product-name">{$product.name}</h6>
                <p class="product-price">{$product.price}</p>
                {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                {foreach from=$product.attributes item="property_value" key="property"}
                <span>{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}<strong> {$property_value}</strong></span><br>
                {/foreach}
                <span>{l s='Quantity:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>
              </div>
            </div>
          </div>
		  
          <div class="col-md-7">
            <div class="cart-content">
              {if $cart.products_count > 1}
                <p class="cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
              {else}
                <p class="cart-products-count">{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
              {/if}
              <p><span class="label">{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.products.value}</span></p>
              <p><span>{l s='Shipping:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span></p>

              {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                <p><span>{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>&nbsp;<span>{$cart.totals.total.value}</span></p>
                <p class="product-total"><span class="label">{$cart.totals.total_including_tax.label}</span>&nbsp;<span class="value">{$cart.totals.total_including_tax.value}</span></p>
              {else}
                <p class="product-total"><span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>&nbsp;<span class="value">{$cart.totals.total.value}</span></p>
              {/if}

              {if $cart.subtotals.tax}
                <p class="product-tax">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;<span class="value">{$cart.subtotals.tax.value}</span></p>
              {/if}

              <div class="cart-content-btn">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
                <a href="{$cart_url}" class="btn btn-primary"><i class="material-icons rtl-no-flip">&#xE876;</i>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
              </div>
            </div>
          </div>
		  *}
        </div>
		{*
        <div class="row cart_footer_row">
          <div class="cart_info_ticks">
            <p>{l s='GRATIS VERZENDING vanaf € 25' d='Custom'}</p>
            <p>{l s='Vragen? Bel ons op 051 31 27 05' d='Custom'}</p>
            <p>{l s='10% KORTING bij aankoop van > 5kg XAVIES’ Granola' d='Custom'}</p>
          </div>
        </div>
		*}
      </div>
    </div>
  </div>
</div>
