{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames} {block name='additional_body_class'}{/block}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main>
      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}

      <header id="header">
        {block name='header'}
          {include file='_partials/header.tpl'}
        {/block}
      </header>

      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      <section id="wrapper">
        {hook h="displayWrapperTop"}
        <div class="container">
          {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
          {/block}

          {block name="left_column"}
{*            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3 hide_filters">*}
            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
                {if $page.page_name == 'product'}
                {hook h='displayLeftColumnProduct'}
              {elseif   $page.page_name == 'category' ||
                        $page.page_name == 'search' ||
                        $page.page_name == 'new-products' ||
                        $page.page_name == 'best-sales'
              }
                  {if $page.page_name == 'search'}
                      {hook h="displayLeftColumn"}
                  {else}
                      {hook h="displayLeftColumn" mod="amazzingfilter"}
                  {/if}
                  <p class="side_filter_title">{l s='filter' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
                  <p class="side_filter_title_close">{l s='filter' d='Shop.Theme.Catalog'}<a>&lt;</a></p>
              {else}
                {hook h="displayLeftColumn"}
              {/if}
            </div>
          {/block}

          {block name="content_wrapper"}
            <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
              {hook h="displayContentWrapperTop"}
              {block name="content"}
                <p>Hello world! This is HTML5 Boilerplate.</p>
              {/block}
              {hook h="displayContentWrapperBottom"}
            </div>
          {/block}

          {block name="right_column"}
            <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
              {if $page.page_name == 'product'}
                {hook h='displayRightColumnProduct'}
              {else}
                {hook h="displayRightColumn"}
              {/if}
            </div>
          {/block}
        </div>
        {hook h="displayWrapperBottom"}
      </section>

      <footer id="footer">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>

    </main>

    {if $page.page_name == 'index' || $page.page_name == 'category'}
        <style>
            .home_buy_product_popup {
                display: block;
                position: fixed;
                /*top: 50%;*/
                /*left: 50%;*/
                top: calc(50% - 205px);
                left: calc(50% - 823px / 2);
                /* transform: translate(-50%, -50%);*/
                background: #FFFFFF;
                border-radius: 10px;
                padding: 48px 115px 44px 115px;
                min-width: 823px;
                min-height: 405px;
            }

            .home_buy_product_popup .close_popup {
                display: block;
                position: absolute;
                right: 30px;
                top: 28px;
                line-height: 1;
            }

            .home_buy_product_popup form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .home_buy_product_popup form .h2 {
                font: normal normal normal 25px/18px Raleway;
                letter-spacing: 0px;
                color: #000000;
                text-transform: none;
                margin: 0;
                margin-bottom: 21px;
            }

            .home_buy_product_popup form .h4 {
                font: normal normal normal 18px/18px Raleway;
                letter-spacing: 0px;
                color: #000000;
                margin: 0;
                margin-bottom: 41px;
            }

            .home_buy_product_popup form .h4 strong {
                font: normal normal bold 18px/18px Raleway;
            }

            .home_buy_product_popup form select {
                border: 2px solid #FAD262;
                background: #FFFFFF;
                display: block;
                position: relative;
                min-height: 49px;
                min-width: 210px;
                margin-bottom: 15px;
                font: normal normal normal 20px/23px Arial;
                letter-spacing: 0px;
                color: #000000;
                padding-left: 6px;
            }

            .home_buy_product_popup form .buy_btn {
                background: #EE4858 0% 0% no-repeat padding-box;
                border-radius: 5px;
                font: normal normal bold 20px/12px Arial;
                letter-spacing: 0px;
                color: #FFFFFF;
                border: none;
                margin-top: 8px;
                padding: 7px;
                min-width: 212px;
                min-height: 33px;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .home_buy_product_popup form .reset_btn {
                background: #FAD262 0% 0% no-repeat padding-box;
                border-radius: 5px;
                font: normal normal bold 20px/12px Arial;
                letter-spacing: 0px;
                color: #FFFFFF;
                margin-top: 11px;
                padding: 7px;
                min-width: 212px;
                min-height: 33px;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
        <div class="home_buy_product_popup" style="display: none">
            <a class="close_popup">X</a>
            <form>

                <p class="h2">{l s='We voegen … dadelijk toe aan jouw winkelmandje!' d='Custom'}</p>
                <p class="h4">{l s='Kies enkel nog het <strong>gewicht</strong> en het <strong>aantal</strong> en klik nadien op ‘bevestigen’.' d='Custom'}</p>

                <select>
                    <option>{l s='300g I € 0,00' d='Custom'}</option>
                </select>
                <select>
                    <option>1</option>
                </select>
                <button class="buy_btn">{l s='BEVESTIGEN' d='Custom'}</button><a class="reset_btn">{l s='ANNULEREN' d='Custom'}</a>
            </form>
        </div>
    {/if}

    {block name='auth_help_popups'}
        {include file='customer/_partials/auth-help-popups.tpl'}
    {/block}
    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
