{extends file='page.tpl'}

{block name='additional_body_class'}faq_page{/block}

{block name='page_title'}
  {$cms_category.name}
{/block}
{block name='page_subtitle'}
	<p class="faq_subtitle faq_subtitle_close">{l s='De samenstelling van XAVIES’ Granola' d='Shop.Theme.Global'}</p>
	<p class="faq_subtitle faq_subtitle_open" style="display: none">{l s='…OVER De samenstelling van XAVIES’ Granola’ Granola' d='Shop.Theme.Global'}</p>
{/block}

{block name='breadcrumb'}{/block}

{block name='page_content'}

 {*
  {block name='cms_sub_categories'}
    {if $sub_categories}
      <p>{l s='List of sub categories in %name%:' d='Shop.Theme.Global' sprintf=['%name%' => $cms_category.name]}</p>
      <ul>
        {foreach from=$sub_categories item=sub_category}
          <li><a href="{$sub_category.link}">{$sub_category.name}</a></li>
        {/foreach}
      </ul>
    {/if}
  {/block}
  *}

  {block name='cms_sub_pages'}
    {if $cms_pages}
	  <div class="acordion_container">
		{foreach from=$cms_pages item=cms_page}
			<div class="acordion_item">
				<div class="item_title">
					{* <li><a href="{$cms_page.link}">{$cms_page.meta_title}</a></li> *}
					<p class="h3">{$cms_page.meta_title}</p>
					<div class="title_arrow_status">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12.08 18.61">
							<g id="Laag_2" data-name="Laag 2">
								<g id="Laag_1-2" data-name="Laag 1">
									<g id="_1" data-name=" 1">
										<path id="Path_36" data-name="Path 36" d="M0,9.31,9.31,0l2.77,2.77L5.54,9.31l6.54,6.53L9.31,18.61Z"/>
									</g>
								</g>
							</g>
						</svg>
					</div>
				</div>
				<div class="item_content">
					{$cms_page.content nofilter}
				</div>			  
			</div>
        {/foreach}
    {/if}
  {/block}

{/block}
