<div class="sidebar_menu">
	<a class="account_sidebar_item" id="identity-link" href="{$urls.pages.identity}">
		<span class="link-item">
			{l s='Information' d='Shop.Theme.Customeraccount'}
		</span>
	</a>
	{if !$configuration.is_catalog}
		<a class="account_sidebar_item" id="history-link" href="{$urls.pages.history}">
			<span class="link-item">
				{l s='Order history and details' d='Shop.Theme.Customeraccount'}
			</span>
		</a>
	{/if}
	<a class="account_sidebar_item" id="identity-link" href="{$logout_url}">
		<span class="link-item">
			{l s='Sign out' d='Shop.Theme.Actions'}
		</span>
	</a>
</div>