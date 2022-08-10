<div class="back_button_container">
	{block name='continue_shopping'}
		{foreach from=$steps item="step" key="index"}
			{if $step.is_current}
				{if $index == 0 || $index == 1}
				  <a class="label" href="{$urls.pages.cart}?action=show">
					<i class="material-icons">chevron_left</i>{l s='Terug naar winkelmandje' d='Shop.Theme.Actions'}
				  </a>
				{else}
				  <a class="label" href="#" data-id="{$prevStep.identifier}-tab" data-index="{$index}">
					<i class="material-icons">chevron_left</i>{l s='Terug naar %s' sprintf=[$prevStep.title|lower]  d='Shop.Theme.Actions'}
				  </a>
				{/if}
			{else}
				{assign var="prevStep" value=$step} 
			{/if}
		{/foreach}

	{/block}
</div>
<div class="cart-grid-body card-grid-title">

	{foreach from=$steps item="step" key="index"}
	{if $step.is_current}
		<h1 class="step-title h3">{$step.title}</h1>
	{/if}
	{/foreach}

	<ul class="nav nav-tabs_ nav-wizard order-steps" id="checkout_tabs" role="tablist">
		{foreach from=$steps item="step" key="index"}
			{if $index>0}
			<li class="nav-item {if $step.is_current}selected{/if} {if $next}next{/if}">
				{if $step.is_current}
					{assign var="next" value=1}
				{else}
					{assign var="next" value=0}
				{/if}	
				{if $step.is_reacheable}
					<a class="{if $step.is_current}active{/if} nav-link" id="{$step.identifier}-tab" data-toggle="tab" href="#{$step.identifier}" role="tab" aria-controls="{$step.identifier}" aria-selected="{if $step.is_current}true{else}false{/if}"><span><span class="hidden-sm-down">{*$index + 1*}</span> {$step.title}<i></i></span></a>
				{else}
					<span class="nav-link"><span class="hidden-sm-down">{*$index + 1*}</span> {$step.title}<i></i></span>
				{/if}
			</li>
			{/if}
		{/foreach}
		<li class="nav-item {if $next}next{/if}">	
			<span class="nav-link"><span class="hidden-sm-down"></span>{l s='Bevestiging' d='Shop.Theme.Checkout'}<i></i></span>
		</li>
	</ul>
	
</div>