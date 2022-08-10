{**
 * 2007-2020 PrestaShop and Contributors
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
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}
  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">
		
	{block name='product_navigation'}
		{* Template for the navigation buttons next/prev *}	
		{include file="./product_navigation.tpl"} 
	{/block}
	
      {block name='page_header_container'}
          {block name='page_header'}
              <div class="product_header">
                  <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                  
				  {if isset($product.sub_title) && $product.sub_title }
					<p class="subtitle">{$product.sub_title}</p>
				  {/if}
				  
				  {if $product.id_category_back_btn}
                  <a class="product_page_back" href="{$link->getCategoryLink({$product.id_category_back_btn})}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12.08 18.61">
                          <g id="Laag_2" data-name="Laag 2">
                              <g id="Laag_1-2" data-name="Laag 1">
                                  <g id="_1" data-name=" 1">
                                      <path id="Path_36" data-name="Path 36" d="M0,9.31,9.31,0l2.77,2.77L5.54,9.31l6.54,6.53L9.31,18.61Z"/>
                                  </g>
                              </g>
                          </g>
                      </svg>{l s='Terug naar overzicht' d='Shop.Theme.Catalog'}</a>
				  {/if}
              </div>
          {/block}
      {/block}
    <div class="row product-container">
        <div class="section_top">
            <div class="product_img_container">
{*                <div class="col-md-6">*}
                    {block name='page_content_container'}
                        <section class="page-content" id="content">
                            {block name='page_content'}
                                <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
                                {block name='product_flags'}
                                    <ul class="product-flags">
                                        {foreach from=$product.flags item=flag}
                                            <li class="product-flag {$flag.type}">{$flag.label}</li>
                                        {/foreach}
                                    </ul>
                                {/block}

                                {block name='product_cover_thumbnails'}
                                    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                                {/block}
                                <div class="scroll-box-arrows">
                                    <i class="material-icons left">&#xE314;</i>
                                    <i class="material-icons right">&#xE315;</i>
                                </div>

                            {/block}
                        </section>
                    {/block}
{*                </div>*}
            </div>
            <div class="product_description_container hide_tablet">
                {if $product.description}
                    {block name='product_description'}
                        <div class="product-description">{$product.description nofilter}</div>
                    {/block}
                {/if}
                {block name='recipe_suggestion'}
                    {if $product.id_cms}
                        <a class="recipe_suggestion" href="{$link->getCMSLink($product.id_cms, 'desktop')|escape:'html'}">{l s='RECEPT SUGGESTIE' d='Shop.Theme.Catalog'}</a>
                    {/if}
                {/block}
            </div>
            <div class="product_buy_container product-actions"> {*need to add class product-actions to make work switching of combinations for product page*}
                {block name='product_buy'}
                    <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                        <input type="hidden" name="token" value="{$static_token}">
                        <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                        <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

						{if !empty($groups)}
							{block name='product_variants'}
								{include file='catalog/_partials/product-variants.tpl'}
							{/block}
						{else}
							{include file='catalog/_partials/product-variants-single-product.tpl'}
						{/if}	
						
						{assign var="hide_price" value="true"}
						{foreach from=$groups key=id_attribute_group item=group}
							{if !empty($group.attributes)}
								{if $group.group_type == 'color'}
									{assign var="hide_price" value="false"}
								{/if}
							{/if}
						{/foreach}
						
					    {block name='product_prices'}
							{include file='catalog/_partials/product-prices.tpl' hide_price=$hide_price}
					    {/block}

                        {block name='product_pack'}
                            {if $packItems}
                                <section class="product-pack">
                                    <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                                    {foreach from=$packItems item="product_pack"}
                                        {block name='product_miniature'}
                                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                        {/block}
                                    {/foreach}
                                </section>
                            {/if}
                        {/block}

                        {block name='product_discounts'}
                            {include file='catalog/_partials/product-discounts.tpl'}
                        {/block}

                        {block name='product_add_to_cart'}
                            {include file='catalog/_partials/product-add-to-cart.tpl'}
                        {/block}

