{if $MENU != ''}
	<div class="toppanel__menu">
		<span class="cat-title">{l s="Menu" mod="blocktopmenu"}</span>
		<ul class="toppanel__menu-list">
			{$MENU}
			{if $MENU_SEARCH}
				<li class="sf-search noBack">
					<form id="searchbox" action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="get">
						<p>
							<input type="hidden" name="controller" value="search" />
							<input type="hidden" value="position" name="orderby"/>
							<input type="hidden" value="desc" name="orderway"/>
							<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'html':'UTF-8'}{/if}" />
						</p>
					</form>
				</li>
			{/if}
			<li>
				<a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}" title="{l s='Contact us' mod='blockcontact'}">{l s='Contact us' mod='blockcontact'}</a>
			</li>
			<li>
				{if count($languages) > 1}
					<div id="languages-block-top" class="languages-block">
						{foreach from=$languages key=k item=language name="languages"}
							{if $language.iso_code == $lang_iso}
								<div class="current">
									<span>{$language.name|regex_replace:"/\s\(.*\)$/":""}</span>
								</div>
							{/if}
						{/foreach}
						<ul id="first-languages" class="languages-block_ul toogle_content">
							{foreach from=$languages key=k item=language name="languages"}
								{if $language.iso_code != $lang_iso}
									<li {if $language.iso_code == $lang_iso}class="selected"{/if}>
									
										{assign var=indice_lang value=$language.id_lang}
										{if isset($lang_rewrite_urls.$indice_lang)}
											<a href="{$lang_rewrite_urls.$indice_lang|escape:'html':'UTF-8'}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">
										{else}
											<a href="{$link->getLanguageLink($language.id_lang)|escape:'html':'UTF-8'}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">
										{/if}
									
										<span>{$language.name|regex_replace:"/\s\(.*\)$/":""}</span>
											{if $language.iso_code != $lang_iso}
												</a>
											{/if}
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				{/if}
				<!-- /Block languages module -->
			</li>
		</ul><!--/.toppanel__menu -->
	</div><!--/.toppanel -->
{/if}