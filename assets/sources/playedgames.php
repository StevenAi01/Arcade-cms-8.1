<?php
$themeData['ads_header'] = getADS('728x90');
$themeData['ads_footer'] = getADS('300x250');
$themeData['ads_sidebar'] = getADS('600x300');

$date =  date('Ymdms');
$date = strtotime($date);
$themeData['cms'] = "<script src='https://api.gamemonetize.com/cms.js?" . $date . "'></script>";
# >>
$themeData['new_game_page'] = "played";

if (!isset($_COOKIE['playedgames'])) {
	$themeData['games_played'] = "<div class='category-section-top' style='text-align:center;font-size:20px;margin-bottom:10px;margin-top:20px;'>
		<i class='fa fa-chevron-right'></i></span><strong style='color:#fc0'>
You didn't play any game recently. Games you played will appear here.</strong>
</div>";

	$footer_description = getFooterDescription('played-games');
	$themeData['footer_description'] = isset($footer_description->description) ? htmlspecialchars_decode($footer_description->description): "";
	$themeData['new_games'] = \GameMonetize\UI::view('game/new-games');

	$themeData['page_content'] = \GameMonetize\UI::view('home/content');
} else {
	$themeData['played_games_css'] = "<style>.post {grid-area: auto !important;}</style>";
	$fav = explode(',,', $_COOKIE['playedgames']);
	$fav = array_filter($fav);
	$ngm_r = '';
	// remove empty values from $fav
	if (strlen($_COOKIE['playedgames']) > 0) {
		foreach ($fav as $game_id) {
			$resultset[] = $game_id;
		}
		$comma_separated = implode(",", $fav);
		$comma_separated = trim($comma_separated, ",");
		$newGames_query = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " where `game_id` IN (" . $comma_separated . ") order by date_added DESC LIMIT 100");

		while ($newGames = $newGames_query->fetch_array()) {
			$newGame_data = gameData($newGames);
			$themeData['new_game_url'] = $newGame_data['game_url'];
			preg_match("/\/([a-zA-Z0-9]+)\//", $newGame_data['image_url'], $matches);
			$baseImagePath = $_SERVER['DOCUMENT_ROOT'] . '/games-image/' . $matches[1] . '/250x150.webp';
			if (file_exists($baseImagePath)) {
				$themeData['new_game_image'] = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseImagePath);
			} else {
				$themeData['new_game_image'] = $newGame_data['image_url'];
			}
			$themeData['new_game_name'] = $newGame_data['name'];
			$themeData['new_game_rating'] = $newGames['rating'];
			$themeData['new_game_video_url'] = $newGames['video_url'];

			preg_match('/([^\/]+\.mp4)$/', $newGames['wt_video'], $matches);
			$baseVideoThumbPath = $_SERVER['DOCUMENT_ROOT'] . '/games-thumb-video/' . $matches[1];
			if (file_exists($baseVideoThumbPath)) {
				$themeData['new_game_wt_video'] = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseVideoThumbPath);
			} else {
				$themeData['new_game_wt_video'] = $newGames['wt_video'];
			}

			if ($config['site_theme'] == 'crazygames-like') {
				$ngm_r .= \GameMonetize\UI::view('game/list-each/new-games-list-1');
			} else {
				$ngm_r .= \GameMonetize\UI::view('game/list-each/new-games-list');
			}
		}
	}

	if ($config['site_theme'] == 'y8-like' || $config['site_theme'] == 'poki-like') {
		$sql_cat_query = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE show_home='1'");
		$ct_r = '';
		while ($category = $sql_cat_query->fetch_array()) {
			$themeData['category_id'] = $category['id'];
			$themeData['category_name'] = $category['name'];
			$themeData['category_image'] = $category['image'];

			$numbergames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES . " where category=" . $category['id']);
			$numbergames = $numbergames->fetch_array()[0];

			$themeData['category_number'] = $numbergames;
			$themeData['category_url'] = siteUrl() . '/category/'	. slugify($category['name']);
			$ct_r .= \GameMonetize\UI::view('category/categories-list-home');
		}

		$themeData['categories_list_home'] = $ct_r;
		$themeData['category_content'] = \GameMonetize\UI::view('category/categories-list-home');

		$sql_tag_query = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE show_home='1'");
		$tag_r = '';
		while ($tag = $sql_tag_query->fetch_array()) {
			$themeData['tag_id'] = $tag['id'];
			$themeData['tag_name'] = $tag['name'];

			$baseTagImagePath = 'tag-img/' . slugify($tag['name']);
			$formats = ['.png', '.webp'];
			$defaultTagImagePath = 'templates/poki-like/image/tag.png';

			$themeData['tag_image'] = $defaultTagImagePath; // Default value

			foreach ($formats as $format) {
				if (file_exists($baseTagImagePath . $format)) {
					$themeData['tag_image'] = $baseTagImagePath . $format;
					break;
				}
			}

			$themeData['tag_url'] = siteUrl() . '/tag/'	. slugify($tag['name']);
			$tag_r .= \GameMonetize\UI::view('tags/tags-list-home');
		}

		$themeData['tags_list_home'] = $tag_r;
	}


	// Get setting data
	$settingDataQuery = "SELECT * FROM " . SETTING . " LIMIT 1";
	$settingData = $GameMonetizeConnect->query($settingDataQuery);
	$settingData = $settingData->fetch_array();

	if ($settingData["is_sidebar_enabled"]) {
		$themeData['categories_tags_home'] = "";
	} else {
		$themeData['categories_tags_home'] = \GameMonetize\UI::view('home/categories-tags-home');
	}

	$footer_description = getFooterDescription('played-games');
	$themeData['footer_description'] = isset($footer_description->description) ? htmlspecialchars_decode($footer_description->description): "";

	$header_desc = '';
	$footer_desc_modified = '';
	$br_split = preg_split('/<br\s*\/?>/i', htmlspecialchars_decode($footer_description->description));

	// Simpan bagian pertama sebagai header_desc
	if (!empty($br_split[0])) {
		$header_desc = trim($br_split[0]); // Trim untuk menghapus spasi berlebih
	}

	// Jika ada lebih dari satu bagian, gabungkan sisanya menjadi footer_description
	if (count($br_split) > 1) {
		$footer_desc_modified = implode('<br>', array_map('trim', array_slice($br_split, 1))); // Gabungkan sisa bagian setelah <br> pertama
	}

	$themeData['header_desc'] = $header_desc;
	$themeData['footer_description_modified'] = $footer_desc_modified;
	
	$themeData['new_games_list'] = $ngm_r;
	$themeData['new_games'] = \GameMonetize\UI::view('game/new-games');

	$themeData['page_content'] = \GameMonetize\UI::view('home/content');
}