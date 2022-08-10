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
<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}">
      {/if}
        <span class="hidden-sm-down">{l s='WINKELMANDJE' d='Shop.Theme.Checkout'}</span>
        <span class="cart-products-count">({$cart.products_count})</span>
            <svg version="1.1" id="Laag_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="0 0 406 359" style="enable-background:new 0 0 406 359;" xml:space="preserve">
                <g>
                    <path class="st0" style="fill:#FFFFFF;" d="M6,16.9c2.7-6.5,7.6-8.8,14.5-8.6C33,8.6,45.5,8.4,57.9,8.4c15.2,0.1,24.8,7.5,28.8,22.2
		c3.9,14.5,7.9,29.1,11.7,43.7c0.7,2.6,1.7,3.5,4.5,3.6c54.9,0.1,109.8,0.4,164.7,0.6c32.7,0.1,65.4,0.3,98,0.5
		c16,0.1,26.4,12.7,22.9,28.2c-8.9,39.4-18,78.7-27.2,118c-3.1,13-13.8,21.1-27.3,21.4c-4.7,0.1-9.5,0-14.2,0
		c-66.4,0-132.7-0.1-199.1-0.1c-1.7,0-3.5,0-5.2,0.2c-6.5,0.7-11.1,5.9-11.1,12.5c0,6.6,4.6,11.7,11.2,12.3c1.7,0.2,3.5,0.1,5.2,0.1
		c73.1,0,146.2,0,219.3,0c8.9,0,14.2,5.1,13.3,12.8c-0.4,3.8-2.3,6.2-7,9.2c7.4,20.2,3.8,37.6-14.5,50.3
		c-13.2,9.2-31.3,8.4-44.2-1.1c-14.8-10.9-19-26-13-48.4c-23.3,0-46.5,0-69.9,0c7,19.9,3.2,37.2-14.6,49.3
		c-13.9,9.5-29.1,9.4-42.9,0c-17.7-12.1-21.4-29.2-14.5-49.6c-5.4,0-10.4,0.1-15.5,0c-18.2-0.3-32.3-12.4-35.1-30
		c-3-19.1,11.1-37.6,30.3-39.7c0.9-0.1,1.7-0.2,2.8-0.4c-0.3-1.5-0.5-2.8-0.9-4.1C98,158.7,81.5,97.6,65,36.5
		c-1.3-4.9-2.2-5.6-7.2-5.6c-12.5,0-25-0.2-37.4,0.1C13.5,31.1,8.5,28.8,6,22.1C6,20.4,6,18.6,6,16.9z M105.5,100.5
		c4.5,16.6,8.8,32.6,13.1,48.7c0.6,2.1,1.8,2.2,3.6,2.2c12.5,0,24.9,0,37.4,0c1,0,1.9-0.2,2.8-0.3c0.2-0.5,0.3-0.7,0.3-1
		c-2-15.9-4.1-31.8-6.3-47.8c-0.1-0.7-1.6-1.7-2.5-1.8c-4.4-0.2-8.7-0.2-13.1-0.2C129.1,100.5,117.6,100.5,105.5,100.5z
		 M251.1,101.1c0,16.9,0,33.4,0,49.9c0.6,0.2,0.9,0.4,1.3,0.4c13,0,25.9,0,38.9,0.1c2.5,0,2.7-1.4,3-3.3c1.4-10.9,2.9-21.7,4.3-32.6
		c0.6-4.7,1.2-9.5,1.8-14.5C283.6,101.1,267.4,101.1,251.1,101.1z M178.8,100.8c2.3,17.1,4.5,33.8,6.7,50.3c14.6,0,28.6,0,42.6,0
		c0-16.9,0-33.5,0-50.3C211.7,100.8,195.5,100.8,178.8,100.8z M366.9,101.2c-14.3,0-28.1,0-42,0.1c-0.8,0-2,1.6-2.2,2.6
		c-2.1,14.7-4,29.4-5.9,44.1c-0.1,1,0,2.1,0,3.2c13,0,25.7,0,38.5,0C359.1,134.7,362.9,118.3,366.9,101.2z M125.8,173.9
		c0,0.9-0.1,1.4,0,1.8c3.9,14.5,7.8,29,11.8,43.6c1,3.6,3.6,4.8,7.1,4.8c5.5,0,11,0,16.4,0c3.7,0,7.4,0,11,0
		c0.1-0.9,0.2-1.3,0.2-1.7c-2-15.5-4-31.1-6.2-46.6c-0.1-0.8-1.8-1.8-2.8-1.8c-5-0.2-10-0.1-14.9-0.1
		C140.8,173.9,133.4,173.9,125.8,173.9z M251.1,224.1c10.6,0,21.1,0,31.5-0.1c0.6,0,1.7-1.6,1.8-2.5c1.6-11,3-21.9,4.5-32.9
		c0.6-4.7,1.2-9.5,1.7-14.3c-13.5,0-26.5,0-39.5,0C251.1,190.9,251.1,207.3,251.1,224.1z M188.6,174.1c2.2,16.8,4.4,33.2,6.6,49.8
		c11.2,0,22,0,33,0c0-16.7,0-33.2,0-49.8C214.9,174.1,201.9,174.1,188.6,174.1z M350,173.9c-12,0-23.6,0-35.1,0.1
		c-0.6,0-1.7,1.6-1.8,2.6c-1.6,11.8-3.2,23.7-4.7,35.5c-0.5,3.9-1,7.7-1.5,11.9c9.4,0,18.2,0.1,27.1,0c3.3,0,5.1-2.1,5.8-5.3
		c1.5-6.7,3.1-13.3,4.6-20C346.2,190.6,348.1,182.5,350,173.9z M168.8,327.7c9.3-0.1,16.9-7.7,16.7-17c-0.1-9.1-7.7-16.6-16.8-16.7
		c-9.2,0-16.8,7.6-16.8,16.9C151.9,320.4,159.4,327.8,168.8,327.7z M310.7,327.7c9.4,0,16.9-7.6,16.8-16.9
		c-0.1-9.1-7.5-16.6-16.7-16.7c-9.2-0.1-16.9,7.5-16.9,16.8C293.8,320.3,301.3,327.7,310.7,327.7z"/>
                </g>
</svg>
      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>
  </div>
</div>
