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
    {hook h='displaySlider'}
<h1>
    {if isset($prestablog_title_h1)}
		{$prestablog_title_h1|escape:'htmlall':'UTF-8'}<br>
    {/if}
	
    {if $prestablog_config.prestablog_catnews_shownbnews==1}

    <span>{l s='BLOG' mod='prestablog'}</span>
  {/if}
</h1>
{if sizeof($news)}
{*
<div class="subscribe_container">
    <a class="close_subscribe">X</a>
    <div class="blog_subscribe_description">
        <p>{l s='SCHRIJF JE IN OP ONZE BLOG EN ONTVANG ONZE NIEUWSTE ARTIKELS IN JOUW MAILBOX!' d='Custom'}</p>
    </div>
    <div class="blog_subscribe_form">
        {hook h='displayNavFullWidth' mod='ps_emailsubscription'}
    </div>
</div>
*}

 {*include file="$prestablog_pagination"*}

	{if $prestablog_config.prestablog_article_page==1}
		<ul id="blog_list_1-7" class="one_article">
    {else if $prestablog_config.prestablog_article_page==2}
        <ul id="blog_list_1-7" class="two_article">
    {else if $prestablog_config.prestablog_article_page==3}
        <ul id="blog_list_1-7" class="three_article">
    {/if}

    {foreach from=$news item=news_item name=NewsName}
        <li class="blog-grid">
            <div class="block_cont">
                <div class="block_top">
                {if isset($news_item.image_presente)}
                    <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">
                        <img src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$news_item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" alt="{$news_item.title|escape:'htmlall':'UTF-8'}" />
                    </a>
                {/if}
                </div>
                <div class="block_bas">
                    <h3>
                        <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" title="{$news_item.title|escape:'htmlall':'UTF-8'}">{$news_item.title|escape:'htmlall':'UTF-8'}</a>
						<br /><span class="date_blog-cat">{l s='Published :' mod='prestablog'}
                            {dateFormat date=$news_item.date full=0}
							{if $prestablog_config.prestablog_author_actif}
								{if $prestablog_config.prestablog_author_cate_actif}
									{foreach from=$news_item.authors item=author key=key name=current}
									
										{if $key=="firstname"}
											{$firstname = $author}
										{/if}
										{if $key=="pseudo"}
											{$pseudo = $author}
										{/if}

									{/foreach}
									{if $firstname}
															-
										{l s='By' mod='prestablog'}
									{/if}
									<a href="{PrestaBlogUrl au=$news_item.author_id titre={$firstname|escape:'htmlall':'UTF-8'}}">{$firstname|escape:'htmlall':'UTF-8'}</a>
								{/if}
							{/if}

                            {if sizeof($news_item.categories)} | {l s='Categories :' mod='prestablog'}
                                {foreach from=$news_item.categories item=categorie key=key name=current}
                                    <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}" class="categorie_blog">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
                                    {if !$smarty.foreach.current.last},{/if}
                                {/foreach}
                            {/if}</span>


							{if $prestablog_config.prestablog_rating_actif}
                             <div class="star_content">
								{section name="i" start=0 loop=5 step=1}
									{if $smarty.section.i.index lt $news_item.average_rating}
										<div class="material-icons checked">star</div>
									{elseif $news_item.average_rating == 5}
										<div class="material-icons checked">star</div>
									{else}
										<div class="material-icons">star</div>
									{/if}
								{/section}
							</div>
				{/if}

                    </h3>
                     {if $news_item.paragraph_crop!=''}
                         <p class="prestablog_desc">
                            {$news_item.paragraph_crop|escape:'htmlall':'UTF-8'}
                        </p>
                     {/if}
                    <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}" class="blog_link">{l s='Read more' mod='prestablog'}</a>

                </div>
                   
                        <div class="prestablog_more">
                            {if $prestablog_config.prestablog_comment_actif==1}
                                <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment" class="comments"><i class="material-icons">comment</i>  {$news_item.count_comments|intval}</a>
                            {/if}
							{if $prestablog_config.prestablog_read_actif}
								<span><i class="material-icons">remove_red_eye</i> {$news_item.read}</span>
							{/if}
                            {if $prestablog_config.prestablog_commentfb_actif==1}
                                <a
                                    href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment"
                                    id="showcomments{$news_item.id_prestablog_news|intval}"
                                    class="comments"
                                    data-commentsurl="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                                    data-commentsidnews="{$news_item.id_prestablog_news|intval}"
                                    ><i class="material-icons">comment</i> {$news_item.count_comments|intval}
                                </a>
                            {/if}
						</div>
                    
              </div>
        </li>
    {/foreach}
    </ul>
    {include file="$prestablog_pagination"}

{else}
    <p class="warning">{l s='Empty' mod='prestablog'}</p>

{/if}

<!-- /Module Presta Blog -->

