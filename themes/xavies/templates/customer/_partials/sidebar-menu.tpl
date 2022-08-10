<div class="sidebar_menu">
	<a class="account_sidebar_item" id="identity-link" href="{$urls.pages.identity}">
		<span class="link-item">
			{l s='Account bewerken' d='Shop.Theme.Customeraccount'}
		</span>
	</a>

	{if $customer.addresses|count}
		<a class="account_sidebar_item" id="addresses-link" href="{$urls.pages.addresses}">
		  <span class="link-item">
			{l s='Addresses' d='Shop.Theme.Customeraccount'}
		  </span>
		</a>
	{else}
		<a class="account_sidebar_item" id="address-link" href="{$urls.pages.address}">
		  <span class="link-item">
			{l s='Add first address' d='Shop.Theme.Customeraccount'}
		  </span>
		</a>
	{/if}
	
	{if !$configuration.is_catalog}
		<a class="account_sidebar_item" id="history-link" href="{$urls.pages.history}">
			<span class="link-item">
				{l s='Order history and details' d='Shop.Theme.Customeraccount'}
			</span>
		</a>
	{/if}

	
	{block name='display_customer_account'}
		{hook h='displayCustomerAccount'}
	{/block}
	  
	<a class="account_sidebar_item" id="logout-link" href="{$logout_url}" rel="nofollow">
		<span class="link-item">
			{l s='Sign out' d='Shop.Theme.Actions'}
		</span>
	</a>	

</div>