
        {if ($Pagination.PageCourante <= 3)}
			{foreach from=$Pagination.PremieresPages key=key_page item=value_page}
				{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}
					<span class="current">{$key_page|intval}</span>
				{else}
					{if $key_page == 1}
						{if $prestablog_categorie_link_rewrite}
							<a href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
						{else}
							<a href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page']}">{$key_page|intval}</a>
						{/if}
					{else}
						<a href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'start' => $value_page, 'p' => $key_page, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
					{/if}
				{/if}
			{/foreach}
        {/if}


        {if isset($Pagination.Pages) && $Pagination.Pages}
{*			$Pagination.PageCourante = {$Pagination.PageCourante}*}
            {foreach from=$Pagination.Pages key=key_page item=value_page}
{*				$key_page = {$key_page}*}
                {if !in_array($value_page, $Pagination.PremieresPages)}
                    {if ($Pagination.PageCourante-2 == $key_page)}
						<a class="page_minus2" href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'start' => $value_page, 'p' => $key_page, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
                    {/if}
                    {if ($Pagination.PageCourante-1 == $key_page)}
						<a class="page_minus1" href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'start' => $value_page, 'p' => $key_page, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
                    {/if}
                    {if ($Pagination.PageCourante == $key_page)}
						<span class="current">{$key_page|intval}</span>
                    {/if}
                    {if ($Pagination.PageCourante+1 == $key_page)}
						<a class="page_plus1" href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'start' => $value_page, 'p' => $key_page, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
                    {/if}
                    {if ($Pagination.PageCourante+2 == $key_page)}
						<a class="page_plus2"
						href="javascript:void(0)" data-url="{url entity='module' name='prestablog' controller='ajax' params = ['action' => 'blog_page', 'categorie' => $prestablog_categorie_link_rewrite, 'start' => $value_page, 'p' => $key_page, 'c' => $prestablog_categorie, 'm' => $prestablog_month, 'y' => $prestablog_year]}">{$key_page|intval}</a>
                    {/if}
                {/if}
            {/foreach}
        {/if}