{*                        {block name='product_additional_info'}*}
{*                            {include file='catalog/_partials/product-additional-info.tpl'}*}
{*                        {/block}*}

                        {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                        {block name='product_refresh'}{/block}
                    </form>
                {/block}

                {if $product.is_customizable && count($product.customizations.fields)}
                    {block name='product_customization'}
                        {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                    {/block}
                {/if}
                <div class="product_info">
                    {block name='product_ingredients'}
                        <div class="ingredients_list">
                            {if $product.ingredients}
                                <h3>{l s='Ingrediënten' d='Shop.Theme.Catalog'}</h3>
                                <div class="ticks_list">
                                    {$product.ingredients nofilter}
                                </div>
                            {/if}
                        </div>
                    {/block}
                    {block name='product_nutritional'}
                        <div class="nutritional_list_container">
                            {if $product.nutritional}
                                <h3>{l s='Voedingswaarden 100g' d='Shop.Theme.Catalog'}</h3>
                                <div class="nutritional_list">
                                    {$product.nutritional nofilter}
                                </div>
                            {/if}
                        </div>
                    {/block}
                </div>

                <div class="product_description_container show_tablet">
                    {if $product.description}
                        {block name='product_description'}
                            <div class="product-description">{$product.description nofilter}</div>
                        {/block}
                    {/if}
                    {block name='recipe_suggestion'}
                        {if $product.id_cms}
                            <a class="recipe_suggestion" href="{$link->getCMSLink($product.id_cms, 'desktop')|escape:'html'}">{l s='RECEPT SUGGESTIE' d='Shop.Theme.Catalog'}</a>
                        {/if}
                    {/block}
                </div>
            </div>
        </div>
        <div class="section_bottom">
            <div class="product_reviews_container">
                <div class="container testimonial-bottom">
                    <h3 class="title">{l s='KLANTENBEOORDELINGEN' d='Shop.Theme.Catalog'}</h3>
                    <div id="testimonial-contents">
                        {hook h='displayFooterProduct' product=$product category=$category mod="productcomments"}
                    </div>
                </div>
            </div>
            {block name='product_accessories'}
                {if $accessories}
                    <div class="product_recepts_container">
                        <div class="section_title text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</div>
                        <div class="elements">
                            {foreach from=$accessories item="product_accessory"}
                                {block name='product_miniature'}
                                    {include file='catalog/_partials/miniatures/product-related.tpl' product=$product_accessory}
                                {/block}
                            {/foreach}
        {*                    <div class="elements_item">*}
        {*                        <div class="item_img"><img src="https://dev.xavies.be/modules/custombanners/views/img/uploads/308987b6f9273d2a29bd51cbd223172811ae893f.jpg" alt=""></div>*}
        {*                        <div class="item_title">Pure Toasted Nuts Seeds</div>*}
        {*                        <div class="item_price">Vanaf €8,60</div>*}
        {*                    </div>*}
                        </div>
                    </div>
                {/if}
            {/block}
        </div>
        {*
        <div class="col-md-6">
          <div class="product-information">
            <div class="product-actions"></div>
            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
            {block name='product_tabs'}
              <div class="tabs">
                  <ul class="nav nav-tabs" role="tablist">
                      {if $product.description}
                        <li class="nav-item">
                           <a
                             class="nav-link{if $product.description} active{/if}"
                             data-toggle="tab"
                             href="#description"
                             role="tab"
                             aria-controls="description"
                             {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
                        </li>
                      {/if}
                      <li class="nav-item">
                        <a
                          class="nav-link{if !$product.description} active{/if}"
                          data-toggle="tab"
                          href="#product-details"
                          role="tab"
                          aria-controls="product-details"
                          {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
                      </li>
                      {if $product.attachments}
                        <li class="nav-item">
                          <a
                            class="nav-link"
                            data-toggle="tab"
                            href="#attachments"
                            role="tab"
                            aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
                        </li>
                      {/if}
                      {foreach from=$product.extraContent item=extra key=extraKey}
                        <li class="nav-item">
                          <a
                            class="nav-link"
                            data-toggle="tab"
                            href="#extra-{$extraKey}"
                            role="tab"
                            aria-controls="extra-{$extraKey}">{$extra.title}</a>
                        </li>
                      {/foreach}
                  </ul>
                  <div class="tab-content" id="tab-content">
                      <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
                          {block name='product_description'}
                              <div class="product-description">{$product.description nofilter}</div>
                          {/block}
                      </div>
                      {block name='product_details'}
                          {include file='catalog/_partials/product-details.tpl'}
                      {/block}
                      {block name='product_attachments'}
                          {if $product.attachments}
                              <div class="tab-pane fade in" id="attachments" role="tabpanel">
                                  <section class="product-attachments">
                                      <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                                      {foreach from=$product.attachments item=attachment}
                                          <div class="attachment">
                                              <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                                              <p>{$attachment.description}</p>
                                              <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                                  {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                              </a>
                                          </div>
                                      {/foreach}
                                  </section>
                              </div>
                          {/if}
                      {/block}
                      {foreach from=$product.extraContent item=extra key=extraKey}
                          <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                            {$extra.content nofilter}
                          </div>
                      {/foreach}
                  </div>
            {/block}
          </div>
        </div>
        *}
    </div>

{*      <div class="b_product_footer">*}
{*        {block name='product_footer'}*}
{*          {hook h='displayFooterProduct' product=$product category=$category}*}
{*        {/block}*}
{*      </div>*}
    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
