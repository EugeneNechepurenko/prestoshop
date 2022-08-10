
{block name='login_success'}

	<div id="login-success-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="loginSuccessLabel" style="display: block; ">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true"><i class="material-icons">close</i></span>
				</button>
			</div>
			<h4>{l s='Welkom terug … ! ' d='Shop.Theme.Customeraccount'} </h4>
			<p>{l s='Fijn om je hier terug te zien! Heb je vragen? Aarzel dan zeker niet om ons te contacteren. Onze live chat is elke weekdag voor jou beschikbaar.' d='Shop.Theme.Customeraccount'} </p>
			
			<a class="header_content_btn" href="{$urls.pages.my_account}">{l s='Account' d='Shop.Theme.Global'} </a>
			<a class="header_content_btn" href="{$urls.base_url}">{l s='Startpagina' d='Shop.Theme.Global'} </a>
		</div>
	  </div> 
	</div>
	<div class="modal-backdrop fade in"></div>

{/block}


