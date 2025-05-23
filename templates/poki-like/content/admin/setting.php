<div class="gamemonetize-main-headself">
	<i class="fa fa-cog"></i>
</div>
<div class="general-box _yt10 _yb10 _0e4">
	<form id="adminsetting-form" enctype="multipart/form-data" method="POST" autocomplete="off">
		<div class="g-d5" style="display:inherit;width:100%;">
			<div class="r05-t _b-r _5e4">
				<span class="_tr5 _yt5 color-grey">@site_name@</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/name.png">
					<input class="_text-input" type="text" name="ss_sitename" value="{{CONFIG_SITE_NAME}}">
				</div>
				<span class="_tr5 _yt5 color-grey">@site_desc@</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/description.png">
					<input class="_text-input" type="text" name="ss_sitedescription" value="{{CONFIG_SITE_DESCRIPTION}}">
				</div>
				<span class="_tr5 _yt5 color-grey">@site_keywords@</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/tag.png">
					<input class="_text-input" type="text" name="ss_sitekeywords" value="{{CONFIG_SITE_KEYWORDS}}">
				</div>
				<span class="_tr5 _yt5 color-grey">@site_url@</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/url.png">
					<input class="_text-input" type="text" name="ss_siteurl" value="{{CONFIG_SITE_URL}}">
				</div>
				<span class="_tr5 _yt5 color-grey">Recaptcha Site Key</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/url.png">
					<input class="_text-input" type="text" name="ss_sitekey" value="{{CONFIG_RECAPTCHA_SITE_KEY}}">
				</div>
				<span class="_tr5 _yt5 color-grey">Recaptcha Secret Key</span>
				<div class="_input-box">
					<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/url.png">
					<input class="_text-input" type="text" name="ss_secretkey" value="{{CONFIG_RECAPTCHA_SECRET_KEY}}">
				</div>
				<div class="g-d5">
					<div class="r05-t _b-r _5e4">
						<div class="_yt10">
							<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/theme.png" width="20">
							<span class="_tr5 color-grey">@site_template@</span>
							<select name="ss_sitetheme" class="_p4s8">
								{{SETTING_GET_THEMES}}
							</select>
						</div>
						<!-- <div class="_yt10">
							<div class="_a6">
								<label>
									<img src="{{CONFIG_THEME_PATH}}/image/icon-color/admin/ads.png" width="20">
									<span class="_tr5 color-grey">Cookie Consent</span>
									<input type="checkbox" name="ss_ads" {{SETTING_ADS_CHECKED}}>
								</label>
							</div>
						</div> -->
						<div class="_yt10">
							<button id="generateSitemapButton" type="button" class="btn-p btn-p1">Generate Sitemap</button>
							<a href="{{SITEMAP_XML_LINK}}" target="_blank">Sitemap XML</a>
							<a href="{{RSS_FEED_LINK}}" target="_blank"><i class="fa fa-rss icon-middle"></i></a>
						</div>
					</div>
					<!-- <div class="r05-t _b-r _5e4">
						<p>Game Description</p>
						<p>This option allows you to download all game descriptions and upload them to Google as a document. Additionally, it can translate your website into different languages! <a href="https://translate.google.com/?sl=auto&tl=en&op=docs" target="_blank">Translate with google</a></p>
						<div class="_yt10">
							<a class="btn-p btn-p1" href="/admin/gameDescriptionDownload" target="_blank">Download Game Description</a>
						</div>
						<div class="_yt10">
							<input type="file" id="gameDescriptionFile">
							<button id="uploadGameDescriptionButton" type="button" class="btn-p btn-p1">Upload Game Description</button>
						</div>
					</div> -->
				</div>

			</div>
		</div>
		<div class="_a-r _5e4 _b-t">
			<button type="submit" class="btn-p btn-p1">
				<i class="fa fa-check icon-middle"></i>
				@save@
			</button>
		</div>
	</form>
</div>
<div class="settings">
	{{NEWS}}
</div>