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
{extends file=$layout}

{block name='content'}

  <section id="main">
    <div class="back_button_container">
        {block name='continue_shopping'}
          <a class="label" href="{$urls.pages.index}">
            <i class="material-icons">chevron_left</i>{l s='Continue shopping' d='Shop.Theme.Actions'}
          </a>
        {/block}
    </div>
    <h1 class="h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
    <div class="cart-grid row">

      <!-- Left Block: cart product informations & shpping -->
      <div class="cart-grid-body col-xs-12 col-lg-8">

        <!-- cart products detailed -->
        <div class="card cart-container">
          <div class="cart_data">
            <div class="cart_table">
              {block name='cart_overview'}
                {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
              {/block}
			  {*
              <div class="cart_input">
                <label>{l s='Vul hier jouw kortingscode in' d='Shop.Theme.Checkout'}</label>
                <input type="text">
              </div>
              <div class="cart_input">
				<label>{l s='Geef hier jouw opmerkingen door' d='Shop.Theme.Checkout'}</label>
				<input type="text">
			  </div>
			  *}
				
            </div>
          </div>
        </div>
        <div class="cart_info">
          <div class="cart_ticks">
            <ul>
              <li>
                <div class="list_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>
                {l s='GRATIS VERZENDING vanaf € 25' d='Shop.Theme.Checkout'}
              </li>
              <li>
                <div class="list_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>
                {l s='10% KORTING bij aankoop van > 5kg' d='Shop.Theme.Checkout'}
              </li>
              <li>
                <div class="list_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>
                {l s='Vragen? Bel ons op 051 31 27 05' d='Shop.Theme.Checkout'}
              </li>
            </ul>
          </div>
          <div class="cart_info">
            <p class="cart_info_title">{l s='Besteloverzicht' d='Shop.Theme.Checkout'}</p>
            <div class="cart_info_box">

              {block name='cart_totals'}
                {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
              {/block}
            </div>
          </div>

          {block name='cart_actions'}
            {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
          {/block}
        </div>




        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>

      <!-- Right Block: cart subtotal & cart total -->
      <div class="cart-grid-right col-xs-12 col-lg-4">

        {block name='cart_summary'}
          <div class="card cart-summary">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}
			
			{*
            {block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            {/block}
			*}

          </div>
        {/block}

        {block name='hook_reassurance'}
          {hook h='displayReassurance'}
        {/block}

      </div>
    </div>
	
	<div class="cart-grid row">
		<div class="col-xs-12">
		</div>
	</div>
  </section>
{/block}
