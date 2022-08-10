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
{**************
{foreach from=$steps item="step" key="index"}
  {render identifier  =  $step.identifier
          position    =  ($index + 1)
          ui          =  $step.ui
  }
{/foreach}
***************
*}

{*
{foreach from=$steps item="step" key="index"}
{if $step.is_current}
	<h1 class="step-title h3">{$step.title}</h1>
{/if}
{/foreach}

<ul class="nav nav-tabs_ nav-wizard order-steps" id="checkout_tabs" role="tablist">
    {foreach from=$steps item="step" key="index"}
		{if $index>0}
        <li class="nav-item {if $step.is_current}selected{/if} {if $next}next{/if}">
			{if $step.is_current}
				{assign var="next" value=1}
			{else}
				{assign var="next" value=0}
			{/if}	
            {if $step.is_reacheable}
                <a class="{if $step.is_current}active{/if} nav-link" id="{$step.identifier}-tab" data-toggle="tab" href="#{$step.identifier}" role="tab" aria-controls="{$step.identifier}" aria-selected="{if $step.is_current}true{else}false{/if}"><span><span class="hidden-sm-down">{$index + 1}</span> {$step.title}<i></i></span></a>
            {else}
                <span class="nav-link"><span class="hidden-sm-down">{$index + 1}</span> {$step.title}<i></i></span>
            {/if}
        </li>
		{/if}
    {/foreach}
</ul>
*}

<div class="tab-content" id="myTabContent">
    {foreach from=$steps item="step" key="index"}
		{if $index>0}
        <div class="tab-pane fade  {if $step.is_current}show in is_current active{/if}" id="{$step.identifier}" role="tabpanel" aria-labelledby="{$step.identifier}-tab">
            {render identifier  =  $step.identifier
            position    =  ($index + 1)
            ui          =  $step.ui
            }
        </div>
		{/if}
    {/foreach}
</div>
