<?php
if (!empty($_GET['tag'])) {
	$get_tags_id = secureEncode($_GET['tag']);
	$themeData['new_game_page'] = "games";
	$sql_tag_query = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE url='" . $get_tags_id . "'");
	if ($sql_tag_query->num_rows > 0) {
		$get_tags = $sql_tag_query->fetch_array();
		$sql_c_games_query = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE tags_ids LIKE '%\"{$get_tags['id']}\"%' AND published = '1' ORDER BY featured DESC limit 50");
		
		if ($config['site_theme'] == 'poki-like') {
			$sql_c_games_query = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE tags_ids LIKE '%\"{$get_tags['id']}\"%' AND published = '1' ORDER BY featured DESC limit 89");
		}
		
		$themeData['tags_name'] = ucwords($get_tags['name']);
		if ($sql_c_games_query->num_rows > 0) {
			$ctgm_r = '';
			$ids = '';
			while ($tag_games = $sql_c_games_query->fetch_array()) {
				$get_game_data = gameData($tag_games);
				$themeData['tags_game_name'] = $get_game_data['name'];
				$themeData['tags_game_url'] = $get_game_data['game_url'];
				$themeData['tags_game_image'] = $get_game_data['image_url'];

				preg_match("/\/([a-zA-Z0-9]+)\//", $get_game_data['image_url'], $matches);
				$baseImagePath = $_SERVER['DOCUMENT_ROOT'] . '/games-image/' . $matches[1] . '/250x150.webp';
				if (file_exists($baseImagePath)) {
					$themeData['tags_game_image'] = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseImagePath);
				} else {
					$themeData['tags_game_image'] = $get_game_data['image_url'];
				}

				$themeData['tags_game_rating'] = $tag_games['rating'];
				$themeData['tags_game_video_url'] = $tag_games['video_url'];
				$themeData['tags_game_wt_video'] = $tag_games['wt_video'];

				preg_match('/([^\/]+\.mp4)$/', $tag_games['wt_video'], $matches);
				$baseVideoThumbPath = $_SERVER['DOCUMENT_ROOT'] . '/games-thumb-video/' . $matches[1];
				if (file_exists($baseVideoThumbPath)) {
					$themeData['tags_game_wt_video'] = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseVideoThumbPath);
				} else {
					$themeData['tags_game_wt_video'] = $tag_games['wt_video'];
				}

				$ctgm_r .= \GameMonetize\UI::view('category/tags-games-list');

				$ids .= $tag_games['game_id'] . ',';
			}
			$themeData['tags_games_list'] = $ctgm_r;
		} else {
			$themeData['tags_games_list'] = \GameMonetize\UI::view('category/category-games-notfound');
		}
		$themeData['tagsid'] = $get_tags['id'];

		$themeData['new_game_ids'] .= rtrim($ids, ',');
		$themeData['footer_description'] = htmlspecialchars_decode($get_tags['footer_description']);

		$footer_description = htmlspecialchars_decode($get_tags['footer_description']);
		$footer_description = preg_replace('/<h[1-6][^>]*>.*?<\/h[1-6]>/i', '', $footer_description);

		// Pisahkan berdasarkan tag <br> atau baris kosong (\n)
		$paragraphs = preg_split('/(<br\s*\/?>|\n)/i', $footer_description, -1, PREG_SPLIT_NO_EMPTY);
		
		// Cek apakah terdapat paragraf yang tidak kosong
		$filtered_paragraphs = array_filter($paragraphs, 'trim');

		// Pastikan ada paragraf yang bisa diambil
		if (!empty($filtered_paragraphs)) {
			// Ambil paragraf pertama yang tidak kosong
			$header_desc = array_shift($filtered_paragraphs);

			// Gabungkan sisa paragraf menjadi footer_desc_modified
			$footer_desc_modified = implode('<br>', $filtered_paragraphs);
		} else {
			// Jika tidak ada paragraf, maka biarkan kosong
			$header_desc = '';
			$footer_desc_modified = $footer_description;
		}

		// Assign ke themeData
		$themeData['header_desc'] = $header_desc;
		$themeData['footer_description_modified'] = $footer_desc_modified;


		$themeData['tags_content'] = \GameMonetize\UI::view('category/tags-games');
	} else {
		$themeData['tags_content'] = \GameMonetize\UI::view('category/category-notfound');
	}
} else {
	$sql_tag_query = $GameMonetizeConnect->query("SELECT * FROM " . TAGS);
	$ct_r = '';
	while ($tags = $sql_tag_query->fetch_array()) {
		$themeData['tags_id'] = $tags['id'];
		$themeData['tags_name'] = $tags['name'];

		$baseTagImagePath = 'tag-img/' . slugify($tags['name']);
		$formats = ['.png', '.webp'];
		$defaultTagImagePath = 'templates/poki-like/image/tag.png';

		$themeData['tags_thumb'] = $defaultTagImagePath; // Default value

		foreach ($formats as $format) {
			if (file_exists($baseTagImagePath . $format)) {
				$themeData['tags_thumb'] = $baseTagImagePath . $format;
				break;
			}
		}
		
		$numbergames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES . " where tags_ids LIKE '%\"{$get_tags['id']}\"%'");
		$numbergames = $numbergames->fetch_array()[0];

		$themeData['tags_number'] = $numbergames;
		$themeData['tags_url'] = siteUrl() . '/tag/' . slugify($tags['name']);
		$ct_r .= \GameMonetize\UI::view('category/tags-list');
	}

	/*
		$countactiongames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=1");
		$countactiongames = $countactiongames->fetch_array()[0];

		$countracinggames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=2");
		$countracinggames = $countracinggames->fetch_array()[0];

		$countshootinggames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=3");
		$countshootinggames = $countshootinggames->fetch_array()[0];

		$countarcadegames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=4");
		$countarcadegames = $countarcadegames->fetch_array()[0];

		$countpuzzlegames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=5");
		$countpuzzlegames = $countpuzzlegames->fetch_array()[0];

		$countmultiplayergames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=7");
		$countmultiplayergames = $countmultiplayergames->fetch_array()[0];

		$countsportsgames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=8");
		$countsportsgames = $countsportsgames->fetch_array()[0];

		$countfightinggames = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES ." where category=9");
		$countfightinggames = $countfightinggames->fetch_array()[0];

		$themeData['categories_list'] = $ct_r;

		$themeData['count_action_games'] = $countactiongames;
		$themeData['count_racing_games'] = $countracinggames;
		$themeData['count_shooting_games'] = $countshootinggames;
		$themeData['count_arcade_games'] = $countarcadegames;
		$themeData['count_puzzle_games'] = $countpuzzlegames;
		$themeData['count_multiplayer_games'] = $countmultiplayergames;
		$themeData['count_sports_games'] = $countsportsgames;
		$themeData['count_fighting_games'] = $countfightinggames;
		*/
	$themeData['categories_list'] = $ct_r;
	$themeData['tags_content'] = \GameMonetize\UI::view('game/tags');
}
$themeData['page_content'] = \GameMonetize\UI::view('category/tags-content');
