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
<!-- Pagination -->
{if isset($Pagination.NombreTotalPages) && $Pagination.NombreTotalPages > 1}
	<div class="prestablog_pagination">
{*		{if $Pagination.PageCourante > 1}*}
{*			{if $prestablog_categorie_link_rewrite}*}
{*				<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartPrecedent p=$Pagination.PagePrecedente c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&lt;&lt;</a>*}
{*			{else}*}
{*				<a href="{PrestaBlogUrl}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&lt;&lt;</a>*}
{*			{/if}*}
{*		{else}*}
{*			<span class="disabled">&lt;&lt;</span>*}
{*		{/if}*}




{*        {if ($Pagination.PageCourante <= 3)}*}
{*			{foreach from=$Pagination.PremieresPages key=key_page item=value_page}*}
{*				{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}*}
{*					<span class="current">{$key_page|intval}</span>*}
{*				{else}*}
{*					{if $key_page == 1}*}
{*						{if $prestablog_categorie_link_rewrite}*}
{*							<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*						{else}*}
{*							<a href="{PrestaBlogUrl}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*						{/if}*}
{*					{else}*}
{*						<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}"*}
{*						>{$key_page|intval}</a>*}
{*					{/if}*}
{*				{/if}*}
{*			{/foreach}*}
{*        {/if}*}


        {if isset($Pagination.Pages) && $Pagination.Pages}
{*			<pre>$Pagination = {$Pagination|print_r}</pre>*}
{*			<pre>$Pagination.Pages = {$Pagination.Pages|print_r}</pre>*}
{*			<pre>$Pagination.PageCourante = {$Pagination.PageCourante}</pre>*}


            {if ($Pagination.PageCourante|intval > 1 && $Pagination.NombreTotalPages|intval > 3)}
				<a class="pagination_prev" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartPrecedent p=$Pagination.PageCourante|intval-1 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}"><</a>
            {/if}
            {if ($Pagination.PageCourante|intval > 1 && $Pagination.PageCourante|intval === $Pagination.NombreTotalPages|intval)}
				<a class="page_minus2" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartCourant-($Pagination.StartSuivant-$Pagination.StartPrecedent) p=$Pagination.PageCourante|intval-2 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$Pagination.PageCourante|intval - 2}</a>
            {/if}
            {if ($Pagination.PageCourante|intval > 1)}
				<a class="page_minus1" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartPrecedent|strval p=$Pagination.PageCourante|intval-1 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$Pagination.PageCourante|intval - 1}</a>
            {/if}
            {if ($Pagination.PageCourante)}
				<span class="current">{$Pagination.PageCourante|intval}</span>
            {/if}

            {if ($Pagination.PageCourante|intval+1 <= $Pagination.NombreTotalPages|intval)}
				<a class="page_plus1" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant p=$Pagination.PageCourante|intval+1 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$Pagination.PageCourante|intval + 1}</a>
            {/if}
            {if ($Pagination.PageCourante|intval === 1 && $Pagination.NombreTotalPages|intval >= 3)}
				<a class="page_plus2" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant+($Pagination.StartSuivant-$Pagination.StartPrecedent) p=$Pagination.PageCourante|intval+2 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$Pagination.PageCourante|intval + 2}</a>
            {/if}
            {if ($Pagination.PageCourante|intval === 1 && $Pagination.NombreTotalPages|intval >= 3 && $Pagination.PageCourante|intval+3 <= $Pagination.NombreTotalPages|intval)}
				<a class="pagination_dots" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant+($Pagination.StartSuivant-$Pagination.StartPrecedent)*2 p=$Pagination.PageCourante|intval+3 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">...</a>
            {/if}
            {if ($Pagination.PageCourante|intval !== 1 && $Pagination.NombreTotalPages|intval >= 2 && $Pagination.PageCourante|intval+2 <= $Pagination.NombreTotalPages|intval)}
				<a class="pagination_dots" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant+($Pagination.StartSuivant-$Pagination.StartCourant) p=$Pagination.PageCourante|intval+2 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">...</a>
            {/if}
            {if ($Pagination.NombreTotalPages|intval >= 3 && $Pagination.PageCourante|intval+1 <= $Pagination.NombreTotalPages|intval)}
				<a class="pagination_next" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant p=$Pagination.PageCourante|intval+1 c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">></a>
            {/if}


{*            {foreach from=$Pagination.Pages key=key_page item=value_page}*}
{*				<div>$key_page = {$key_page}</div>*}
{*				<div>$value_page = {$value_page}</div>*}
{*                {if !in_array($value_page, $Pagination.PremieresPages)}*}
{*                    {if ($Pagination.PageCourante-2 == $key_page)}*}
{*						<a class="page_minus2" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*                    {/if}*}
{*                    {if ($Pagination.PageCourante-1 == $key_page)}*}
{*						<a class="page_minus1" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*                    {/if}*}
{*                    {if ($Pagination.PageCourante == $key_page)}*}
{*						<span class="current">{$key_page|intval}</span>*}
{*                    {/if}*}
{*                    {if ($Pagination.PageCourante+1 == $key_page)}*}
{*						<a class="page_plus1" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*                    {/if}*}
{*                    {if ($Pagination.PageCourante+2 == $key_page)}*}
{*						<a class="page_plus2" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>*}
{*                    {/if}*}
{*                {/if}*}
{*            {/foreach}*}
        {/if}


{*		{if isset($Pagination.Pages) && $Pagination.Pages}*}
{*			<span class="more">...</span>*}
{*			{foreach from=$Pagination.Pages key=key_page item=value_page}*}
{*				{if !in_array($value_page, $Pagination.PremieresPages)}*}
{*					{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}*}
{*						<span class="current">{$key_page|intval}</span>*}
{*					{else}*}
{*						<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}"*}
{*						>{$key_page|intval}</a>*}
{*					{/if}*}
{*				{/if}*}
{*			{/foreach}*}
{*		{/if}*}
{*		{if $Pagination.PageCourante < $Pagination.NombreTotalPages}*}
{*			<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant p=$Pagination.PageSuivante c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&gt;&gt;</a>*}
{*		{else}*}
{*			<span class="disabled">&gt;&gt;</span>*}
{*		{/if}*}
	</div>
{/if}
<!-- /Pagination -->
<!-- /Module Presta Blog -->
