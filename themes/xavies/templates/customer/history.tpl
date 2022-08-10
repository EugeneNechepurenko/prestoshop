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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {include file='customer/_partials/sidebar-menu.tpl'}

  {if $orders}
    <table class="{if count($orders) > 3}show_scroll {/if}table table-striped table-bordered table-labeled hidden-lg-down">
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <td class="info_number">
              <a href="{$order.details.details_url}"><h3>{$order.details.reference}</h3></a>
            </td>
            <td class="info_date">
              <p>{$order.details.order_date}</p>
            </td>
            <td class="info_price">
              <p>{$order.totals.total.value}</p>
            </td>
            <td class="products_cell">
              {foreach from=$order.products item=product name=products}
{*              {foreach from=$order.products item=product}*}
                <p>{$product.name}</p>
              {/foreach}
            </td>
            <td class="status_cell">
{*              <p><strong>{l s='Status' d='Shop.Theme.Actions'}</strong></p>*}
              <span class="label label-pill {$order.history.current.contrast}" style="background-color:{$order.history.current.color}">
                {$order.history.current.ostate_name}
              </span>
            </td>
            <td class="reorder_cell">
              {if $order.details.reorder_url}
                <a href="{$order.details.reorder_url}">{l s='OPNIEUW BESTELLEN' d='Shop.Theme.Actions'}</a>
              {/if}
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>

    <div class="{if count($orders) > 3}show_scroll {/if}hidden-xl-up order_table">
        {foreach from=$orders item=order}
          <div class="order_container">
            <div class="top_part">
              <div class="left_side">
                <a href="{$order.details.details_url}"><h3>{$order.details.reference}</h3></a>
                <p>{$order.details.order_date}</p>
                <p>{$order.totals.total.value}</p>
              </div>
              <div class="right_side">
                <span class="label label-pill {$order.history.current.contrast}" style="background-color:{$order.history.current.color}">{$order.history.current.ostate_name}</span>
                {foreach from=$order.products item=product name=products}<p class="order_item">{$product.name}</p>{/foreach}
              </div>
            </div>
            <div class="bottom_part"></div>
          </div>
        {/foreach}
    </div>

{*    <div class="orders hidden-md-up">*}
{*      {foreach from=$orders item=order}*}
{*        <div class="order">*}
{*          <div class="row">*}
{*            <div class="col-xs-10">*}
{*              <a href="{$order.details.details_url}"><h3>{$order.details.reference}</h3></a>*}
{*              <div class="date">{$order.details.order_date}</div>*}
{*              <div class="total">{$order.totals.total.value}</div>*}
{*              <div class="status">*}
{*                <span*}
{*                  class="label label-pill {$order.history.current.contrast}"*}
{*                  style="background-color:{$order.history.current.color}"*}
{*                >*}
{*                  {$order.history.current.ostate_name}*}
{*                </span>*}
{*              </div>*}
{*            </div>*}
{*            <div class="col-xs-2 text-xs-right">*}
{*                <div>*}
{*                  <a href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">*}
{*                    <i class="material-icons">&#xE8B6;</i>*}
{*                  </a>*}
{*                </div>*}
{*                {if $order.details.reorder_url}*}
{*                  <div>*}
{*                    <a href="{$order.details.reorder_url}" title="{l s='Reorder' d='Shop.Theme.Actions'}">*}
{*                      <i class="material-icons">&#xE863;</i>*}
{*                    </a>*}
{*                  </div>*}
{*                {/if}*}
{*            </div>*}
{*          </div>*}
{*        </div>*}
{*      {/foreach}*}
{*    </div>*}

  {/if}
{/block}
