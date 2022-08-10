{*{foreach from=$formFields item="field"}*}
{*        {if isset($field.availableValues.comment)}*}
			<div id="help_field_text_birthday" class="modal  fade in" tabindex="-1" style="display: none">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true"><i class="material-icons">close</i></span>
							</button>
						</div>
						<p>{l s='Vertel ons vrijblijvend jouw geboortedatum en wij zorgen voor een geschenkje op jouw verjaardag!' d='Shop.Theme.Help.Birthday'}</p>
					</div>
				</div>
			</div>
<div class="modal-backdrop fade in"  style="display: none"></div>
			<div id="help_field_password_password" class="modal  fade in" tabindex="-1"  style="display: none">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true"><i class="material-icons">close</i></span>
							</button>
						</div>
						<p>{l s='help for password field' d='Shop.Theme.Help.Password'}</p>
					</div>
				</div>
			</div>
<div class="modal-backdrop fade in"  style="display: none"></div>
{*        {/if}*}
{*{/foreach}*}