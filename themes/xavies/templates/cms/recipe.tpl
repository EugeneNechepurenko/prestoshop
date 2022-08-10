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
{extends file='page.tpl'}

{block name='page_title'}
  {$cms.meta_title}
{/block}

{block name='additional_body_class'}recipes_detail_page{/block}
{block name='page_back_btn'}
{*    <a class="page_back_btn" href="{$link->getCMSCategoryLink(2)}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12.08 18.61">*}
    <a class="page_back_btn back_recipe" href="{$link->getCMSCategoryLink(2)}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12.08 18.61">
    <g id="Laag_2" data-name="Laag 2">
        <g id="Laag_1-2" data-name="Laag 1">
            <g id="_1" data-name=" 1">
                <path id="Path_36" data-name="Path 36" d="M0,9.31,9.31,0l2.77,2.77L5.54,9.31l6.54,6.53L9.31,18.61Z"/>
            </g>
        </g>
    </g>
</svg>{l s='Terug naar overzicht' d='Shop.Theme.Catalog'}</a>
{/block}


{block name='page_content_container'}
  <section id="content" class="page-content page-cms page-cms-{$cms.id}">

		  {block name='recipe_navigation'}
			  {* Template for the navigation buttons next/prev *}	
			  {include file="./recipe_navigation.tpl"} 
		  {/block}  
			
          {block name='cms_content'}
              {$cms.content nofilter}
          {/block}
          {block name='hook_cms_dispute_information'}
              {hook h='displayCMSDisputeInformation'}
          {/block}
          {block name='hook_cms_print_button'}
              {hook h='displayCMSPrintButton'}
          {/block}
		  
		  {*
		  
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
			
			<a href="{$product.url}" class="btn_grid_white" data-product_id="{$cms.product.id_product}">{$cms.product.name}</a>
            {block name='quick_view'}
				<a class="home_quick_view_product quick-view" href="#" data-link-action="quickview">{l s='To the shopping cart' d='Shop.Theme.Catalog'}</a>
            {/block}
		  *}
			
		 {* not implemented yet, for later
          <div class="recept_product_container">
              <div class="description">
					<p>{l s='VOEG %s TOE AAN JOUW' sprintf=[$cms.product.name] d='Custom'}&nbsp;<strong>{l s='WINKELMANDJE' d='Custom'}</strong></p>
              </div>
              <div class="image_buy">
                  <button>{l s='To the shopping cart' d='Shop.Theme.Catalog'}</button>
              </div>
          </div>
		  *}
		  {*for now will be link to the product*}
      {if $cms.product.id_product}
		  <div class="recept_product_container">
              <div class="image_buy">
                  <a class="btn" href="{$link->getProductLink($cms.product.id_product)}">{$cms.product.name}</a>
              </div>
          </div>
      {/if}
		  
          <div class="social_share_container">
          <p>{l s='DEEL DIT RECEPT' d='Custom'}</p>
          <ul class="soc-buttons clearfix rrssb-1">
			{assign var="article_link" value="{$link->getCMSLink($cms.id)|escape:'url'}"}
			{assign var="article_title" value="{$cms.meta_title|escape:'url'}"}
            <li class="soc-facebook" data-initwidth="25" data-size="68" style="width: calc(100% - 126px);">
              <a href="https://www.facebook.com/sharer/sharer.php?u={$article_link}" class="popup">
                <span class="soc-icon">
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="28px" height="28px" viewBox="0 0 28 28" enable-background="new 0 0 28 28" xml:space="preserve">
                        <path d="M27.825,4.783c0-2.427-2.182-4.608-4.608-4.608H4.783c-2.422,0-4.608,2.182-4.608,4.608v18.434
                        c0,2.427,2.181,4.608,4.608,4.608H14V17.379h-3.379v-4.608H14v-1.795c0-3.089,2.335-5.885,5.192-5.885h3.718v4.608h-3.726
                        c-0.408,0-0.884,0.492-0.884,1.236v1.836h4.609v4.608h-4.609v10.446h4.916c2.422,0,4.608-2.188,4.608-4.608V4.783z"></path>
                    </svg>
                </span>
                <span class="soc-text" style="">{l s='Facebook' d='Custom'}</span>
              </a>
            </li>
            <li class="soc-twitter small" data-initwidth="25" data-size="53" style="width: 42px;">
              <a href="http://twitter.com/home?status={$article_title}%20{$article_link}" class="popup">
                <span class="soc-icon">
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="28px" height="28px" viewBox="0 0 28 28" enable-background="new 0 0 28 28" xml:space="preserve">
                    <path d="M24.253,8.756C24.689,17.08,18.297,24.182,9.97,24.62c-3.122,0.162-6.219-0.646-8.861-2.32
                    c2.703,0.179,5.376-0.648,7.508-2.321c-2.072-0.247-3.818-1.661-4.489-3.638c0.801,0.128,1.62,0.076,2.399-0.155
                    C4.045,15.72,2.215,13.6,2.115,11.077c0.688,0.275,1.426,0.407,2.168,0.386c-2.135-1.65-2.729-4.621-1.394-6.965
                    C5.575,7.816,9.54,9.84,13.803,10.071c-0.842-2.739,0.694-5.64,3.434-6.482c2.018-0.623,4.212,0.044,5.546,1.683
                    c1.186-0.213,2.318-0.662,3.329-1.317c-0.385,1.256-1.247,2.312-2.399,2.942c1.048-0.106,2.069-0.394,3.019-0.851
                    C26.275,7.229,25.39,8.196,24.253,8.756z"></path>
                </svg>
            </span>
                <span class="soc-text" style="">{l s='Twitter' d='Custom'}</span>
              </a>
            </li>
            <li class="soc-linkedin small" data-initwidth="25" data-size="57" style="width: 42px;">
              <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url={$article_link}&amp;title={$article_title}&amp;summary={$article_title}" class="popup">
                <span class="soc-icon">
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="28px" height="28px" viewBox="0 0 28 28" enable-background="new 0 0 28 28" xml:space="preserve">
                        <path d="M25.424,15.887v8.447h-4.896v-7.882c0-1.979-0.709-3.331-2.48-3.331c-1.354,0-2.158,0.911-2.514,1.803
                        c-0.129,0.315-0.162,0.753-0.162,1.194v8.216h-4.899c0,0,0.066-13.349,0-14.731h4.899v2.088c-0.01,0.016-0.023,0.032-0.033,0.048
                        h0.033V11.69c0.65-1.002,1.812-2.435,4.414-2.435C23.008,9.254,25.424,11.361,25.424,15.887z M5.348,2.501
                        c-1.676,0-2.772,1.092-2.772,2.539c0,1.421,1.066,2.538,2.717,2.546h0.032c1.709,0,2.771-1.132,2.771-2.546
                        C8.054,3.593,7.019,2.501,5.343,2.501H5.348z M2.867,24.334h4.897V9.603H2.867V24.334z"></path>
                    </svg>
                </span>
                <span class="soc-text" style="">{l s='Linkedin' d='Custom'}</span>
              </a>
            </li>
            <li class="soc-email small" data-initwidth="25" data-size="29" style="width: 42px;">
              <a href="mailto:?subject={$article_title}&amp;body={$article_link}" target="_blank">
                <span class="soc-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="28px" height="28px" viewBox="0 0 28 28" enable-background="new 0 0 28 28" xml:space="preserve"><g><path d="M20.111 26.147c-2.336 1.051-4.361 1.401-7.125 1.401c-6.462 0-12.146-4.633-12.146-12.265 c0-7.94 5.762-14.833 14.561-14.833c6.853 0 11.8 4.7 11.8 11.252c0 5.684-3.194 9.265-7.399 9.3 c-1.829 0-3.153-0.934-3.347-2.997h-0.077c-1.208 1.986-2.96 2.997-5.023 2.997c-2.532 0-4.361-1.868-4.361-5.062 c0-4.749 3.504-9.071 9.111-9.071c1.713 0 3.7 0.4 4.6 0.973l-1.169 7.203c-0.388 2.298-0.116 3.3 1 3.4 c1.673 0 3.773-2.102 3.773-6.58c0-5.061-3.27-8.994-9.303-8.994c-5.957 0-11.175 4.673-11.175 12.1 c0 6.5 4.2 10.2 10 10.201c1.986 0 4.089-0.43 5.646-1.245L20.111 26.147z M16.646 10.1 c-0.311-0.078-0.701-0.155-1.207-0.155c-2.571 0-4.595 2.53-4.595 5.529c0 1.5 0.7 2.4 1.9 2.4 c1.441 0 2.959-1.828 3.311-4.087L16.646 10.068z"></path></g></svg>
                </span>
                <span class="soc-text" style="">{l s='e-mail' d='Custom'}</span>
              </a>
            </li>
          </ul>
        </div>
		
	 {if isset($cms.related_cms) && $cms.related_cms}	
      <div class="recept_section_bottom">
          <div class="product_recepts_container">
              <div class="section_title text-uppercase">{l s='GELIJKAARDIGE RECEPTEN' d='Shop.Theme.Catalog'}</div>
              <div class="elements">
					{foreach from=$cms.related_cms item="cms_item" name=recepts}
					  {if $smarty.foreach.recepts.index >= 2}
						{break}
					  {/if}
						<div class="elements_item">
							<div class="item_img">
								{assign var="image_url" value="{_PS_IMG_DIR_}/cms/{$cms_item.top_image}"}
								{if isset($cms_item.top_image) && !empty($cms_item.top_image) && file_exists($image_url)}
									<img src="{$link->getMediaLink("/img/cms/{$cms_item.top_image}")}"
											 alt="{$cms_item.meta_title|escape:'html':'UTF-8'}" title="{$cms_item.meta_title|escape:'html':'UTF-8'}" class="imgm" width="398px"/>
								{else}
									<img src="{$urls.img_url}no-image.jpg"
											 alt="{$cms_item.meta_title|escape:'html':'UTF-8'}" title="{$cms_item.meta_title|escape:'html':'UTF-8'}" class="imgm"/>
								{/if}
							</div>
							<div class="item_title">
								<a href="{$link->getCMSLink($cms_item.id_cms)|escape:'html'}">{$cms_item.meta_title|escape:'html':'UTF-8'}</a>
							</div>
							<div class="item_price">Met {$cms.product.name|escape:'html':'UTF-8'}</div>
                        </div>
					{/foreach}
			  
{*                  {foreach from=$accessories item="product_accessory"}*}
{*                      {block name='product_miniature'}*}
{*                          {include file='catalog/_partials/miniatures/product-related.tpl' product=$product_accessory}*}
{*                      {/block}*}
{*                  {/foreach}*}
{*                                      <div class="elements_item">*}
{*                                          <div class="item_img"><img src="https://dev.xavies.be/modules/custombanners/views/img/uploads/308987b6f9273d2a29bd51cbd223172811ae893f.jpg" alt=""></div>*}
{*                                          <div class="item_title">Receptnaam</div>*}
{*                                          <div class="item_price">Met XAVIES’ Granola</div>*}
{*                                      </div>*}
{*                                      <div class="elements_item">*}
{*                                          <div class="item_img"><img src="https://dev.xavies.be/modules/custombanners/views/img/uploads/308987b6f9273d2a29bd51cbd223172811ae893f.jpg" alt=""></div>*}
{*                                          <div class="item_title">Receptnaam</div>*}
{*                                          <div class="item_price">Met XAVIES’ Granola</div>*}
{*                                      </div>*}									  
              </div>
          </div>
      </div>
	  {/if}
  </section>
{/block}
