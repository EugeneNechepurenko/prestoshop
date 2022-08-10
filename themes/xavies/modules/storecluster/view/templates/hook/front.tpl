{*
*  Store Cluster module
*
*  @author    W3B Solutions <info@w3bsolutions.es>
*  @copyright 2016-2020
*  @license   private license
*}

<style>
    section.page-stores {
        position: relative;
    }

    #store-search :invalid {
        border: .1875rem solid red;
    }

    .store_category {
        padding: 3px 5px; 
        background: darkgray; 
        color: white; 
        border-radius: 3px; 
        display: inline-block; 
        margin: 3px 3px 3px 0;
    }

    .country-input {
        position: absolute;
        right: 42px;
        z-index: 10;
        top: 10px;
    }

    .country-input select {
        height: 40px !important;
    }

    .slidecontainer {
        padding: 10px 0;
    }

    .slider {
        -webkit-appearance: none;
        width: 100%;
        height: 15px;
        border-radius: 5px;   
        background: #d3d3d3;
        outline: none;
        opacity: 0.7;
        -webkit-transition: .2s;
        transition: opacity .2s;
    }

    .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 25px;
        height: 25px;
        border-radius: 50%; 
        background: #2592a9;
        cursor: pointer;
    }

    .slider::-moz-range-thumb {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        background: #2592a9;
        cursor: pointer;
    }

    .slidecontainer.disabled {
        pointer-events: none;
    }

    .slidecontainer.disabled .slider::-webkit-slider-thumb {
        background: #d3d3d3 !important;
    }

    .slidecontainer.disabled .slider::-moz-range-thumb {
        background: #d3d3d3 !important;
    }

    #content > article.store-item {
        display: none;
    }

</style>
<div class="country-input col-sm-3 pull-right">
    <select name="country" id="countrySelect" class="form-control">
        <option value="">--</option>
            {foreach $countries as $country}
                <option value="{$country.id|escape:'htmlall':'UTF-8'}">{$country.name|escape:'htmlall':'UTF-8'}</option>
            {/foreach}
    </select>
</div>
<form action="" id="store-search">
    <p class="store-title">
        <strong class="dark">
            {l s='Enter a location (e.g. zip/postal code, address, city or country) in order to find the nearest stores.' mod='storecluster'}
        </strong>
    </p>
    <div class="store-content row">
        <div class="address-input col-sm-6">
            <label style="margin-right: 10px;">
                <input type="radio" name="byRadius" value="0" checked/>
                {l s='All stores' mod='storecluster'}
            </label>
            <label>
                <input type="radio" name="byRadius" value="1" />
                {l s='Your location:' mod='storecluster'}
            </label>
            <input class="form-control grey" type="text" name="location" id="addressInput" disabled
                placeholder="{l s='Address, zip / postal code, city, state or country' mod='storecluster'}" />
        </div>
        <div class="radius-input col-sm-6" style="margin-bottom: 5px;">
            <label style="margin-right: 5px;">
                {l s='Radius:' mod='storecluster'} <span id="radius-value">10</span> {$distanceUnit|escape:'htmlall':'UTF-8'}
            </label>
            <div class="slidecontainer disabled">
                <input type="range" min="1" max="100" value="10" class="slider" id="radius" disabled />
            </div>
        </div>
        {if isset($categories) && $categories}
            <div class="category-input col-sm-6">
                <label for="categorySelect">{l s='Category:' mod='storecluster'}</label>
                <select name="category" id="categorySelect" class="form-control">
                    <option value="">--</option>
                    {foreach $categories as $category}
                        <option value="{$category.id|escape:'htmlall':'UTF-8'}">{$category.name|escape:'htmlall':'UTF-8'}</option>
                    {/foreach}
                </select>
            </div>
        {/if}
        {if isset($tags) && $tags}
            <div class="tags-input col-sm-6">
                <label for="tagSelect">{l s='Tag:' mod='storecluster'}</label>
                <select name="tag" id="tagSelect" class="form-control">
                    <option value="">--</option>
                    {foreach $tags as $tag}
                        <option value="{$tag.id|escape:'htmlall':'UTF-8'}">{$tag.name|escape:'htmlall':'UTF-8'}</option>
                    {/foreach}
                </select>
            </div>
        {/if}
    </div>
        <input type="submit" name="search_locations"
                class="button btn btn-primary btn-block custom_btn" value="{l s='Search' mod='storecluster'}" />
</form>
<p id="search-results" style="text-align:center;"></p>
<div id="stores-table"></div>
<div id="map" style="min-height: 500px; margin-bottom: 10px;"></div>