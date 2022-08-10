
{block name='registration_success'}

	<div id="registration_success-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="registrationSuccessLabel" style="display: block; ">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true"><i class="material-icons">close</i></span>
				</button>
			</div>
			<h4>{l s='Bedankt voor jouw registratie!' d='Shop.Theme.Customeraccount'} </h4>
			<p>{l s='Je ontvangt dadelijk een bevestiging via mail. Hou dus zeker jouw mailbox in de gaten.' d='Shop.Theme.Customeraccount'} </p>
			
			<a class="header_content_btn" "{$urls.base_url}">{l s='Webshop' d='Shop.Theme.Global'} </a>
			<a class="header_content_btn" "{$urls.base_url}">{l s='Startpagina' d='Shop.Theme.Global'} </a>
		</div>
	  </div> 
	</div>
	<div class="modal-backdrop fade in"></div>

{/block}