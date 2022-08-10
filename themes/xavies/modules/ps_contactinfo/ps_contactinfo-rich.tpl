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

<div class="contact-rich">
  <h4>{l s='contacteer ons' d='Shop.Theme.Global'}</h4>
  <div class="contact_info">
    <div>
      <p class="contact-type">{l s='Algemene vragen:' d='Shop.Theme.Global'}</p>
      {if $contact_infos.email}<p class="contact-element">
        <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
      </p>{/if}
      {if $contact_infos.phone}<p class="contact-element">
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
      </p>{/if}
      <p class="contact-element">
        <a href="{$link->getCMSCategoryLink(10)}">{l s='Veelgestelde vragen' d='Shop.Theme.Global'}</a>
      </p>
    </div>
    <div>
      <p class="contact-type">{l s='Verdeler worden:' d='Shop.Theme.Global'}</p>
      {if $contact_infos.email}<p class="contact-element">
        <a href="mailto:sales@granoladies.com">sales@granoladies.com</a>
      </p>{/if}
      {if $contact_infos.phone}<p class="contact-element">
        <a href="tel:+324768 2948">+32 476 85 29 48</a>
      </p>{/if}
    </div>
  </div>
{*  <div class="block">*}
{*    <div class="icon"><i class="material-icons">&#xE55F;</i></div>*}
{*    <div class="data">{$contact_infos.address.formatted nofilter}</div>*}
{*  </div>*}
{*  {if $contact_infos.phone}*}
{*    <hr/>*}
{*    <div class="block">*}
{*      <div class="icon"><i class="material-icons">&#xE0CD;</i></div>*}
{*      <div class="data">*}
{*        {l s='Call us:' d='Shop.Theme.Global'}<br/>*}
{*        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>*}
{*       </div>*}
{*    </div>*}
{*  {/if}*}
{*  {if $contact_infos.fax}*}
{*    <hr/>*}
{*    <div class="block">*}
{*      <div class="icon"><i class="material-icons">&#xE0DF;</i></div>*}
{*      <div class="data">*}
{*        {l s='Fax:' d='Shop.Theme.Global'}<br/>*}
{*        {$contact_infos.fax}*}
{*      </div>*}
{*    </div>*}
{*  {/if}*}
{*  {if $contact_infos.email}*}
{*    <hr/>*}
{*    <div class="block">*}
{*      <div class="icon"><i class="material-icons">&#xE158;</i></div>*}
{*      <div class="data email">*}
{*        {l s='Email us:' d='Shop.Theme.Global'}<br/>*}
{*       </div>*}
{*       <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>*}
{*    </div>*}
{*  {/if}*}
</div>
