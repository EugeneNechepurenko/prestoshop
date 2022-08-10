{*
 * 2008 - 2020 (c) Prestablog
 *
 * MODULE PrestaBlog
 *
 * @author    Prestablog
 * @copyright Copyright (c) permanent, Prestablog
 * @license   Commercial
 *}
<!-- Module Presta Blog -->
{*if !empty($prestablog_search_array_cat)*}

{*<div id="left-column" class="col-xs-12 col-sm-4 col-md-3 hide_filters">*}
<div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
	<div id="amazzing_filter" class="af block vertical-layout displayLeftColumn hide-zero-matches dim-zero-matches">
		<div class="block_content">  
			<div class="selectedFilters"> 
				<div class="clearAll hidden"> Verwijder filters <a href="#" class="icon-eraser all" title="Verwijder filters"></a> 
				</div> 
			</div>  
			<div class="af_filter c clearfix type-1 foldered" data-trigger="c" data-url="categorieen"> 
				<div class="af_subtitle_heading"> 
					<span class="af_subtitle">Categorieën</span>
				</div> 
				
				<div class="af_filter_content">          
					<ul class="cat_filter">  
						{PrestaBlogContent return=$FiltrageCatInputs}
					</ul>     
					{*<input type="hidden" name="available_options[c]" value="12,28,31,22"> *}
				</div>  
					{* <a href="#" class="toggle-cut-off"> <span class="more">meer</span> <span class="less">minder</span> </a>*} 
			</div>
			<form action="#" id="af_form"> 
			</form> 
		</div>   
	</div>
	<p class="side_filter_title">{l s='Filters' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
	<p class="side_filter_title_close">{l s='filter' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
	<div class="btn-holder" style="display: none">
		<a href="#" class="btn btn-default full-width viewFilteredProducts btn-primary"> Toon resultaten <span class="af-total-count"></span></a>
	</div>
</div>



{*<div id="categoriesFiltrage" class="custom_filter">*}
{*	<p class="side_filter_title">{l s='filter jouw zoekopdracht' mod='prestablog'}<a><</a></p>*}
{*	<p class="side_filter_title_close">{l s='filter' mod='prestablog'}<a><</a></p>*}
{*	<form action="{PrestaBlogUrl}" method="post">*}
{*		<div class="prestablog_input_filtre_cat_title">*}
{*			<a><</a>*}
{*			<p class="prestablog_input_filtre_collapse_title">{l s='Categorie' mod='prestablog'}</p>*}
{*		</div>*}
{*		<div id="prestablog_input_filtre_cat">*}
{*            {PrestaBlogContent return=$FiltrageCatInputs}*}
{*		</div>*}

{*		<button class="btn btn-default button-search" type="submit" style="display:none;">*}
{*			<span>{l s='Search again on blog' mod='prestablog'}</span>*}
{*		</button>*}
{*	</form>*}
{*</div>*}
{*{/if}*}
<!-- Module Presta Blog -->
