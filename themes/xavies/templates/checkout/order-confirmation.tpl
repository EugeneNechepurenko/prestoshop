{extends file='page.tpl'}

{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation"> {*class="card"*}
      <div class="card-block card-grid-title"">
        <div class="row">
          <div class="col-md-12">
			<h1 class="step-title h3">{l s='BEVESTIGING' d='Shop.Theme.Checkout'}</h1>
			<ul class="nav nav-tabs_ nav-wizard order-steps" id="checkout_tabs" role="tablist">
				<li class="nav-item  ">
					<a class="nav-link" href="#"><span>{l s='Addresses' d='Shop.Theme.Checkout'}<i></i></span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"><span>{l s='Shipping Method' d='Shop.Theme.Checkout'}<i></i></span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"><span>{l s='Payment' d='Shop.Theme.Checkout'}<i></i></span></a>
				</li>
				<li class="nav-item selected ">	
					<a class="active nav-link" href="#"><span>{l s='Bevestiging' d='Shop.Theme.Checkout'}<i></i></span></a>
				</li>
			</ul>

            {block name='order_confirmation_header'}
              <h3 class="h1 card-title">
				{l s='Bedankt voor jouw bestelling!' d='Shop.Theme.Checkout'}
				{*
					<i class="material-icons rtl-no-flip done">&#xE876;</i>{l s='Your order is confirmed' d='Shop.Theme.Checkout'}
				*}
              </h3>
            {/block}

            <p>
              {l s='Je ontvangt dadelijk een overzicht van jouw bestelling via mail.' d='Shop.Theme.Checkout'}

            </p>
			
			<p>
				{l s='Vragen? Bel ons op 051 31 27 05' d='Shop.Theme.Checkout'}
			</p>
			
			<div class="center">
				<a href="/{$language.iso_code}/index.php?controller=order-detail&id_order={$order.details.id}" class="btn-primary">{l s='MIJN BESTELLING' d='Shop.Theme.Checkout'}</a>
			</div>
			
			<div class="center">
				<a href="{$urls.base_url}" class="btn-primary">{l s='STARTPAGINA' d='Shop.Theme.Checkout'}</a>
			</div>

            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}

          </div>
        </div>
      </div>
    </section>
{/block}

{block name='page_content_container'}
 {*
  <section id="content" class="page-content page-order-confirmation card">
    <div class="card-block">
      <div class="row">

        {block name='order_confirmation_table'}
          {include
            file='checkout/_partials/order-confirmation-table.tpl'
            products=$order.products
            subtotals=$order.subtotals
            totals=$order.totals
            labels=$order.labels
            add_product_link=false
          }
        {/block}

        {block name='order_details'}
          <div id="order-details" class="col-md-4">
            <h3 class="h3 card-title">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
            <ul>
              <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
              <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
              {if !$order.details.is_virtual}
                <li>
                  {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
            </ul>
          </div>
        {/block}

      </div>
    </div>
  </section>
  *}

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="card definition-list">
      <div class="card-block">
        <div class="row">
          <div class="col-md-12">
            {$HOOK_PAYMENT_RETURN nofilter}
          </div>
        </div>
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="card">
        <div class="card-block">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}
{/block}
