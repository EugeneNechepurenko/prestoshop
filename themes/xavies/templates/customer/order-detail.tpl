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
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {include file='customer/_partials/sidebar-menu.tpl'}

  <div class="order_detail_container">
    {block name='order_infos'}
      <div id="order-infos">
        <div class="box">
          <div class="left_side">
            <p><strong>{l s='Order Reference' d='Shop.Theme.Customeraccount' }</strong></p>
            <p>{l s='%reference% - placed on %date%' d='Shop.Theme.Customeraccount'
                          sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]}</p>
          </div>
          {if $order.details.reorder_url}
            <div class="right_side">
              <a href="{$order.details.reorder_url}" class="custom_btn">{l s='Reorder' d='Shop.Theme.Actions'}</a>
            </div>
          {/if}
        </div>
        <div class="box">
          <div class="left_side">
            <div class="section">
              <p><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong></p>
              <p>{$order.carrier.name}</p>
            </div>
            <div class="section">
              <p><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong></p>
              <p>{$order.details.payment}</p>
            </div>

            {if $order.details.invoice_url}
            <div class="section">
              <p><a href="{$order.details.invoice_url}">{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}</a></p>
            </div>
            {/if}

            {if $order.details.recyclable}
              <div class="section">
                <p>{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}</p>
              </div>
            {/if}

            {if $order.details.gift_message}
                <div class="section">
                  <p>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</p>
                  <p>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</p>
                </div>
            {/if}
          </div>
        </div>
      </div>
    {/block}

    {block name='order_history'}
      <div id="order-history">
        <div class="box">
          <div class="box_title">
            <p><strong>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</strong></p>
          </div>
          <div class="left_side">
            <p><strong>{l s='Date' d='Shop.Theme.Global'}</strong></p>

            {foreach from=$order.history item=state}
              <p>{$state.history_date}</p>
            {/foreach}

          </div>
          <div class="right_side">
            <p><strong>{l s='Status' d='Shop.Theme.Global'}</strong></p>

            {foreach from=$order.history item=state}
              <p><span class="label label-pill {$state.contrast}" style="color:{$state.color}">{$state.ostate_name}</span></p>
            {/foreach}
          </div>
        </div>
      </div>
    {/block}

    {if $order.follow_up}
      <div class="box">
        <div class="left_side">
          <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
          <p><a href="{$order.follow_up}">{$order.follow_up}</a></p>
        </div>
      </div>
    {/if}

    {block name='addresses'}
    <div id="addresses">
      <div class="box">
        <div class="left_side">
          <p><strong>{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</strong></p>
          {if $order.addresses.delivery}<address>{$order.addresses.delivery.formatted nofilter}</address>{/if}
        </div>
        <div class="right_side">
          <p><strong>{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</strong></p>
          <address>{$order.addresses.invoice.formatted nofilter}</address>
          </div>
        </div>
      </div>
    {/block}

    <div id="DISPLAYORDERDETAIL">
      {$HOOK_DISPLAYORDERDETAIL nofilter}
    </div>

    {block name='order_detail'}
      <div id="order_detail">
        {if $order.details.is_returnable}
          {include file='customer/_partials/order-detail-return.tpl'}
        {else}
          {include file='customer/_partials/order-detail-no-return.tpl'}
        {/if}
      </div>
    {/block}

    {block name='order_carriers'}
      {if $order.shipping}
        <div id="order_carriers">
          <div class="box">
            <table class="table table-striped table-bordered hidden-sm-down">
              <thead class="thead-default">
              <tr>
                <th>{l s='Date' d='Shop.Theme.Global'}</th>
                <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
                <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
              </tr>
              </thead>
              <tbody>
              {foreach from=$order.shipping item=line}
                <tr>
                  <td>{$line.shipping_date}</td>
                  <td>{$line.carrier_name}</td>
                  <td>{$line.shipping_weight}</td>
                  <td>{$line.shipping_cost}</td>
                  <td>{$line.tracking nofilter}</td>
                </tr>
              {/foreach}
              </tbody>
            </table>
            <div class="hidden-md-up shipping-lines">
              {foreach from=$order.shipping item=line}
                <div class="shipping-line">
                  <ul>
                    <li>
                      <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                    </li>
                    <li>
                      <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                    </li>
                    <li>
                      <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                    </li>
                    <li>
                      <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                    </li>
                    <li>
                      <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                    </li>
                  </ul>
                </div>
              {/foreach}
            </div>
          </div>
        </div>
      {/if}
    {/block}
    {block name='order_messages'}
      <div id="order_messages">
        {include file='customer/_partials/order-messages.tpl'}
      </div>
    {/block}
  </div>

{/block}
