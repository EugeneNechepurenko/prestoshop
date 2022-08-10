{assign var="n" value=1}

{foreach from=$sub_categories item=sub_category}
	{block name='cms_sub_pages'}
		{if $sub_category.cms_pages}
		
			{foreach from=$sub_category.cms_pages item=cms_page}
			{if isset($cms_page.id_cms) && ($cms_page.id_cms)}
				
				{if $n is even}
				{/if}
				
				{if $n == 1}
					<li>
				{/if}
				
					{assign var="image_url" value="{_PS_IMG_DIR_}/cms/{$cms_page.top_image}"}
					{if isset($cms_page.top_image) && !empty($cms_page.top_image) && file_exists($image_url)}
						<div class="list-group-item">
							<a class="" href="{$cms_page.link}">
{*								<img data-lazy="{$cms_page.image_url}" data-lazy1="/resize.php/?height=370&file=/img/cms/{$cms_page.top_image}" alt="{$cms_page.meta_title|escape:'html':'UTF-8'}" title="{$cms_page.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}
								<img
									 data-lazy="/resize.php/?height=370&file=/img/cms/{$cms_page.top_image}"
									 alt="{$cms_page.meta_title|escape:'html':'UTF-8'}"
									 title="{$cms_page.meta_title|escape:'html':'UTF-8'}"
									 class="imgm" width="450px"/>
							</a>
							<span>{$cms_page.meta_title|escape:'html':'UTF-8'}</span>
							{if isset($cms_page.product.name) && !empty($cms_page.product.name)}
								<span class="sub_text">{$cms_page.product.name}</span>
							{/if}
							<a class="link_btn" href="{$cms_page.link}">{l s='LEES MEER' d='Shop.Theme.Global'}</a>
						</div>
					{else}
						<div class="list-group-item">
							<a class="" href="{$cms_page.link}">
								<img data-lazy="{$cms_page.no_image_url}" alt="{$cms_page.meta_title|escape:'html':'UTF-8'}" title="{$cms_page.meta_title|escape:'html':'UTF-8'}" class="imgm"/>
							</a>
							<span>{$cms_page.meta_title|escape:'html':'UTF-8'}</span>
							{if isset($cms_page.product.name) && !empty($cms_page.product.name)}
								<span class="sub_text">{$cms_page.product.name}</span>
							{/if}
							<a class="link_btn" href="{$cms_page.link}">{l s='LEES MEER' d='Shop.Theme.Global'}</a>
						</div>
					{/if}
					
				{if $n is even}
				{else}
					
				{/if}
				
				{if $n != 0 && $n is div by 18}
					</li>
					<li>
				{/if}
				{assign var="n" value=$n+1}
			{/if}
			
			{/foreach}
		{/if}
	{/block}
{/foreach}