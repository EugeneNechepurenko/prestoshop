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
<div class="col-md-6 links">
  <div class="row">
  {foreach $linkBlocks as $linkBlock}
    <div class="col-md-6 wrapper">
      <p class="h3 {*hidden-sm-down*}">{$linkBlock.title}</p>
      {assign var=_expand_id value=10|mt_rand:100000}
	  {*
      <div class="title clearfix hidden-xs-up" data-target="#footer_sub_menu_{$_expand_id}" data-toggle="collapse">
        <span class="h3">{$linkBlock.title}</span>
        <span class="float-xs-right">
          <span class="navbar-toggler collapse-icons">
            <i class="material-icons add">&#xE313;</i>
            <i class="material-icons remove">&#xE316;</i>
          </span>
        </span>
      </div>
	  *}
      <ul id="footer_sub_menu_{$_expand_id}" class="collapse">
        {foreach $linkBlock.links as $link}
          <li{if $link.title == 'Facebook' || $link.title == 'Instagram'} class="mobile_show_icons"{/if}>
            <a
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                title="{$link.description}"
                {if !empty($link.target)} target="{$link.target}" {/if}
            >
              {if $link.title == 'Facebook'}
                <span>{$link.title}</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8.72 16.71">
                <defs>
                  <style>
                    .cls-facebook {
                      fill: #fff;
                      fill-rule: evenodd;
                    }
                  </style>
                </defs>
                <g id="Laag_2" data-name="Laag 2">
                  <g id="Laag_1-2" data-name="Laag 1">
                    <g id="Facebook">
                      <path id="Path_1" data-name="Path 1" class="cls-facebook" d="M5.66,16.71V9.1h2.6l.37-3h-3V4.28c0-.84.28-1.49,1.49-1.49H8.72V.1C8.35.1,7.42,0,6.4,0A3.59,3.59,0,0,0,2.59,3.35a3.49,3.49,0,0,0,0,.56V6.13H0v3H2.6v7.61Z"/>
                    </g>
                  </g>
                </g>
              </svg>
              {else if $link.title == 'Instagram'}
                <span>{$link.title}</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16.74 16.74">
                <defs>
                  <style>
                    .cls-link_instagram {
                      fill: #fff;
                      fill-rule: evenodd;
                    }
                  </style>
                </defs>
                <g id="Laag_2" data-name="Laag 2">
                  <g id="Laag_1-2" data-name="Laag 1">
                    <path id="Path_3" data-name="Path 3" class="cls-link_instagram" d="M8.37,1.5a24.85,24.85,0,0,1,3.34.1,4.27,4.27,0,0,1,1.58.27,3.3,3.3,0,0,1,1.57,1.58A4.25,4.25,0,0,1,15.14,5c0,.83.09,1.11.09,3.34a24.85,24.85,0,0,1-.09,3.34,4.2,4.2,0,0,1-.28,1.57,3.22,3.22,0,0,1-1.57,1.58,4.28,4.28,0,0,1-1.58.28c-.84,0-1.11.09-3.34.09A26.57,26.57,0,0,1,5,15.14a4.25,4.25,0,0,1-1.58-.28,3.28,3.28,0,0,1-1.58-1.58,4.19,4.19,0,0,1-.27-1.57c0-.84-.1-1.12-.1-3.34A24.8,24.8,0,0,1,1.6,5a4.24,4.24,0,0,1,.27-1.58,3.79,3.79,0,0,1,.65-.93,1.63,1.63,0,0,1,.93-.65A4.46,4.46,0,0,1,5,1.59,26.57,26.57,0,0,1,8.37,1.5M8.37,0A28,28,0,0,0,4.94.11,5.76,5.76,0,0,0,2.89.48a3.55,3.55,0,0,0-1.48.93A3.55,3.55,0,0,0,.48,2.89,4.23,4.23,0,0,0,.11,4.94,28,28,0,0,0,0,8.37,28.07,28.07,0,0,0,.11,11.8a5.67,5.67,0,0,0,.37,2,3.52,3.52,0,0,0,.93,1.49,3.76,3.76,0,0,0,1.48.93,6,6,0,0,0,2.05.37,28,28,0,0,0,3.43.09,28.07,28.07,0,0,0,3.43-.09,5.89,5.89,0,0,0,2-.37,3.89,3.89,0,0,0,2.41-2.42,5.68,5.68,0,0,0,.38-2c0-.93.09-1.2.09-3.43a28,28,0,0,0-.09-3.43,5.68,5.68,0,0,0-.38-2,3.6,3.6,0,0,0-.92-1.49A3.69,3.69,0,0,0,13.84.48a5.67,5.67,0,0,0-2-.37A28.07,28.07,0,0,0,8.37,0m0,4.08A4.2,4.2,0,0,0,4.1,8.23v.14A4.27,4.27,0,1,0,8.37,4.1h0m0,7.05A2.74,2.74,0,0,1,5.58,8.47v-.1A2.75,2.75,0,0,1,8.27,5.58h.1a2.74,2.74,0,0,1,2.78,2.69v.1a2.73,2.73,0,0,1-2.68,2.78h-.1m4.45-8.26a1,1,0,1,0,1,1,1,1,0,0,0-1-1"/>
                  </g>
                </g>
              </svg>
              {else}
                {$link.title}
              {/if}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
  </div>
</div>
