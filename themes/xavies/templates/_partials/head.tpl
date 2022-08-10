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
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
            <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
      {/foreach}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

<script>
    function set_cookie(name, value) {
        document.cookie = name +'='+ value +'; Path=/;';
    }
    function delete_cookie(name) {
        document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }

    let tmp_arr = document.cookie.split('; ');
    let tmp_val = false;
    let win_width1 = false;
    let win_width2 = false;
    let tmp_string_arr = '';
    for(let i = 0; i < tmp_arr.length; i++){
        tmp_string_arr = tmp_arr[i].split('=');
        if(tmp_string_arr[0] === 'window_outerWidth'){
            win_width1 = tmp_string_arr[1];
            tmp_val = tmp_string_arr[1];
        }
        if(tmp_string_arr[0] === 'window_innerWidth'){
            win_width2 = tmp_string_arr[1];
        }
    }
    delete_cookie('window_outerWidth');
    delete_cookie('window_innerWidth');
    delete_cookie('window_outerHeight');
    delete_cookie('devicePixelRatio');
    set_cookie('window_outerWidth',window.outerWidth);
    set_cookie('window_innerWidth',window.innerWidth);
    set_cookie('window_outerHeight',window.outerHeight);
    set_cookie('devicePixelRatio',devicePixelRatio);

    // document.cookie ='window_outerWidth='+window.outerWidth+'; '+document.cookie;
    // document.cookie ='window_innerWidth='+window.innerWidth+'; '+document.cookie;
    // document.cookie ='window_outerHeight='+window.outerHeight+'; '+document.cookie;
    // document.cookie ='devicePixelRatio='+devicePixelRatio+'; '+document.cookie;
    // alert("win_width1 = " + win_width1 + "\n" +
    //         "window.outerWidth = " + window.outerWidth + "\n" +
    //         "win_width2 = " + win_width2 + "\n" +
    //         "window.innerWidth = " + window.innerWidth + "\n"
    // );
    if(tmp_val === false){
        // alert('change - reload');
        location.reload();
    }else if(window.outerWidth !== parseInt(win_width1) || window.innerWidth !== parseInt(win_width2)){
        location.reload();
    }
    // alert(
    //         "devicePixelRatio - " + devicePixelRatio + "\n" +
    //         "window_outerWidth - " + window.outerWidth + "\n" +
    //         "window_outerHeight - " + window.outerHeight + "\n" +
    //         "document.cookie - " + document.cookie + "\n" +
    //         "window.navigator.userAgent - " + window.navigator.userAgent + "\n" +
    //         "");

</script>

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}

<meta name="facebook-domain-verification" content="sntocz1it9864vupaigrfb2ykso8cj" />

<!-- Start of Async Drift Code -->
<script>
"use strict";

!function() {
var t = window.driftt = window.drift = window.driftt || [];
if (!t.init) {
if (t.invoked) return void (window.console && console.error && console.error("Drift snippet included twice."));
t.invoked = !0, t.methods = [ "identify", "config", "track", "reset", "debug", "show", "ping", "page", "hide", "off", "on" ],
t.factory = function(e) {
return function() {
var n = Array.prototype.slice.call(arguments);
return n.unshift(e), t.push(n), t;
};
}, t.methods.forEach(function(e) {
t[e] = t.factory(e);
}), t.load = function(t) {
var e = 3e5, n = Math.ceil(new Date() / e) * e, o = document.createElement("script");
o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous", o.src = "https://js.driftt.com/include/" + n + "/" + t + ".js";
var i = document.getElementsByTagName("script")[0];
i.parentNode.insertBefore(o, i);
};
}
}();
drift.SNIPPET_VERSION = '0.3.1';
drift.load('zf7g53hvf2wu');
</script>
<!-- End of Async Drift Code -->


<!-- Google Tag Manager -->
{literal}
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5457DS8');</script>
{/literal}
<!-- End Google Tag Manager -->

<!-- LinkedIn -->
<script type="text/javascript">
{literal}
_linkedin_partner_id = "2147514";
window._linkedin_data_partner_ids = window._linkedin_data_partner_ids || [];
window._linkedin_data_partner_ids.push(_linkedin_partner_id);
{/literal}
</script>
<script type="text/javascript">
{literal}
(function(){var s = document.getElementsByTagName("script")[0];
var b = document.createElement("script");
b.type = "text/javascript";b.async = true;
b.src = "https://snap.licdn.com/li.lms-analytics/insight.min.js";
s.parentNode.insertBefore(b, s);})();
{/literal}
</script>
<noscript>
<img height="1" width="1" style="display:none;" alt="" src="https://px.ads.linkedin.com/collect/?pid=2147514&fmt=gif" />
</noscript>


<!-- Facebook Pixel Code -->
<script>
{literal}
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1054840601611161');
fbq('track', 'PageView');
{/literal}
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1054840601611161&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->


<!-- Hotjar Tracking Code for www.xavies.be -->
<script>
{literal}
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:794708,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
{/literal}
</script>


