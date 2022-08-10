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
      {if !$smarty.get.create_account}
          {l s='Log in to your account' d='Shop.Theme.Customeraccount'}
      {else}
          {l s='Create an account' d='Shop.Theme.Customeraccount'}
      {/if}
  {/block}

{block name='page_content'}
  {if !$smarty.get.create_account}
      {block name='login_form_container'}
          <section class="login-form">
            {render file='customer/_partials/login-form.tpl' ui=$login_form}
          </section>
          <hr/>
          {block name='display_after_login_form'}
            {hook h='displayCustomerLoginFormAfter'}
          {/block}
      {/block}
  {else}
      {block name='register_form_container'}
          <div class="registration_form_container">
{*              <p class="h1">{l s='Create an account' d='Shop.Theme.Customeraccount'}</p>*}
              {$hook_create_account_top nofilter}
              <section class="register-form">
                  <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'} <a href="{$urls.pages.authentication}">{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</a></p>
                  {render file='customer/_partials/customer-form.tpl' ui=$register_form}
              </section>
          </div>
      {/block}
  {/if}



{*  <div class="auth_privacy">*}
{*    <p class="h2">{l s='JOUW PRIVACY IS BELANGRIJK VOOR ONS' d='Custom'}</p>*}
{*    <p>{l s='Wij gebruiken deze gegevens enkel om jouw bestellingen vlot te verwerken en te leveren.' d='Custom'}</p>*}
{*  </div>*}
{/block}
