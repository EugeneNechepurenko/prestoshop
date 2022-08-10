<ul class="product-navigation row no-pad clearfix">
	<li class="">
	{if $prev_product}
		<a title="{l s='Previous product: '}{$prev_product.name}" class="btn-link-well left_side" href="{$link->getProductLink($prev_product.id_product, $prev_product.link_rewrite)}"><i class="arrow left"></i></a>
	{/if}
	</li>
	<li class="">
	{if $next_product}
		<a title="{l s='Next product: '}{$next_product.name}" class="btn-link-well right_side" href="{$link->getProductLink($next_product.id_product, $next_product.link_rewrite)}"><i class="arrow right"></i></a>
	{/if}
	</li>
</ul>