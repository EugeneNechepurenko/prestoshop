<ul class="recipe_navigation row no-pad clearfix">
	<li class="">
	{if $prev_recipe}
		<a title="{$prev_recipe.meta_title}" class="btn-link-well left_side" href="{$link->getCMSLink($prev_recipe.id_cms, $prev_recipe.link_rewrite)}"><i class="arrow left"></i></a>
	{/if}
	</li>
	<li class="">
	{if $next_recipe}
		<a title="{$next_recipe.meta_title}" class="btn-link-well right_side" href="{$link->getCMSLink($next_recipe.id_cms, $next_recipe.link_rewrite)}"><i class="arrow right"></i></a>
	{/if}
	</li>
</ul>
