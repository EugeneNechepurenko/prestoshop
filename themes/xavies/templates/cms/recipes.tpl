{extends file='page.tpl'}

{block name='additional_body_class'}recipes_page{/block}

{block name='page_title'}
   <h1>{$cms_category.name}</h1>
{/block}

{block name='breadcrumb'}{/block}

{*hook h='displayAmazzingFilter'*}

{block name="left_column"}
{*	<div id="left-column" class="col-xs-12 col-sm-4 col-md-3 hide_filters">*}
	<div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
		{hook h="displayLeftColumn" mod="amazzingfilter"}
		<p class="side_filter_title">{l s='filter' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
		<p class="side_filter_title_close">{l s='filter' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
	</div>
{/block}


{block name='page_content'}

  {block name='cms_sub_categories'}
    {if $sub_categories}
      {*<p>{l s='List of sub categories in %name%:' d='Shop.Theme.Global' sprintf=['%name%' => $cms_category.name]}</p>*}
      <ul id="cms_pages_list">
		{assign var="n" value=1}
		
        {foreach from=$sub_categories item=sub_category}
			{*<li><a href="{$sub_category.link}">{$sub_category.name}</a></li>*}
			{block name='cms_sub_pages'}
				{if $sub_category.cms_pages}

					{for $i=0 to $sub_category.cms_pages|@count}
					{*{$sub_category.cms_pages.{$i}.link}*}
					{*{foreach from=$sub_category.cms_pages item=cms_page}*}
					
					{if isset($sub_category.cms_pages.{$i}.id_cms) && $sub_category.cms_pages.{$i}.id_cms}
						
						{if $n is even}
						{/if}
						
						{if $n == 1}
							<li>
						{/if}
							
							{assign var="image_url" value="{_PS_IMG_DIR_}/cms/{$sub_category.cms_pages.{$i}.top_image}"}
							{if isset($sub_category.cms_pages.{$i}.top_image) && !empty($sub_category.cms_pages.{$i}.top_image) && file_exists($image_url)}
								<div class="list-group-item">
									<a class="" href="{$sub_category.cms_pages.{$i}.link}">
{*										<img data-lazy="{$link->getMediaLink("/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}"*}
{*											 alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}


{*										<img src="{$link->getMediaLink("/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}"*}
{*											 alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}

										<img data-lazy="{$link->getMediaLink("/resize.php/?height=370&file=/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}" alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>
{*										<img src="{$link->getMediaLink("/resize.php/?height=370&file=/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}" alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}
{*										<img src="{$link->getMediaLink("/resize.php/?width=380&height=370&file=/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}" alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}

{*                                        {"/resize.php/?width=380&height=370&file=/img/cms/"|cat:{$sub_category.cms_pages.{$i}.top_image}}  *}
{*                                        {html_image file={"/resize.php/?width=380&height=370&file=/img/cms/"|cat:{$sub_category.cms_pages.{$i}.top_image}}  }*}

{*										<img data-lazy="{$link->getMediaLink("/img/cms/{$sub_category.cms_pages.{$i}.top_image}")}"*}
{*											 alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm" width="450px"/>*}
									</a>
									<span>{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}</span>
									{if isset($sub_category.cms_pages.{$i}.product.name) && !empty($sub_category.cms_pages.{$i}.product.name)}
										<span class="sub_text">{$sub_category.cms_pages.{$i}.product.name}</span>
									{/if}
									<a class="link_btn" href="{$sub_category.cms_pages.{$i}.link}">{l s='LEES MEER' d='Shop.Theme.Global'}</a>
								</div>
							{else}
								<div class="list-group-item">
									{*$link->getMediaLink("/img/cms/category/{$cms_category->id_parent}-{$sub_category.cms_pages.{$i}.id_cms}-thumb.jpg")*}
									<a class="" href="{$sub_category.cms_pages.{$i}.link}">
										<img data-lazy="{$urls.img_url}no-image.jpg"
											alt="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" title="{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}" class="imgm"/>
									</a>
									<span>{$sub_category.cms_pages.{$i}.meta_title|escape:'html':'UTF-8'}</span>
									<span class="sub_text">KOKOS-KANEEL GRANOLA</span>
									<a class="link_btn" href="{$sub_category.cms_pages.{$i}.link}">{l s='LEES MEER' d='Shop.Theme.Global'}</a>
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
					
					{*{/foreach}*}
					{/for}
				{/if}
			{/block}
        {/foreach}
      </ul>
	  
	  
	  
{*		<div id="categoriesFiltrage" class="custom_filter" style="display: none">*}
{*			<p class="side_filter_title">{l s='filter jouw zoekopdracht' d='Custom'}<a>&lt;</a></p>*}
{*			<p class="side_filter_title_close">{l s='filter' d='Custom'}<a>&lt;</a></p>*}
{*			<form action="https://dev.xavies.be/nl/blog" method="post">*}
{*				<div class="prestablog_input_filtre_cat_title">*}
{*					<a>&lt;</a>*}
{*					<p class="prestablog_input_filtre_collapse_title">{l s='Recepten met' d='Custom'}</p>*}
{*				</div>*}
{*				<div id="prestablog_input_filtre_cat">*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='GRANOLA (53)' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='THEE' d='Custom'}</label>*}
{*				</div>*}
{*				<div class="prestablog_input_filtre_cat_title">*}
{*					<a>&lt;</a>*}
{*					<p class="prestablog_input_filtre_collapse_title">{l s='Assortiment' d='Custom'}</p>*}
{*				</div>*}
{*				<div id="prestablog_input_filtre_cat">*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='PURE TOASTED' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='XAVIES’ GRANOVIE' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='SANDRA BEKKARI' d='Custom'}</label>*}
{*				</div>*}
{*				<div class="prestablog_input_filtre_cat_title">*}
{*					<a>&lt;</a>*}
{*					<p class="prestablog_input_filtre_collapse_title">{l s='Gelegenheid' d='Custom'}</p>*}
{*				</div>*}
{*				<div id="prestablog_input_filtre_cat">*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='ONTBIJT' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='LUNCH' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='APERO' d='Custom'}</label>*}
{*					<label title="cat_filter_6"><input type="checkbox" id="cat_filter_6" name="prestablog_search_array_cat[]" value="6">{l s='DESSERT' d='Custom'}</label>*}
{*				</div>*}
{*				<button class="btn btn-default button-search" type="submit" style="display:none;">*}
{*					<span>{l s='Search again on blog' d='Custom'}</span>*}
{*				</button>*}
{*			</form>*}
{*		</div>*}
    {/if}
  {/block}




{/block}
