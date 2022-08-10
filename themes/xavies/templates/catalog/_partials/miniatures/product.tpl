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
{block name='product_miniature_item'}
{*{if $page.page_name == 'category'}*}
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">

            {assign var="has_discount" value=false}
            {foreach from=$product.flags item=flag}
                {if $flag.type === 'discount'}
                    {assign var="has_discount" value=$flag.label}
                {/if}
            {/foreach}
            {if $has_discount !== false}<div class="gift_label discount">{l s='actie' d='Shop.Theme.Catalog'}</div>{/if}
            {if $product.has_gift === 1}<div class="gift_label">{l s='GIFT' d='Shop.Theme.Catalog'}</div>{/if}
            <div class="top_price {if $has_discount !== false}has_discount{/if}">
                <span>{if $has_discount === false}{l s='v.a.' d='Shop.Theme.Catalog'}{else}{$has_discount}{/if}</span>
                <span itemprop="price" class="top_price_amount">{$product.price}</span>
            </div>
            {block name='product_thumbnail'}
                {if $product.cover}
                    <a href="{$product.url}" class="thumbnail product-thumbnail">
                        <img
                                src="{$product.cover.bySize.home_default.url}"
                                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                data-full-size-image-url="{$product.cover.large.url}"
                        />
                    </a>
                {else}
                    <a href="{$product.url}" class="thumbnail product-thumbnail">
                        <img src="{$urls.no_picture_image.bySize.home_default.url}" />
                    </a>
                {/if}
            {/block}

            <div class="product-description" style="display: none;">
                {block name='product_name'}
                    {if $page.page_name == 'index'}
                        <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h3>
                    {else}
                        <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h2>
                    {/if}
                {/block}

                {block name='product_price_and_shipping'}
                    {if $product.show_price}
                        <div class="product-price-and-shipping">
                            {if $product.has_discount}
                                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                                <span class="regular-price">{$product.regular_price}</span>
                                {if $product.discount_type === 'percentage'}
                                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                                {elseif $product.discount_type === 'amount'}
                                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                                {/if}
                            {/if}

                            {hook h='displayProductPriceBlock' product=$product type="before_price"}

                            <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                            <span itemprop="price" class="price">{$product.price}</span>

                            {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                            {hook h='displayProductPriceBlock' product=$product type='weight'}
                        </div>
                    {/if}
                {/block}

                {block name='product_reviews'}
                    {hook h='displayProductListReviews' product=$product}
                {/block}
            </div>

            <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
            {block name='product_flags'}
                <ul class="product-flags" style="display: none;">
                    {foreach from=$product.flags item=flag}
                        {if $flag.type !== 'discount'}
                            <li class="product-flag {$flag.type}">{$flag.label}</li>
                        {/if}
                    {/foreach}
                </ul>
            {/block}

            <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down" style="display: none;">
                {block name='quick_view'}
                    <a class="quick-view" href="#" data-link-action="quickview">
                        <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Catalog'}
                    </a>
                {/block}

                {block name='product_variants'}
                    {if $product.main_variants}
                        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                    {/if}
                {/block}
            </div>
            <a class="product_title" ><h2>{$product.name|truncate:30:'...'}</h2></a>
{*            <a class="product_title" href="{$product.url}"><h2>{$product.name|truncate:30:'...'}</h2></a>*}
{*			<a href="{$product.url}" class="btn_grid_white" data-product_id="{$product.id_product}">{l s='BIKIJK PRODUCT' d='Shop.Theme.Catalog'}</a>*}
              {block name='quick_view'}
				<a class="home_quick_view_product quick-view" href="#" data-link-action="quickview">{l s='To the shopping cart' d='Shop.Theme.Catalog'}</a>
              {/block}

            <div class="product_tips_list">
                {$product.description_short nofilter}
{*                <ul>*}
{*                    <li><div class="tips_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>GEEN TOEGEVOEGDE SUIKERS</li>*}
{*                    <li><div class="tips_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>HEERLIJK KROKANT</li>*}
{*                    <li><div class="tips_tick"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" version="1.1"><g id="surface1"><path style=" " d="M 28.28125 6.28125 L 11 23.5625 L 3.71875 16.28125 L 2.28125 17.71875 L 10.28125 25.71875 L 11 26.40625 L 11.71875 25.71875 L 29.71875 7.71875 Z "></path></g></svg></div>OVENGEROOSTERD</li>*}
{*                </ul>*}
            </div>
        </div>
    </article>
{*{else}*}
{*    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">*}
{*        <div class="thumbnail-container">*}

{*			<div class="top_price">*}
{*				<span>v.a.</span><span class="top_price_amount">€ 7,10</span>*}
{*			</div>*}

{*			{block name='product_thumbnail'}*}
{*				{if $product.cover}*}
{*                  <a href="{$product.url}" class="thumbnail product-thumbnail">*}
{*                    <img*}
{*                      src="{$product.cover.bySize.home_default.url}"*}
{*                      alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"*}
{*                      data-full-size-image-url="{$product.cover.large.url}"*}
{*                    />*}
{*                  </a>*}
{*                {else}*}
{*                  <a href="{$product.url}" class="thumbnail product-thumbnail">*}
{*                    <img src="{$urls.no_picture_image.bySize.home_default.url}" />*}
{*                  </a>*}
{*                {/if}*}
{*			{/block}*}

{*			<div class="product-description">*}
{*                {block name='product_name'}*}
{*                  {if $page.page_name == 'index'}*}
{*                    <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h3>*}
{*                  {else}*}
{*                    <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h2>*}
{*                  {/if}*}
{*                {/block}*}

{*                {block name='product_price_and_shipping'}*}
{*                  {if $product.show_price}*}
{*                    <div class="product-price-and-shipping">*}
{*                      {if $product.has_discount}*}
{*                        {hook h='displayProductPriceBlock' product=$product type="old_price"}*}

{*                        <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>*}
{*                        <span class="regular-price">{$product.regular_price}</span>*}
{*                        {if $product.discount_type === 'percentage'}*}
{*                          <span class="discount-percentage discount-product">{$product.discount_percentage}</span>*}
{*                        {elseif $product.discount_type === 'amount'}*}
{*                          <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>*}
{*                        {/if}*}
{*                      {/if}*}

{*                      {hook h='displayProductPriceBlock' product=$product type="before_price"}*}

{*                      <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>*}
{*                      <span itemprop="price" class="price">{$product.price}</span>*}

{*                      {hook h='displayProductPriceBlock' product=$product type='unit_price'}*}

{*                      {hook h='displayProductPriceBlock' product=$product type='weight'}*}
{*                    </div>*}
{*                  {/if}*}
{*                {/block}*}

{*                {block name='product_reviews'}*}
{*                  {hook h='displayProductListReviews' product=$product}*}
{*                {/block}*}
{*              </div>*}

{*			<!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->*}
{*			{block name='product_flags'}*}
{*				<ul class="product-flags">*}
{*                  {foreach from=$product.flags item=flag}*}
{*                    <li class="product-flag {$flag.type}">{$flag.label}</li>*}
{*                  {/foreach}*}
{*                </ul>*}
{*			{/block}*}

{*              <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">*}
{*            {block name='quick_view'}*}
{*              <a class="quick-view" href="#" data-link-action="quickview">*}
{*                <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}*}
{*              </a>*}
{*            {/block}*}

{*            {block name='product_variants'}*}
{*              {if $product.main_variants}*}
{*                {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}*}
{*              {/if}*}
{*            {/block}*}
{*          </div>*}
{*            <a class="home_buy_product" data-product_id="{$product.id_product}">BESTELLEN</a>*}
{*        </div>*}
{*    </article>*}
{*{/if}*}
{/block}
