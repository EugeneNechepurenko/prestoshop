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
<section id="content" class="page-content page-not-found">
  {block name='page_content'}

    <h4>{l s='OEPS!' d='Custom'}</h4>
    <p>{l s='Er zijn geen resultaten gevonden voor de zoekterm die je hebt ingegeven. Probeer een andere zoekterm of klik op éen van onze meestgezochte artikelen.' d='Shop.Theme.Global'}</p>
    <ul class="links_404">
      <li><a href="{$search_controller_url}?controller=search&s={l s='CADEAU' d='Custom'}">{l s='CADEAU' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='RECEPT' d='Custom'}">{l s='RECEPT' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='SUIKERVRIJ' d='Custom'}">{l s='SUIKERVRIJ' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='CHOCOLADE' d='Custom'}">{l s='CHOCOLADE' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='CACAO' d='Custom'}">{l s='CACAO' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='NOTEN' d='Custom'}">{l s='NOTEN' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='VEGAN' d='Custom'}">{l s='VEGAN' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='SNACK' d='Custom'}">{l s='SNACK' d='Custom'}</a></li>
      <li><a href="{$search_controller_url}?controller=search&s={l s='SANDRA BEKKARI' d='Custom'}">{l s='SANDRA BEKKARI' d='Custom'}</a></li>
    </ul>
{*    {block name='search'}*}
{*      {hook h='displaySearch'}*}
{*    {/block}*}

{*    {block name='hook_not_found'}*}
{*      {hook h='displayNotFound'}*}
{*    {/block}*}

  {/block}
</section>
