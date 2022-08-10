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
<!-- Block search module TOP -->

<!--	<form>
		<div class="header_search_input_line">
			<div><i class="material-icons search">&#xE8B6;</i></div>
			<input type="text">
		</div>
		<div class="header_search_submit_line">
			<button type="submit">ZOEKEN</button>
			<a>ANNULEREN</a>
		</div>
	</form> -->

{*<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">*}
{*	<form method="get" action="{$search_controller_url}">*}
{*		<input type="hidden" name="controller" value="search">*}
{*		<input type="text" name="s" value="{$search_string}" placeholder="{l s='Search our catalog' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">*}
{*		<button type="submit">*}
{*			<i class="material-icons search">&#xE8B6;</i>*}
{*			<span class="hidden-xl-down">{l s='Search' d='Shop.Theme.Catalog'}</span>*}
{*		</button>*}
{*	</form>*}
{*</div>*}









{*<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">*}
	<form method="get" action="{$search_controller_url}">

			<input type="hidden" name="controller" value="search">
			<input type="text" name="s" value="{$search_string}" placeholder="" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">

			<button type="submit"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15.98 15.98">
					<defs>
						<style>
							.cls-1 {
								fill: #e94859;
							}
						</style>
					</defs>
					<g id="Laag_2" data-name="Laag 2">
						<g id="Laag_1-2" data-name="Laag 1">
							<path id="Path_253" data-name="Path 253" class="cls-1" style="fill: #e94859" d="M2,7A5,5,0,0,1,6.9,2H7a5,5,0,0,1,5,4.9V7a5,5,0,0,1-4.9,5H7A5,5,0,0,1,2,7.1Zm12.3,8.7a1,1,0,0,0,1.4-1.4l-3.1-3.1A6.85,6.85,0,0,0,14,7,7,7,0,0,0,7.09,0H7A7,7,0,0,0,0,6.91V7a7,7,0,0,0,6.91,7H7a6.85,6.85,0,0,0,4.2-1.4Z"></path>
						</g>
					</g>
				</svg></button>



	</form>
{*</div>*}
<!-- /Block search module TOP -->
