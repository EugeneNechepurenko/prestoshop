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
<div id="_desktop_user_info">
  <div class="user-info">
    {if $logged}
{*      <a*}
{*        class="logout hidden-sm-down"*}
{*        href="{$logout_url}"*}
{*        rel="nofollow"*}
{*      >*}
{*        <i class="material-icons">&#xE7FF;</i>*}
{*        {l s='Sign out' d='Shop.Theme.Actions'}*}
{*      </a>*}
      <a
        class="account"
        href="{$my_account_url}"
        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <span class="hidden-sm-down">{$customerName}</span>
{*          <span class="hidden-sm-down">{l s='ACCOUNT' d='Shop.Theme.Actions'}</span>*}
{*          <i class="material-icons hidden-md-up logged">&#xE7FF;</i>*}
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
              <defs>
                  <style>
                      .cls-account {
                          fill: #fff;
                      }
                  </style>
              </defs>
              <g id="Laag_2" data-name="Laag 2">
                  <g id="Laag_1-2" data-name="Laag 1">
                      <path id="Union_1" data-name="Union 1" class="cls-account" d="M0,16V14c0-2.2,3.6-4,8-4s8,1.8,8,4v2ZM4,4A4,4,0,1,1,8,8,4,4,0,0,1,4,4Z"/>
                  </g>
              </g>
          </svg>

      </a>
    {else}
      <a
        href="{$my_account_url}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <span class="hidden-sm-down">{l s='ACCOUNT' d='Shop.Theme.Actions'}</span>
          <i class="material-icons">&#xE7FF;</i>
      </a>
    {/if}
  </div>
</div>
