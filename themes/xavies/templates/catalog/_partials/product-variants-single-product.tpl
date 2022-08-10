
<div class="product-variants">
    <div class="clearfix product-variants-item">
        <select
          class="form-control form-control-select"
          id="group_single_product"
          name="group_single_product">
          <option value="1" title="{$product.name}" selected="selected">{$product.name}{if isset($product.price)}&nbsp;|&nbsp;{$product.price}{/if}</option>
        </select>
    </div>
</div>
