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
    <div class="elements_item" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        {block name='product_thumbnail'}
            <div class="item_img">
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
            </div>
        {/block}
        {block name='product_name'}
            <div class="item_title"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div>
        {/block}
        <div class="item_price">{l s='Vanaf' d='Shop.Theme.Catalog'} {$product.price}</div>
    </div>
{/block}
