<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

$date =  date('Ymdms');
$date = strtotime($date);
$themeData['cms'] = "<script src='https://api.gamemonetize.com/cms.js?" . $date . "'></script>";

global $totalRowLength;

if (is_logged() && $userData['admin']) {

	$json = file_get_contents('https://api.gamemonetize.com/cms_admin.json?' . $date);
	$arr = json_decode($json, true);
	$domain = $_SERVER['HTTP_HOST'];
	$domain = preg_replace('#^(http(s)?://)?w{3}\.#', '$1', $domain);

	foreach ($arr['response']['games'] as $game) {
		if ($game['domain'] === $domain) {
			header("Location: https://gamemonetize.com?utm_source=blockedcms&domain=" . $domain);
			break;
		}
	}

	$date =  date('Ymdms');
	$date = strtotime($date);

	$themeData['news'] = '<div class="stats-box" style="width:100%;padding:10px;">
				<iframe style="min-height: 198px;" src="https://api.gamemonetize.com/cms.html?' . $date . '" width="100%" height="100%" scrolling="none" frameborder="0"></iframe>
				</div>';

	$navigation_menu_data = (isset($_GET['section'])) ? $_GET['section'] : 'global';
	$themeData['nav_menu_global'] = listMenu($navigation_menu_data, 'global');
	$themeData['nav_menu_addgame'] = listMenu($navigation_menu_data, 'addgame');
	$themeData['nav_menu_setting'] = listMenu($navigation_menu_data, 'setting');
	$themeData['nav_menu_games'] = listMenu($navigation_menu_data, 'games');
	$themeData['nav_menu_games_images_and_videos'] = listMenu($navigation_menu_data, 'games-images-and-videos');
	$themeData['nav_menu_categories'] = listMenu($navigation_menu_data, 'categories');
	$themeData['nav_menu_users'] = listMenu($navigation_menu_data, 'users');
	$themeData['nav_menu_ads'] = listMenu($navigation_menu_data, 'ads');
	$themeData['nav_menu_tags'] = listMenu($navigation_menu_data, 'tags');
	$themeData['nav_menu_footer_description'] = listMenu($navigation_menu_data, 'footerdescription');
	$themeData['nav_menu_blogs'] = listMenu($navigation_menu_data, 'blogs');
	$themeData['nav_menu_chatgpt'] = listMenu($navigation_menu_data, 'chatgpt');
	$themeData['nav_menu_links'] = listMenu($navigation_menu_data, 'links');
	$themeData['nav_menu_sliders'] = listMenu($navigation_menu_data, 'sliders');
	$themeData['nav_menu_sidebar'] = listMenu($navigation_menu_data, 'sidebar');
	$themeData['admin_navigation_menu'] = \GameMonetize\UI::view('admin/nav-menu');
	$themeData['sitemap_xml_link'] = siteUrl() . '/sitemap.xml';
	$themeData['rss_feed_link'] = siteUrl() . '/feed';
	if (!isset($_GET['section']) || $_GET['section'] == "global") {

		$gameplay = $GameMonetizeConnect->query("SELECT * FROM " . SETTING . " WHERE id='1'");
		$gameplay = $gameplay->fetch_array()[14];
		$themeData['admin_stats_games'] = getStats('games');
		$themeData['admin_stats_users'] = getStats('users');
		$themeData['admin_stats_categories'] = $gameplay;

		$getLastUser_registered = lastUser('registered', 4);
		$lsturgtd_r = '';
		foreach ($getLastUser_registered as $last_user) {
			$getInfo = getInfo($last_user['id']);
			$themeData['stats_user_avatar'] = getAvatar($last_user['avatar_id'], $getInfo['gender'], 'thumb');
			$themeData['stats_user_name'] = $last_user['name'];
			$themeData['stats_user_username'] = $last_user['username'];

			$lsturgtd_r .= \GameMonetize\UI::view('admin/stats-list-user');
		}
		$themeData['stats_last_user_registered_list'] = $lsturgtd_r;
		# >>

		$getLastUser_registered = lastUser('logged', 4);
		$lstulggd_r = '';
		foreach ($getLastUser_registered as $last_user) {
			$getInfo = getInfo($last_user['id']);
			$themeData['stats_user_avatar'] = getAvatar($last_user['avatar_id'], $getInfo['gender'], 'thumb');
			$themeData['stats_user_name'] = $last_user['name'];
			$themeData['stats_user_username'] = $last_user['username'];

			$lstulggd_r .= \GameMonetize\UI::view('admin/stats-list-user');
		}
		$themeData['stats_last_user_logged_list'] = $lstulggd_r;
		# >>

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/stats');
	} elseif (isset($_GET['section']) && $_GET['section'] == "addgame") {
		$addgame_category = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id!=0");
		$ctop_r = '';
		while ($select_category = $addgame_category->fetch_array()) {
			$ctop_r .= '<option value="' . $select_category['id'] . '">' . $select_category['name'] . '</option>';
		}
		$themeData['get_categories'] = $ctop_r;

		$addgame_tags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id!=0 ORDER BY name");
		$game_tags = '';
		while ($select_tags = $addgame_tags->fetch_array()) {
			$game_tags .= '<option value="' . $select_tags['id'] . '">' . $select_tags['name'] . '</option>';
		}
		$themeData['get_tags'] = $game_tags;

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/add-game');
	} elseif (isset($_GET['section']) && $_GET['section'] == "setting") {
		$settings = $GameMonetizeConnect->query("SELECT * FROM " . SETTING . " WHERE id='1'");
		$settings = $settings->fetch_array();
		$themeData['config_recaptcha_site_key'] = $settings['recaptcha_site_key'];
		$themeData['config_recaptcha_secret_key'] = $settings['recaptcha_secret_key'];

		$THEME_dir = opendir('templates/');
		$THEME_dr_array = array();
		while (false !== ($file = readdir($THEME_dir))) {
			$THEME_dr_array[] = $file;
		}
		closedir($THEME_dir);
		$thm_r = '';
		foreach ($THEME_dr_array as $file) {
			if ($file != "." && $file != ".." && $file != "Thumbs.db" && $file != ".DS_Store" && $file != "images") {
				if ($config['site_theme'] == $file) {
					$thm_r .= '<option value="' . $file . '" selected>' . $file . '</option>';
				} else {
					$thm_r .= '<option value="' . $file . '">' . $file . '</option>';
				}
			}
		}
		$themeData['setting_get_themes'] = $thm_r;
		# >>

		$LANG_dir = opendir('assets/language/');
		$LANG_dr_array = array();
		while (false !== ($file = readdir($LANG_dir))) {
			$LANG_dr_array[] = $file;
		}
		closedir($LANG_dir);
		$lng_r = '';
		foreach ($LANG_dr_array as $file) {
			if ($file != "." && $file != ".." && $file != "Thumbs.db" && $file != ".DS_Store" && $file != "images") {
				$val_file = str_replace('.php', '', $file);
				if ($config['language'] == $val_file) {
					$lng_r .= '<option value="' . $val_file . '" selected>' . $val_file . '</option>';
				} else {
					$lng_r .= '<option value="' . $val_file . '">' . $val_file . '</option>';
				}
			}
		}
		$themeData['setting_get_languages'] = $lng_r;
		# >>

		$themeData['setting_ads_checked'] = ($config['ads_status']) ? 'checked' : '';

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/setting');
	} elseif (isset($_GET['section']) && $_GET['section'] == "games") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			// Check game feed url
			$settings = $GameMonetizeConnect->query("SELECT * FROM " . SETTING . " WHERE id='1'");
			$settings = $settings->fetch_assoc();
			if (is_null($settings['custom_game_feed_url'])) {
				$themeData['custom_game_feed_url'] = 'https://gamemonetize.com/feed.php?format=0&num=30';
			} else {
				$themeData['custom_game_feed_url'] = $settings['custom_game_feed_url'];
			}

			$pageno = isset($_GET['page']) ? (int) $_GET['page'] : 1;
			$no_of_records_per_page = 102;
			$offset = ($pageno - 1) * $no_of_records_per_page;

			$result = $GameMonetizeConnect->query("SELECT COUNT(*) FROM " . GAMES);
			$total_pages = ceil($result->fetch_array()[0] / $no_of_records_per_page);

			$sql_global_games = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE game_id!=0 ORDER BY date_added DESC LIMIT $offset, $no_of_records_per_page");

			if ($sql_global_games->num_rows > 0) {
				$vgmsgbl_r = '';
				while ($global_games = $sql_global_games->fetch_array()) {
					$themeData['view_game_id'] = $global_games['game_id'];
					$themeData['view_game_name'] = $global_games['name'];
					if (strpos($global_games['image'], "http://") !== false || strpos($global_games['image'], "https://") !== false) {
						$themeData['view_game_image'] =   $global_games['image'];
					} else {
						$themeData['view_game_image'] = siteUrl() . $global_games['image'];
					}
					$themeData['view_game_featured'] = $global_games['featured'];
					$themeData['view_game_published'] = $global_games['published'];
					$themeData['view_published_class_status'] = ($global_games['published'] == 1) ? 'pub-active' : '';
					$themeData['view_featured_class_status'] = ($global_games['featured'] == 1) ? 'feat-active' : '';

					$vgmsgbl_r .= \GameMonetize\UI::view('admin/sections/view-games-list');
				}
				$themeData['view_games_list'] = $vgmsgbl_r;

				$themeData['view_games_pagination'] = '
					<ul class="pagination">
						<li><a href="' . siteUrl() . '/admin/games/1">First</a></li>
						<li class="' . (($pageno <= 1) ? 'disabled' : '') . '">
							<a href="' . siteUrl() . '/admin/games' . (($pageno <= 1) ? '#' : '/' . ($pageno - 1)) . '">Prev</a>
						</li>
						<li class="' . (($pageno >= $total_pages) ? 'disabled' : '') . '">
							<a href="' . siteUrl() . '/admin/games' . (($pageno >= $total_pages) ? '#' : '/' . ($pageno + 1)) . '">Next</a>
						</li>
						<li><a href="' . siteUrl() . '/admin/games/' . $total_pages . '">Last</a></li>
					</ul>
					';



				$themeData['games_container'] = \GameMonetize\UI::view('admin/sections/view-games-container');
			} else {
				$themeData['games_container'] = \GameMonetize\UI::view('admin/sections/view-games-notfound');
			}

			$themeData['games_section_content'] = \GameMonetize\UI::view('admin/sections/view-games-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['gid'])) {
			$get_game_id = secureEncode($_GET['gid']);
			$get_game = getGame($get_game_id);
			if ($get_game) {
				$themeData['edit_game_id'] = $get_game['game_id'];
				$themeData['edit_game_name_url'] = $get_game['game_name'];
				$themeData['edit_game_name'] = $get_game['name'];
				$themeData['edit_game_image'] = $get_game['image'];
				$themeData['edit_game_description'] = $get_game['description'];
				$themeData['edit_game_instructions'] = $get_game['instructions'];
				$themeData['edit_game_file'] = $get_game['file'];
				$themeData['edit_game_width'] = $get_game['w'];
				$themeData['edit_game_height'] = $get_game['h'];
				$themeData['edit_game_sorting'] = $get_game['featured_sorting'];
				$themeData['edit_game_type_swf_status'] = ($get_game['game_type'] == 'swf') ? 'selected' : '';
				$themeData['edit_game_type_other_status'] = ($get_game['game_type'] !== 'swf') ? 'selected' : '';

				$themeData['edit_game_rating_0'] = ($get_game['rating'] == 0) ? 'selected' : '';
				$themeData['edit_game_rating_0_5'] = ($get_game['rating'] == 0.5) ? 'selected' : '';
				$themeData['edit_game_rating_1'] = ($get_game['rating'] == 1) ? 'selected' : '';
				$themeData['edit_game_rating_1_5'] = ($get_game['rating'] == 1.5) ? 'selected' : '';
				$themeData['edit_game_rating_2'] = ($get_game['rating'] == 2) ? 'selected' : '';
				$themeData['edit_game_rating_2_5'] = ($get_game['rating'] == 2.5) ? 'selected' : '';
				$themeData['edit_game_rating_3'] = ($get_game['rating'] == 3) ? 'selected' : '';
				$themeData['edit_game_rating_3_5'] = ($get_game['rating'] == 3.5) ? 'selected' : '';
				$themeData['edit_game_rating_4'] = ($get_game['rating'] == 4) ? 'selected' : '';
				$themeData['edit_game_rating_4_5'] = ($get_game['rating'] == 4.5) ? 'selected' : '';
				$themeData['edit_game_rating_5'] = ($get_game['rating'] == 5) ? 'selected' : '';
				$themeData['edit_game_video_url'] = $get_game['video_url'];
				$themeData['edit_game_is_last_rewrite'] = "";
				if($get_game['is_last_rewrite'] == '1'){
					$themeData['edit_game_is_last_rewrite'] = "checked";
				}

				$addgame_category = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id!=0");
				$gcts_r = '';
				while ($select_category = $addgame_category->fetch_array()) {
					if ($get_game['category'] == $select_category['id']) {
						$gcts_r .= '<option value="' . $select_category['id'] . '" selected>' . $select_category['name'] . '</option>';
					} else {
						$gcts_r .= '<option value="' . $select_category['id'] . '">' . $select_category['name'] . '</option>';
					}
				}
				$themeData['edit_game_categories'] = $gcts_r;

				$game_tags = [];
				if ($get_game['tags_ids'] != 'null' && !is_null($get_game['tags_ids'])) {
					$game_tags = json_decode($get_game['tags_ids']);
				}
				$addgame_tags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id!=0");
				$tags_option = '';
				$tags_click_copy = '';
				while ($select_tags = $addgame_tags->fetch_array()) {
					if (in_array("{$select_tags['id']}", $game_tags)) {
						$tags_option .= '<option value="' . $select_tags['id'] . '" selected>' . $select_tags['name'] . '</option>';

						// Tags click copy
						$themeData['tags_url_copy'] = siteUrl() . "/tag/" . $select_tags['url'];
						$themeData['tags_name_copy'] = $select_tags['name'];
						$tags_click_copy .= \GameMonetize\UI::view('admin/sections/tags-click-copy');
					} else {
						$tags_option .= '<option value="' . $select_tags['id'] . '">' . $select_tags['name'] . '</option>';
					}
				}
				$themeData['edit_game_tags'] = $tags_option;
				$themeData['tags_click_to_copy'] = $tags_click_copy;

				$gameNameExplode = explode(' ', $get_game['name']);
				$firstName = substr($gameNameExplode[0], 0, 4);
				$secondName = substr($gameNameExplode[1], 0, 4);
				$threeRandomGame = array();

				// First word similar
				$first_name_click_copy = '';
				$sqlQuerySimilar = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$firstName}%' AND published='1' AND name != '{$get_game['name']}' ORDER BY name ASC LIMIT 10");
				if ($sqlQuerySimilar->num_rows > 0) {
					while ($similarGames = $sqlQuerySimilar->fetch_array()) {
						$themeData['tags_url_copy'] = siteUrl() . "/game/" . $similarGames['game_name'];

						$firstWordRandomGame = $threeRandomGame[0] = "<a href='{$themeData['tags_url_copy']}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						$themeData['tags_name_copy'] = $similarGames['name'];
						$first_name_click_copy .= \GameMonetize\UI::view('admin/sections/tags-click-copy');
					}
				}

				$themeData['first_word_click_to_copy'] = $first_name_click_copy;

				// Second word similar
				$second_name_click_copy = '';
				$sqlQuerySimilar = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$secondName}%' AND published='1' AND name != '{$get_game['name']}' ORDER BY name ASC LIMIT 10");
				if ($sqlQuerySimilar->num_rows > 0) {
					while ($similarGames = $sqlQuerySimilar->fetch_array()) {
						$themeData['tags_url_copy'] = siteUrl() . "/game/" . $similarGames['game_name'];
						$secondWordRandomGame = $threeRandomGame[1] = "<a href='{$themeData['tags_url_copy']}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						$themeData['tags_name_copy'] = $similarGames['name'];
						$second_name_click_copy .= \GameMonetize\UI::view('admin/sections/tags-click-copy');
					}
				}

				$themeData['second_word_click_to_copy'] = $second_name_click_copy;

				// Random word similar
				$oneRandomGame = "";
				$random_name_click_copy = '';
				$sqlQuerySimilar = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE  published='1' AND name != '{$get_game['name']}' ORDER BY RAND() LIMIT 10");
				if ($sqlQuerySimilar->num_rows > 0) {
					$index = 0;
					while ($similarGames = $sqlQuerySimilar->fetch_array()) {
						$themeData['tags_url_copy'] = siteUrl() . "/game/" . $similarGames['game_name'];
						$oneRandomGame = "<a href='{$themeData['tags_url_copy']}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						$themeData['tags_name_copy'] = $similarGames['name'];
						$random_name_click_copy .= \GameMonetize\UI::view('admin/sections/tags-click-copy');
						if ($index > 1) {
							$thirdRandomGame = siteUrl() . "/game/" . $similarGames['game_name'];
							$threeRandomGame[2] = "<a href='{$thirdRandomGame}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						}
						$index++;
					}
				}

				// Chatgpt template
				$chatgpt_query = $GameMonetizeConnect->query("SELECT * FROM " . CHATGPT . " WHERE id!=0");
				if ($chatgpt_query && $chatgpt_query->num_rows > 0) {
					$chatgpt_data = $chatgpt_query->fetch_assoc();

					$gameDescription = $get_game['description'];
					$gameTitle = $get_game['name'];
					if (!empty($game_tags)) {
						$beforeWordArray = explode(",", $chatgpt_data['random_words_before_tags']);
						$afterWordArray = explode(",", $chatgpt_data['random_words_after_tags']);

						$allRandomBeforeAfter = [];
						$allGameTagsIds = implode(",", $game_tags);
						$allGameTags = [];
						$gameTags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id IN({$allGameTagsIds}) ");
						$allRandomSimTagLink = [];
						while ($tagsData = $gameTags->fetch_array()) {
							$beforeWord = $beforeWordArray[array_rand($beforeWordArray)] . " ";
							$afterWord = " " . $afterWordArray[array_rand($afterWordArray)];
							$allGameTags[] = $beforeWord . $tagsData['name'] . $afterWord;

							$randomSimTagLink = siteUrl() . "/tag/" . $tagsData['url'];
							$randomSimTagName = $tagsData['name'];
							$allRandomSimTagLink[] = "<a href='{$randomSimTagLink}' target='_self' class='gameKeyword'><bold>{$randomSimTagName} Games</bold></a>";
						}

						$randomSimTagLink = $allRandomSimTagLink[array_rand($allRandomSimTagLink)];

						$gameTags = implode(",", $allGameTags);
					}

					$gameCategory = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id = '{$get_game['category']}'");
					if ($gameCategory) {
						$gameCategory = $gameCategory->fetch_assoc();
						$gameCategory = $gameCategory['name'];
					}

					// Random similar tag
					// $randomSimTag = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " ORDER BY RAND() LIMIT 1");
					// $randomSimTag = $randomSimTag->fetch_assoc();
					// $randomSimTagLink = siteUrl() . "/tag/" . $randomSimTag['url'];
					// $randomSimTagName = ucfirst($randomSimTag['name']);
					// $randomSimTagLink = "<a href='{$randomSimTagLink}' target='_self' class='gameKeyword'><bold>{$randomSimTagName} Games</bold></a>";
					
					// Random tag link
					$randomTag = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " ORDER BY RAND() LIMIT 1");
					$randomTag = $randomTag->fetch_assoc();
					$randomTagLink = siteUrl() . "/tag/" . $randomTag['url'];
					$randomTagName = ucfirst($randomTag['name']);
					$randomTagLink = "<a href='{$randomTagLink}' target='_self' class='gameKeyword'><bold>{$randomTagName} Games</bold></a>";
					
					$themeData['chat_gpt_template_game'] = str_replace(
						[
							"\$description",
							"\$title",
							"\$tags",
							"\$category",
							"\$game_link",
							"\$game_first_word",
							"\$game_second_word",
							"\$three_random_game",
							"\$random_similar_tags",
							"\$random_tags_link",
						],
						[
							$gameDescription,
							$gameTitle,
							$gameTags,
							$gameCategory,
							$oneRandomGame,
							$firstWordRandomGame,
							$secondWordRandomGame,
							implode(",", $threeRandomGame),
							$randomSimTagLink,
							$randomTagLink
						],
						$chatgpt_data['template_game']
					);

					$themeData['chat_gpt_template_game'] = str_replace('"', "'", $themeData['chat_gpt_template_game']);
				}


				$themeData['random_word_click_to_copy'] = $random_name_click_copy;
				$themeData['games_section_content'] = \GameMonetize\UI::view('admin/sections/edit-games-section');
			} else {
				$themeData['games_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['games_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/games');
	} elseif (isset($_GET['section']) && $_GET['section'] == "games-images-and-videos") {
		$newGames_query = $GameMonetizeConnect->query("SELECT * FROM ".GAMES." WHERE published='1' AND date_added >= UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 30 DAY)) ORDER BY date_added DESC");

		if ($newGames_query->num_rows == 0) {
			$themeData['games_list_image'] = 'No games for last 30 days.';
			$themeData['games_list_video'] = 'No games for last 30 days.';
		} else {
			while ($newGames = $newGames_query->fetch_array()) {
				$newGame_data = gameData($newGames);

				$new_game_image = "";
				$image_status = "";
				preg_match("/\/([a-zA-Z0-9]+)\//", $newGame_data['image_url'], $matches);
				$baseImagePath = $_SERVER['DOCUMENT_ROOT'] . '/games-image/' . $matches[1] . '/250x150.webp';
				if (file_exists($baseImagePath)) {
					$new_game_image = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseImagePath);
					$image_status = "<span style='color: green;display:inline-block;margin-left:8px;'>Image found</span>";
				} else {
					$new_game_image = $newGame_data['image_url'];
					$image_status = "<span style='color: red;display:inline-block;margin-left:8px;'>Image not found</span>";
				}

				$new_game_video = "";
				$video_status = "";
				preg_match('/([^\/]+\.mp4)$/', $newGame_data['wt_video'], $matches);
				$baseVideoThumbPath = $_SERVER['DOCUMENT_ROOT'] . '/games-thumb-video/' . $matches[1];
				if (file_exists($baseVideoThumbPath) &&  $newGame_data['wt_video'] != "") {
					$new_game_video = str_replace($_SERVER['DOCUMENT_ROOT'], '', $baseVideoThumbPath);
					$video_status = "<span style='color: green;display:inline-block;margin-left:8px;'>Video found</span>";
				} else {
					$new_game_video = $newGame_data['wt_video'];
					$video_status = "<span style='color: red;display:inline-block;margin-left:8px;'>Video not found</span>";
				}

				$themeData['games_list_image'] .= "<li style='display:flex;align-items:center;border-bottom: 1px solid #43495a;padding: 8px 16px;'><img src='" . $new_game_image . "' style='width: 40px;margin-right: 10px;'>" . $newGame_data['name'] . $image_status . "</li>";
				$themeData['games_list_video'] .= "<li style='display:flex;align-items:center;border-bottom: 1px solid #43495a;padding: 8px 16px;'><img src='" . $new_game_image . "' style='width: 40px;margin-right: 10px;'>" . $newGame_data['name'] . $video_status . "</li>";
			}
		}

		$ngrok_url = file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/VPS SERVER IP HERE.txt');
		$themeData['ngrok_url'] = "http://" . $ngrok_url;
		$themeData['cron_url_30_days'] = "https://" . $_SERVER['HTTP_HOST'] . "/ajax_updategamesvideos.php?action=update_last_30_days&ngrokurl=http%3A%2F%2F" . $ngrok_url;
		$themeData['cron_url_all_games'] = "https://" . $_SERVER['HTTP_HOST'] . "/ajax_updategamesvideos.php?action=update_all&ngrokurl=http%3A%2F%2F" . $ngrok_url;

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/games-images-and-videos');
	} elseif (isset($_GET['section']) && $_GET['section'] == "categories") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sql_global_categories = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id!=0");
			$gcts_r = '';
			while ($global_categories = $sql_global_categories->fetch_array()) {
				$themeData['view_category_id'] = $global_categories['id'];
				$themeData['view_category_name'] = $global_categories['name'];
				$themeData['view_category_image'] = $global_categories['image'];
				$themeData['view_category_button_delete'] = ($global_categories['id'] != 1) ? \GameMonetize\UI::view('admin/sections/view-categories-button-delete') : '';

				$gcts_r .= \GameMonetize\UI::view('admin/sections/view-categories-list');
			}
			$themeData['view_categories_list'] = $gcts_r;

			$themeData['categories_section_content'] = \GameMonetize\UI::view('admin/sections/view-categories-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "add") {
			$themeData['categories_section_content'] = \GameMonetize\UI::view('admin/sections/view-categories-add');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$category_id = secureEncode($_GET['cid']);
			$sql_select_editcategory = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id='{$category_id}'");
			if ($sql_select_editcategory->num_rows == 1) {
				$edit_category = $sql_select_editcategory->fetch_array();
				$themeData['edit_category_id'] = $edit_category['id'];
				$themeData['edit_category_name'] = $edit_category['name'];
				$themeData['edit_category_footer_description'] = $edit_category['footer_description'];
				$themeData['edit_category_show_home'] = $edit_category['show_home'] ? 'checked' : '';
				$themeData['edit_category_url'] = siteUrl() . '/category/' . $edit_category['category_pilot'];
				// Chatgpt template
				$chatgpt_query = $GameMonetizeConnect->query("SELECT * FROM " . CHATGPT . " WHERE id!=0");
				if ($chatgpt_query && $chatgpt_query->num_rows > 0) {
					$chatgpt_data = $chatgpt_query->fetch_assoc();

					$categoryDescription = $edit_category['footer_description'];
					$categoryTitle = $edit_category['name'];

					$categoryRandomGame = '';
					$sqlQuerySimilar = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE category = {$edit_category['id']} AND published='1' ORDER BY RAND() LIMIT 1");
					if ($sqlQuerySimilar->num_rows > 0) {
						while ($similarGames = $sqlQuerySimilar->fetch_array()) {
							$categoryRandomGame = siteUrl() . "/game/" . $similarGames['game_name'];
							$categoryRandomGame = "<a href='{$categoryRandomGame}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						}
					}

					$firstWordGame = $secondWordGame = $firstWordCategoryTitle = $secondWordCategoryTitle = "";

					// First word game
					$categoryTitleExploded = explode(" ", $categoryTitle);

					$firstWordCategoryTitle = substr($categoryTitleExploded[0], 0, 4);
					$sqlGameFirstWord = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$firstWordCategoryTitle}%' AND published='1' LIMIT 1");
					if ($sqlGameFirstWord && $sqlGameFirstWord->num_rows > 0) {
						$firstGameData = $sqlGameFirstWord->fetch_array();
						$firstGameLink = siteUrl() . "/game/" . $firstGameData['game_name'];
						$firstWordGame = "<a href='{$firstGameLink}' target='_self' class='gameKeyword'><bold>{$firstGameData['name']}<bold></a>";
					}

					if ($firstWordGame == "") {
					}

					if (count($categoryTitleExploded) > 1) {
						$secondWordTagTitle = substr($categoryTitleExploded[1], 0, 4);

						$sqlGameSecondWord = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$secondWordTagTitle}%' AND published='1' LIMIT 1");

						if ($sqlGameSecondWord && $sqlGameSecondWord->num_rows > 0) {
							$secondGameData = $sqlGameSecondWord->fetch_array();
							$secondGameLink = siteUrl() . "/game/" . $secondGameData['game_name'];
							$secondWordGame = "<a href='{$secondGameLink}' target='_self' class='gameKeyword'><bold>{$secondGameData['name']}</bold></a>";
						}
					}

					// Random games
					$sqlRandomGame = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE published='1' ORDER BY RAND() LIMIT 1");
					if ($sqlRandomGame && $sqlRandomGame->num_rows > 0) {
						$randomGameData = $sqlRandomGame->fetch_array();
						$randomGameLink = siteUrl() . "/game/" . $randomGameData['game_name'];
						$randomGame = "<a href='{$randomGameLink}' target='_self' class='gameKeyword'><bold>{$randomGameData['name']}</bold></a>";
					}

					// // Random category
					// $sqlRandomcategory = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " ORDER BY RAND() LIMIT 1");
					// if ($sqlRandomcategory && $sqlRandomcategory->num_rows > 0) {
					// 	$randomcategoryData = $sqlRandomcategory->fetch_array();
					// 	$randomcategoryLink = siteUrl() . "/category/" . $randomcategoryData['category_pilot'];
					// 	$randomCategory = "<a href='{$randomcategoryLink}' target='_self' class='gameKeyword'></bold>{$randomcategoryData['name']}</bold></a>";
					// 	$randomCategoryText = "{$randomcategoryData['name']}";
					// }

					// Random tags
					$sqlRandomTags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " ORDER BY RAND() LIMIT 1");

					if ($sqlRandomTags && $sqlRandomTags->num_rows > 0) {
						$randomTagsData = $sqlRandomTags->fetch_array();
						$randomTagsLink = siteUrl() . "/tag/" . $randomTagsData['url'];
						$randomTags = "<a href='{$randomTagsLink}' target='_self' class='gameKeyword'><bold>{$randomTagsData['name']} Games</bold></a>";
						$randomTagText = "{$randomTagsData['name']} Games";
					}

					// category with random before and after words
					$beforeWordArray = explode(",", $chatgpt_data['random_words_before_tags']);
					$afterWordArray = explode(",", $chatgpt_data['random_words_after_tags']);
					$allRandomBeforeAfter = [];
					for ($i = 0; $i < 10; $i++) {
						$beforeWord = $beforeWordArray[array_rand($beforeWordArray)] . " ";
						$afterWord = " " . $afterWordArray[array_rand($afterWordArray)];
						$categoryTitle = str_replace("Games", "", $categoryTitle);
						$categoryTitle = str_replace("games", "", $categoryTitle);
						$allRandomBeforeAfter[] = $beforeWord . $categoryTitle . $afterWord;
					}
					$allRandomBeforeAfter = implode(",", $allRandomBeforeAfter);


					$themeData['chat_gpt_template_category'] = str_replace(
						[
							"\$description",
							"\$title",
							"\$game_link",
							"\$firstWord",
							"\$secondWord",
							"\$randomSimGames",
							"\$randomSimTags",
							// "\$randomSimCategoryText",
							"\$randomSimTagBeforeAfter",
						],
						[
							$categoryDescription,
							$categoryTitle,
							$categoryRandomGame,
							$firstWordGame,
							$secondWordGame,
							$randomGame,
							$randomTags,
							// $randomCategoryText,
							$allRandomBeforeAfter,
						],
						$chatgpt_data['template_category']
					);
				}

				$themeData['categories_section_content'] = \GameMonetize\UI::view('admin/sections/view-categories-edit');
			} else {
				$themeData['categories_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['categories_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/categories');
	} elseif (isset($_GET['section']) && $_GET['section'] == "tags") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sql_global_tags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id!=0");
			$gcts_r = '';
			while ($global_tags = $sql_global_tags->fetch_array()) {
				$updateStatus = "";
				if (strlen($global_tags['footer_description'])) {
					$updateStatus = " (description updated)";
				}
				$themeData['view_tags_id'] = $global_tags['id'];
				$themeData['view_tags_name'] = $global_tags['name'] . $updateStatus;
				$themeData['view_tags_url_open'] = siteUrl() . "/tag/" . $global_tags['url'];
				$themeData['view_tags_button_delete'] = \GameMonetize\UI::view('admin/sections/view-tags-button-delete');

				$gcts_r .= \GameMonetize\UI::view('admin/sections/view-tags-list');
			}
			$themeData['view_tags_list'] = $gcts_r;

			$themeData['tags_section_content'] = \GameMonetize\UI::view('admin/sections/view-tags-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "add") {
			$themeData['tags_section_content'] = \GameMonetize\UI::view('admin/sections/view-tags-add');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$tags_id = secureEncode($_GET['cid']);
			$sql_select_edittags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id='{$tags_id}'");
			if ($sql_select_edittags->num_rows == 1) {
				$edit_tags = $sql_select_edittags->fetch_array();
				$themeData['edit_tags_id'] = $edit_tags['id'];
				$themeData['edit_tags_name'] = $edit_tags['name'];
				$themeData['edit_tags_footer_description'] = $edit_tags['footer_description'];
				$themeData['edit_tags_show_home'] = $edit_tags['show_home'] ? 'checked' : '';
				$themeData['edit_tags_url'] = siteUrl() . '/tag/' . $edit_tags['url'];
				$themeData['edit_last_id'] = $edit_tags['last_id'];
				$themeData['edit_tags_is_last_rewrite'] = "";
				if($edit_tags['is_last_rewrite'] == '1'){
					$themeData['edit_tags_is_last_rewrite'] = "checked";
				}
				$chatgpt_query = $GameMonetizeConnect->query("SELECT * FROM " . CHATGPT . " WHERE id!=0");
				if ($chatgpt_query && $chatgpt_query->num_rows > 0) {
					$chatgpt_data = $chatgpt_query->fetch_assoc();

					$tagsDescription = $edit_tags['footer_description'];
					$tagsTitle = $edit_tags['name'];

					$tagsRandomGame = '';
					$sqlQuerySimilar = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE tags_ids LIKE '%\"{$edit_tags['id']}\"%' AND published='1' ORDER BY RAND() LIMIT 1");
					if ($sqlQuerySimilar->num_rows > 0) {
						while ($similarGames = $sqlQuerySimilar->fetch_array()) {
							$tagsRandomGame = siteUrl() . "/game/" . $similarGames['game_name'];
							$tagsRandomGame = "<a href='{$tagsRandomGame}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";

						}
					}

					$firstWordGame = $secondWordGame = $firstWordTagTitle = $secondWordTagTitle = "";

					// First word game
					$tagsTitleExploded = explode(" ", $tagsTitle);

					$firstWordTagTitle = substr($tagsTitleExploded[0], 0, 4);
					$sqlGameFirstWord = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$firstWordTagTitle}%' AND published='1' LIMIT 1");
					if ($sqlGameFirstWord && $sqlGameFirstWord->num_rows > 0) {
						$firstGameData = $sqlGameFirstWord->fetch_array();
						$firstGameLink = siteUrl() . "/game/" . $firstGameData['game_name'];
						$firstWordGame = "<a href='{$firstGameLink}' target='_self' class='gameKeyword'><bold>{$firstGameData['name']}</bold></a>";
					}

					if ($firstWordGame == "") {
					}

					if ($sqlGameFirstWord->num_rows > 0) {
						while ($similarGames = $sqlQuerySimilar->fetch_array()) {
							$tagsRandomGame = siteUrl() . "/game/" . $similarGames['game_name'];
							$tagsRandomGame = "<a href='{$tagsRandomGame}' target='_self' class='gameKeyword'><bold>{$similarGames['name']}</bold></a>";
						}
					}

					if (count($tagsTitleExploded) > 1) {
						$secondWordTagTitle = $tagsTitleExploded[1];

						$sqlGameSecondWord = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE name LIKE '%{$secondWordTagTitle}%' AND published='1' LIMIT 1");

						if ($sqlGameSecondWord && $sqlGameSecondWord->num_rows > 0) {
							$secondGameData = $sqlGameSecondWord->fetch_array();
							$secondGameLink = siteUrl() . "/game/" . $secondGameData['game_name'];
							$secondWordGame = "<a href='{$secondGameLink}' target='_self' class='gameKeyword'><bold>{$secondGameData['name']}</bold></a>";
						}
					}

					// Random games
					$sqlRandomGame = $GameMonetizeConnect->query("SELECT * FROM " . GAMES . " WHERE published='1' ORDER BY RAND() LIMIT 1");

					if ($sqlRandomGame && $sqlRandomGame->num_rows > 0) {
						$randomGameData = $sqlRandomGame->fetch_array();
						$randomGameLink = siteUrl() . "/game/" . $randomGameData['game_name'];
						$randomGame = "<a href='{$randomGameLink}' target='_self' class='gameKeyword'><bold>{$randomGameData['name']}</bold></a>";
					}

					// Random tags
					$sqlRandomTags = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " ORDER BY RAND() LIMIT 1");

					if ($sqlRandomTags && $sqlRandomTags->num_rows > 0) {
						$randomTagsData = $sqlRandomTags->fetch_array();
						$randomTagsLink = siteUrl() . "/tag/" . $randomTagsData['url'];
						$randomTags = "<a href='{$randomTagsLink}' target='_self' class='gameKeyword'><bold>{$randomTagsData['name']} Games</bold></a>";
						$randomTagText = "{$randomTagsData['name']} Games";
					}

					// Tags with random before and after words
					$beforeWordArray = explode(",", $chatgpt_data['random_words_before_tags']);
					$afterWordArray = explode(",", $chatgpt_data['random_words_after_tags']);

					$allRandomBeforeAfter = [];
					for ($i = 0; $i < 10; $i++) {
						$beforeWord = $beforeWordArray[array_rand($beforeWordArray)] . " ";
						$afterWord = " " . $afterWordArray[array_rand($afterWordArray)];
						$allRandomBeforeAfter[] = $beforeWord . $tagsTitle . $afterWord;
					}
					$allRandomBeforeAfter = implode(",", $allRandomBeforeAfter);

					$chatGptTemplateTags = str_replace(
						[
							"\$description",
							"\$title",
							"\$game_link",
							"\$firstWord",
							"\$secondWord",
							"\$randomSimGames",
							"\$randomSimTags",
							// "\$randomSimTagTxt",
							"\$randomSimTagBeforeAfter",
							// "\$randomSimTag",
							// "\$randomTagLink",
						],
						[
							$tagsDescription,
							$tagsTitle,
							$tagsRandomGame,
							$firstWordGame,
							$secondWordGame,
							$randomGame,
							$randomTags,
							// $randomTagText,
							$allRandomBeforeAfter,
						],
						$chatgpt_data['template_tags']
					);

					$chatGptTemplateTags = str_replace('"', "'", $chatGptTemplateTags);
					$themeData['chat_gpt_template_tags'] = $chatGptTemplateTags;
				}

				$themeData['tags_section_content'] = \GameMonetize\UI::view('admin/sections/view-tags-edit');
			} else {
				$themeData['tags_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['categories_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/tags');
	} elseif (isset($_GET['section']) && $_GET['section'] == "footerdescription") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sqlQuery = $GameMonetizeConnect->query("SELECT * FROM " . FOOTER_DESCRIPTION);
			$footerList = '';
			while ($footer = $sqlQuery->fetch_array()) {
				$themeData['view_footer_description_id'] = $footer['id'];
				$themeData['view_footer_description_name'] = $footer['page_name'];
				// $themeData['view_footer_url_open'] = siteUrl() . "/tag/" . $footer['url'];
				// $themeData['view_footer_button_delete'] = \GameMonetize\UI::view('admin/sections/view-tags-button-delete');

				$footerList .= \GameMonetize\UI::view('admin/sections/view-footer-description-list');
			}
			$themeData['view_footer_description_list'] = $footerList;

			$themeData['footer_description_section_content'] = \GameMonetize\UI::view('admin/sections/view-footer-description-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$footer_description_id = secureEncode($_GET['cid']);
			$sqlQuery = $GameMonetizeConnect->query("SELECT * FROM " . FOOTER_DESCRIPTION . " WHERE id='{$footer_description_id}'");
			if ($sqlQuery->num_rows == 1) {
				$edit_footer_description = $sqlQuery->fetch_array();
				$themeData['edit_footer_description_id'] = $edit_footer_description['id'];
				$themeData['edit_footer_description_name'] = ucwords($edit_footer_description['page_name']);
				$themeData['edit_footer_description_value'] = $edit_footer_description['description'];
				if ($edit_footer_description['has_content'] == '1') {
					$themeData['edit_footer_description_value_content_value'] = $edit_footer_description['content_value'];
					$themeData['edit_footer_description_content'] = \GameMonetize\UI::view('admin/sections/view-footer-description-edit-content');
				}

				$chatgpt_query = $GameMonetizeConnect->query("SELECT * FROM " . CHATGPT . " WHERE id!=0");
				if ($chatgpt_query && $chatgpt_query->num_rows > 0) {
					$chatgpt_data = $chatgpt_query->fetch_assoc();

					$footerDescription = $edit_footer_description['description'];
					$footerTitle = $edit_footer_description['page_name'];

					$themeData['chat_gpt_template_footer'] = str_replace(
						[
							"\$description",
							"\$title",
						],
						[
							$footerDescription,
							$footerTitle,
						],
						$chatgpt_data['template_footer']
					);
				}


				$themeData['edit_footer_description_description'] = \GameMonetize\UI::view('admin/sections/view-footer-description-edit-description');

				$themeData['footer_description_section_content'] = \GameMonetize\UI::view('admin/sections/view-footer-description-edit');
			} else {
				$themeData['footer_description_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/footerdescription');
	} elseif (isset($_GET['section']) && $_GET['section'] == "blogs") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sql_global = $GameMonetizeConnect->query("SELECT * FROM " . BLOGS . " ORDER BY id DESC");
			$gcts_r = '';
			while ($global = $sql_global->fetch_array()) {
				$themeData['view_blog_id'] = $global['id'];
				$themeData['view_blog_name'] = $global['title'];
				$themeData['view_blog_image'] = $global['image_url'];
				$themeData['view_blog_post'] = $global['post'];
				$themeData['view_blog_button_delete'] = \GameMonetize\UI::view('admin/sections/view-blogs-button-delete');

				$gcts_r .= \GameMonetize\UI::view('admin/sections/view-blogs-list');
			}
			$themeData['view_blogs_list'] = $gcts_r;
			$themeData['blogs_section_content'] = \GameMonetize\UI::view('admin/sections/view-blogs-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "add") {
			$themeData['blogs_section_content'] = \GameMonetize\UI::view('admin/sections/view-blogs-add');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$blog_id = secureEncode($_GET['cid']);
			$sql_select_editblog = $GameMonetizeConnect->query("SELECT * FROM " . BLOGS . " WHERE id='{$blog_id}'");
			if ($sql_select_editblog->num_rows == 1) {
				$edit_blog = $sql_select_editblog->fetch_array();
				$themeData['edit_blog_id'] = $edit_blog['id'];
				$themeData['edit_blog_title'] = $edit_blog['title'];
				$themeData['edit_blog_image_url'] = $edit_blog['image_url'];
				$themeData['edit_blog_post'] = $edit_blog['post'];
				$themeData['edit_blog_url'] = siteUrl() . '/blog/' . $edit_blog['url'];

				$themeData['blogs_section_content'] = \GameMonetize\UI::view('admin/sections/view-blogs-edit');
			} else {
				$themeData['blogs_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['blogs_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/blogs');
	} elseif (isset($_GET['section']) && $_GET['section'] == "users") {
		if (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['uid'])) {
			$get_user_uid = secureEncode($_GET['uid']);
			if (is_numeric($get_user_uid)) {
				$user_uid_type = "id = " . $get_user_uid;
			} elseif (preg_match('/[A-Za-z0-9_]/', $get_user_uid)) {
				$user_uid_type = "username = '{$get_user_uid}'";
			}
			$get_user_query = $GameMonetizeConnect->query("SELECT * FROM " . ACCOUNTS . " WHERE " . $user_uid_type);

			if ($get_user_query->num_rows > 0) {
				$get_user_account = $get_user_query->fetch_array();
				$get_user_info = getInfo($get_user_account['id']);
				$themeData['user_profile_avatar'] = getAvatar($get_user_account['avatar_id'], $get_user_info['gender']);
				$themeData['user_profile_id'] = $get_user_account['id'];
				$themeData['user_profile_username'] = $get_user_account['username'];
				$themeData['user_profile_name'] = $get_user_account['name'];
				$themeData['user_profile_ip'] = $get_user_account['ip'];
				$themeData['user_profile_email'] = $get_user_account['email'];
				$themeData['user_profile_xp'] = $get_user_account['xp'];
				$themeData['user_profile_about'] = $get_user_info['about'];
				$themeData['user_profile_rank_status_0'] = ($get_user_account['admin'] == 0) ? 'selected' : '';
				$themeData['user_profile_rank_status_1'] = ($get_user_account['admin'] == 1) ? 'selected' : '';
				$themeData['user_profile_gender_status_1'] = ($get_user_info['gender'] == 1) ? 'selected' : '';
				$themeData['user_profile_gender_status_2'] = ($get_user_info['gender'] == 2) ? 'selected' : '';
				$themeData['user_profile_active_status'] = ($get_user_account['active']) ? 'checked' : '';
				$ueLANG_dir = opendir('assets/language/');
				$ueLANG_dr_array = array();
				while (false !== ($file = readdir($ueLANG_dir))) {
					$ueLANG_dr_array[] = $file;
				}
				closedir($ueLANG_dir);
				$gusrlng_r = '';
				foreach ($ueLANG_dr_array as $file) {
					if ($file != "." && $file != ".." && $file != "Thumbs.db" && $file != ".DS_Store" && $file != "images") {
						$val_file = str_replace('.php', '', $file);
						$gusrlng_r .= ($get_user_account['language'] == $val_file) ?
							'<option value="' . $val_file . '" selected>' . $val_file . '</option>' :
							'<option value="' . $val_file . '">' . $val_file . '</option>';
					}
				}
				$themeData['user_profile_language_option'] = $gusrlng_r;

				$themeData['user_section_content'] = \GameMonetize\UI::view('admin/sections/view-user-edit');
			} else {
				$themeData['user_section_content'] = \GameMonetize\UI::view('welcome/error');
			}
		} else {
			$themeData['user_section_content'] = \GameMonetize\UI::view('admin/sections/view-user-search');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/users');
	} elseif (isset($_GET['section']) && $_GET['section'] == "ads") {
		$get_ads_data = $GameMonetizeConnect->query("SELECT * FROM " . ADS . "");
		$get_ads = $get_ads_data->fetch_array();
		$themeData['ads_area_header'] = $get_ads['728x90'];
		$themeData['ads_area_footer'] = $get_ads['300x250'];
		$themeData['ads_area_column_one'] = $get_ads['600x300'];
		$themeData['ads_area_gametop'] = $get_ads['728x90_main'];
		$themeData['ads_area_gamebottom'] = $get_ads['300x250_main'];
		$themeData['ads_area_gameinfo'] = $get_ads['ads_video'];

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/ads');
	} elseif (isset($_GET['section']) && $_GET['section'] == "adstxt") {

		if (!defined('ABSPATH')) {
			define('ABSPATH', dirname(dirname(__FILE__)) . '/');
		}
		$url = ABSPATH . 'ads.txt';

		$text = file_get_contents($url);

		$themeData['ads_txt'] = $text;

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/adstxt');
	} elseif (isset($_GET['section']) && $_GET['section'] == "chatgpt") {
		$get_chatpgt_data = $GameMonetizeConnect->query("SELECT * FROM " . CHATGPT . "");
		$get_chatpgt = $get_chatpgt_data->fetch_array();
		$themeData['chatgpt_api_key'] = $get_chatpgt['api_key'];
		$themeData['chatgpt_template_game'] = $get_chatpgt['template_game'];
		$themeData['chatgpt_template_category'] = $get_chatpgt['template_category'];
		$themeData['chatgpt_template_tags'] = $get_chatpgt['template_tags'];
		$themeData['chatgpt_random_words_before_tags'] = $get_chatpgt['random_words_before_tags'];
		$themeData['chatgpt_random_words_after_tags'] = $get_chatpgt['random_words_after_tags'];
		
		$chatgpt_models = '';
		foreach (CHATGPT_MODELS as $model) {
			$selected = "";
			if($model == $get_chatpgt['chatgpt_model']){
				$selected = "selected";
			}
			
			$chatgpt_models .= "<option value='$model' $selected>$model</option>";
		}
		$themeData['chatgpt_models'] = $chatgpt_models;
		$themeData['chatgpt_maximum_words'] = $get_chatpgt['maximum_words'];
		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/chatgpt');
	} elseif (isset($_GET['section']) && $_GET['section'] == "gamedescription") {
		$spreadsheet = new Spreadsheet();
		$activeWorksheet = $spreadsheet->getActiveSheet();

		$rowLength = 0;
		$row = 1;
		$isMultiple = false;
		$allXlsxContent = [];

		// Game data
		$gameData = $GameMonetizeConnect->query("SELECT * FROM " . GAMES);
		while ($game = $gameData->fetch_array()) {
			$pattern = "/\b\w+'\w+\b/";
			$value = preg_replace($pattern, "", $game['description']);
			$value = str_replace('"', "'", $value);
			$value = strip_tags($value, ["a", "b", "p"]);
			$value = replaceOriginalLinks($value);
			if (strlen($value) > 0) {
				$key = $game['game_id'];
				$activeWorksheet->setCellValue('A' . $row, $key);
				$activeWorksheet->setCellValue('B' . $row, $value);
				$rowLength = strlen($key) + strlen($value);
				countRow($row, $spreadsheet, $activeWorksheet, $isMultiple, $allXlsxContent, $rowLength);
			}
		}

		if ($isMultiple) {
			$allXlsxContent[] = $this->generateAndSaveXLSX($spreadsheet);
			// Create a ZIP file containing all XLSX files
			$zip = new ZipArchive();
			$zipFileName = 'Unstranslated.zip';
			$zip->open($zipFileName, ZipArchive::CREATE);
			foreach ($allXlsxContent as $index => $content) {
				$zip->addFromString('Unstranslated' . ($index + 1) . ".xlsx", $content);
			}
			// $zip->addFromString('File2.xlsx', $content2);
			// $zip->addFromString('File3.xlsx', $content3);
			$zip->close();

			// Set the appropriate headers to force a download
			header('Content-Type: application/zip');
			header('Content-Disposition: attachment; filename="' . $zipFileName . '"');
			header('Content-Length: ' . filesize($zipFileName));

			// Send the ZIP file to the browser
			readfile($zipFileName);

			// Clean up (delete) the temporary ZIP file from the server
			unlink($zipFileName);
		} else {
			generateAndDownloadXLSX($spreadsheet, "Untranslated");
		}

		exit;
	} elseif (isset($_GET['section']) && $_GET['section'] == "links") {
		// error_reporting(-1);
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$get_links_data = $GameMonetizeConnect->query("SELECT * FROM " . LINKS);
			$linkList = '';
			while ($link = $get_links_data->fetch_array()) {
				$themeData['view_links_id'] = $link['id'];
				$isActive = $link['is_active'];
				$linkName = str_replace("autopost", "links", $link['name']);
				if ($isActive) {
					$linkUrl = " -> <a href='" . siteUrl() . "/" . $linkName . "/" . $link['url'] . "' target='_blank'>" . $link['url'] . "</a>";
					$themeData['view_links_enable_disable'] = 'disable';
					$themeData['view_links_icon'] = 'fa-close';
					$themeData['view_links_button_class'] = 'btn-danger';
				} else {
					$linkUrl = " (not active)";
					$themeData['view_links_enable_disable'] = 'enable';
					$themeData['view_links_button_class'] = 'btn-p2';
					$themeData['view_links_icon'] = 'fa-check-circle';
				}

				$themeData['view_links_name'] = $link['name'] . $linkUrl;

				$linkList .= \GameMonetize\UI::view('admin/sections/view-links-list');
			}
			$themeData['view_links_list'] = $linkList;

			// Rewrite method
			$methods = ['off', 'google', 'spinner', 'chatgpt'];
			$get_links_data = $GameMonetizeConnect->query("SELECT * FROM " . LINKS . " WHERE name='autopost'");
			$autopostLinkData = $get_links_data->fetch_array();
			$rewriteMethodOptions = "";
			foreach ($methods as $method) {
				$selected = "";
				if ($autopostLinkData['rewrite_method'] == $method) {
					$selected = "selected";
				}

				$rewriteMethodOptions .= "<option value='{$method}' $selected>" . ucfirst($method) . "</option>";
			}
			$themeData['link_rewrite_method'] = $rewriteMethodOptions;
			$themeData['google_translate_language'] = $autopostLinkData['google_translate_language'];

			$themeData['links_section_content'] = \GameMonetize\UI::view('admin/sections/view-links-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/links');
	} elseif (isset($_GET['section']) && $_GET['section'] == "sliders") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SLIDERS . " ORDER BY ordering ASC");
			$lists = '';
			while ($item = $sql_item->fetch_array()) {
				$category_tags_name = "-";
				if ($item['type'] == 'tags') {
					$keyword_item = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id = {$item['category_tags_id']}");
					if ($keyword_item && $keyword_item->num_rows > 0) {
						$category_tags = $keyword_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				if ($item['type'] == 'category') {
					$category_item = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id = {$item['category_tags_id']}");
					if ($category_item && $category_item->num_rows > 0) {
						$category_tags = $category_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				$themeData['view_slider_id'] = $item['id'];
				$themeData['view_slider_type'] = $item['type'];
				$themeData['view_slider_category_tags'] = $category_tags_name;
				$themeData['view_slider_ordering'] = $item['ordering'];
				$themeData['view_slider_button_delete'] = \GameMonetize\UI::view('admin/sections/sliders/view-button-delete');

				$lists .= \GameMonetize\UI::view('admin/sections/sliders/view-list');
			}
			$themeData['view_sliders_list'] = $lists;
			$themeData['sliders_section_content'] = \GameMonetize\UI::view('admin/sections/sliders/view-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "add") {
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SLIDERS . " ORDER BY ordering ASC");
			$lists = '';
			while ($item = $sql_item->fetch_array()) {
				$category_tags_name = "-";
				if ($item['type'] == 'tags') {
					$keyword_item = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id = {$item['category_tags_id']}");
					if ($keyword_item && $keyword_item->num_rows > 0) {
						$category_tags = $keyword_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				if ($item['type'] == 'category') {
					$category_item = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id = {$item['category_tags_id']}");
					if ($category_item && $category_item->num_rows > 0) {
						$category_tags = $category_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				$themeData['view_slider_id'] = $item['id'];
				$themeData['view_slider_type'] = $item['type'];
				$themeData['view_slider_category_tags'] = $category_tags_name;
				$themeData['view_slider_ordering'] = $item['ordering'];
				$themeData['view_slider_button_delete'] = \GameMonetize\UI::view('admin/sections/sliders/view-button-delete');

				$lists .= \GameMonetize\UI::view('admin/sections/sliders/view-list');
			}
			$themeData['view_sliders_list'] = $lists;

			$slider_types = "";
			foreach (SLIDERS_TYPE as $type) {
				$slider_types .= "<option value='{$type}'>{$type}</option>";
			}

			$sql_item = $GameMonetizeConnect->query("SELECT id, name, 'tags' AS category_tags FROM " . TAGS . " UNION " . "SELECT id,name, 'category' as category_tags FROM " . CATEGORIES);

			$slider_category_tags = "<option value='none'>none</option>";
			if ($sql_item && $sql_item->num_rows > 0) {
				while ($item = $sql_item->fetch_array()) {
					$slider_category_tags .= "<option value='{$item['category_tags']}-{$item['id']}'>{$item['category_tags']}: {$item['name']}</option>";
				}
			}

			$themeData['slider_types'] = $slider_types;
			$themeData['slider_category_tags'] = $slider_category_tags;
			$themeData['sliders_section_content'] = \GameMonetize\UI::view('admin/sections/sliders/view-add');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$slider_id = secureEncode($_GET['cid']);
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SLIDERS . " WHERE id='{$slider_id}'");
			if ($sql_item->num_rows == 1) {
				$sliderData = $sql_item->fetch_array();
				$slider_types = "";
				foreach (SLIDERS_TYPE as $type) {
					$selected = "";
					if ($type == $sliderData['type']) {
						$selected = "selected";
					}
					$slider_types .= "<option value='{$type}' {$selected}>{$type}</option>";
				}

				$sql_item = $GameMonetizeConnect->query("SELECT id, name, 'tags' AS category_tags FROM " . TAGS . " UNION " . "SELECT id, name, 'category' as category_tags FROM " . CATEGORIES);

				$slider_category_tags = "<option value='none'>none</option>";
				if ($sql_item && $sql_item->num_rows > 0) {
					while ($item = $sql_item->fetch_array()) {
						$selected = "";
						if ($sliderData['type'] == $item['category_tags'] && $item['id'] == $sliderData['category_tags_id']) {
							$selected = "selected";
						}

						$slider_category_tags .= "<option value='{$item['category_tags']}-{$item['id']}' {$selected}>{$item['category_tags']}: {$item['name']}</option>";
					}
				}

				$themeData['slider_id'] = $sliderData['id'];
				$themeData['slider_ordering'] = $sliderData['ordering'];
				$themeData['slider_types'] = $slider_types;
				$themeData['slider_category_tags'] = $slider_category_tags;
				$themeData['sliders_section_content'] = \GameMonetize\UI::view('admin/sections/sliders/view-edit');
			} else {
				$themeData['sliders_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['sliders_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/sliders');
	} elseif (isset($_GET['section']) && $_GET['section'] == "sidebar") {
		if (!isset($_GET['action']) || $_GET['action'] == "view") {
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SIDEBAR . " ORDER BY ordering+0 ASC");
			$lists = '';
			while ($item = $sql_item->fetch_array()) {
				$category_tags_name = "-";
				if ($item['type'] == 'tags') {
					$keyword_item = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id = {$item['category_tags_id']}");
					if ($keyword_item && $keyword_item->num_rows > 0) {
						$category_tags = $keyword_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				if ($item['type'] == 'category') {
					$category_item = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id = {$item['category_tags_id']}");
					if ($category_item && $category_item->num_rows > 0) {
						$category_tags = $category_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}
				$themeData['view_sidebar_id'] = $item['id'];
				$themeData['view_sidebar_name'] = $item['name'];
				$themeData['view_sidebar_type'] = $item['type'];
				$themeData['view_sidebar_category_tags'] = $category_tags_name;
				$themeData['view_sidebar_custom_link'] = $item['custom_link'];
				$themeData['view_sidebar_icon'] = $item['icon'];
				$themeData['view_sidebar_ordering'] = $item['ordering'];
				$themeData['view_sidebar_button_delete'] = \GameMonetize\UI::view('admin/sections/sidebar/view-button-delete');

				$lists .= \GameMonetize\UI::view('admin/sections/sidebar/view-list');
			}
			$themeData['view_sidebar_list'] = $lists;

			// Sidebar settings
			$settingsData = $GameMonetizeConnect->query("SELECT * FROM " . SETTING . " LIMIT 1");
			$settingsData = $settingsData->fetch_array();

			if ($settingsData['is_sidebar_enabled']) {
				$themeData['view_sidebar_enable_disable_icon'] = "xmark";
				$themeData['view_sidebar_enable_disable_button'] = "btn-p3";
				$themeData['view_sidebar_enable_disable_text'] = "Disable Sidebar";
			} else {
				$themeData['view_sidebar_enable_disable_icon'] = "check";
				$themeData['view_sidebar_enable_disable_button'] = "btn-p2";
				$themeData['view_sidebar_enable_disable_text'] = "Enable Sidebar";
			}
			$themeData['sidebar_section_content'] = \GameMonetize\UI::view('admin/sections/sidebar/view-section');
		} elseif (isset($_GET['action']) && $_GET['action'] == "add") {
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SIDEBAR . " ORDER BY ordering+0 ASC");
			$lists = '';
			while ($item = $sql_item->fetch_array()) {
				$category_tags_name = "-";
				if ($item['type'] == 'tags') {
					$keyword_item = $GameMonetizeConnect->query("SELECT * FROM " . TAGS . " WHERE id = {$item['category_tags_id']}");
					if ($keyword_item && $keyword_item->num_rows > 0) {
						$category_tags = $keyword_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}

				if ($item['type'] == 'category') {
					$category_item = $GameMonetizeConnect->query("SELECT * FROM " . CATEGORIES . " WHERE id = {$item['category_tags_id']}");
					if ($category_item && $category_item->num_rows > 0) {
						$category_tags = $category_item->fetch_array();
						$category_tags_name = $category_tags['name'];
					}
				}
				$themeData['view_sidebar_id'] = $item['id'];
				$themeData['view_sidebar_name'] = $item['name'];
				$themeData['view_sidebar_type'] = $item['type'];
				$themeData['view_sidebar_category_tags'] = $category_tags_name;
				$themeData['view_sidebar_custom_link'] = $item['custom_link'];
				$themeData['view_sidebar_icon'] = $item['icon'];
				$themeData['view_sidebar_ordering'] = $item['ordering'];
				$themeData['view_sidebar_button_delete'] = \GameMonetize\UI::view('admin/sections/sidebar/view-button-delete');

				$lists .= \GameMonetize\UI::view('admin/sections/sidebar/view-list');
			}
			$themeData['view_sidebar_list'] = $lists;

			$sidebar_types = "";
			foreach (SIDEBAR_TYPE as $type) {
				$sidebar_types .= "<option value='{$type}'>{$type}</option>";
			}

			$sql_item = $GameMonetizeConnect->query("SELECT id, name, 'tags' AS category_tags FROM " . TAGS . " UNION " . "SELECT id,name, 'category' as category_tags FROM " . CATEGORIES);

			$sidebar_category_tags = "<option value='none'>none</option>";
			if ($sql_item && $sql_item->num_rows > 0) {
				while ($item = $sql_item->fetch_array()) {
					$sidebar_category_tags .= "<option value='{$item['category_tags']}-{$item['id']}'>{$item['category_tags']}: {$item['name']}</option>";
				}
			}

			$themeData['sidebar_types'] = $sidebar_types;
			$themeData['sidebar_category_tags'] = $sidebar_category_tags;
			$themeData['sidebar_section_content'] = \GameMonetize\UI::view('admin/sections/sidebar/view-add');
		} elseif (isset($_GET['action']) && $_GET['action'] == "edit" && !empty($_GET['cid'])) {
			$sidebar_id = secureEncode($_GET['cid']);
			$sql_item = $GameMonetizeConnect->query("SELECT * FROM " . SIDEBAR . " WHERE id='{$sidebar_id}'");
			if ($sql_item->num_rows == 1) {
				$sidebarData = $sql_item->fetch_array();

				$sidebar_types = "";
				foreach (SIDEBAR_TYPE as $type) {
					$selected = "";
					if ($type == $sidebarData['type']) {
						$selected = "selected";
					}
					$sidebar_types .= "<option value='{$type}' {$selected}>{$type}</option>";
				}

				$sql_item = $GameMonetizeConnect->query("SELECT id, name, 'tags' AS category_tags FROM " . TAGS . " UNION " . "SELECT id,name, 'category' as category_tags FROM " . CATEGORIES);

				$sidebar_category_tags = "<option value='none'>none</option>";
				if ($sql_item && $sql_item->num_rows > 0) {
					while ($item = $sql_item->fetch_array()) {
						$selected = "";
						$isSameType = $sidebarData['type'] == $item['category_tags'];
						$isSameCategoryTags = $item['id'] == $sidebarData['category_tags_id'];
						if ($isSameType && $isSameCategoryTags) {
							$selected = "selected";
						}
						$sidebar_category_tags .= "<option value='{$item['category_tags']}-{$item['id']}' {$selected}>{$item['category_tags']}: {$item['name']}</option>";
					}
				}
				$themeData['sidebar_types'] = $sidebar_types;
				$themeData['sidebar_category_tags'] = $sidebar_category_tags;

				$themeData['view_sidebar_id'] = $sidebarData['id'];
				$themeData['view_sidebar_custom_link'] = $sidebarData['custom_link'];
				$themeData['view_sidebar_name'] = $sidebarData['name'];
				$themeData['view_sidebar_icon'] = $sidebarData['icon'];
				$themeData['view_sidebar_ordering'] = $sidebarData['ordering'];

				$themeData['sidebar_section_content'] = \GameMonetize\UI::view('admin/sections/sidebar/view-edit');
			} else {
				$themeData['sidebar_section_content'] = \GameMonetize\UI::view('welcome/error-section');
			}
		} else {
			$themeData['sidebar_section_content'] = \GameMonetize\UI::view('welcome/error-section');
		}

		$themeData['page_admin_content'] = \GameMonetize\UI::view('admin/sidebar');
	} else {
		$themeData['page_admin_content'] = \GameMonetize\UI::view('welcome/error-section');
	}

	$themeData['page_content'] = \GameMonetize\UI::view('admin/content');
}

function replaceOriginalLinks($text)
{
	$text = str_replace('"', "'", $text);
	$pattern = "/<a.*?href='([^']+)'[^>]*>([^<]*||.+?)<\/a>/";
	if (preg_match_all($pattern, $text, $matches, PREG_SET_ORDER)) {
		foreach ($matches as $match) {
			$linkText = $match[2];
			$realLinkHref = $linkHref = $match[1];
			$hostName = explode(".", $_SERVER['HTTP_HOST']);
			$hostName = $hostName[1];
			$linkHref = str_replace(".", "", $linkHref);
			$linkHref = str_replace("%20", "-", $linkHref);
			$linkHref = rtrim($linkHref, '/');
			if (strpos($linkHref, "/category")) {
				// get category
				$lastLinkHref = end(explode("/", $linkHref));
				$itemId = getItemIdByUrl($lastLinkHref, CATEGORIES, "category_pilot");
				$uniqueCode = "3";
			} elseif (strpos($linkHref, "/tag")) {
				// get keyword
				$lastLinkHref = end(explode("/", $linkHref));
				$itemId = getItemIdByUrl($lastLinkHref, TAGS, "url");
				$uniqueCode = "2";
			} elseif (!strpos($realLinkHref, $hostName) && !strpos($linkHref, "/game/")) {
				// External links
				$itemId = getItemIdByUrl($realLinkHref, EXTERNAL_LINKS, "url", $linkText);
				$uniqueCode = "4";
			} else {
				$explodedHref = explode("/", $linkHref);
				$lastLinkHref = end($explodedHref);
				$itemId = getItemIdByUrl($lastLinkHref, GAMES, "game_name");
				$uniqueCode = "1";
			}

			if (!is_null($itemId)) {
				// Replace the link with the placeholder
				$placeholder = "{{" . $uniqueCode . "-" . $itemId . "}}";
				$text = str_replace($match[0], $placeholder, $text);
			}
		}
	}

	return $text;
}

function countRow(&$row, &$spreadsheet, &$activeWorksheet, &$isMultiple, &$allXlsxContent, &$rowLength)
{
	$row++;
	global $totalRowLength;
	$totalRowLength += $rowLength;

	$rowPerPage = 6000000;
	$rowPerPage = $rowPerPage == 0 ? 3500000 : $rowPerPage;

	// * 1kb = 3,500 char, 1mb = 3,500,000 char (approx)
	// $oneMbChar = 3500000;
	if ($totalRowLength > $rowPerPage) {
		$isMultiple = true;
		$allXlsxContent[] = generateAndSaveXLSX($spreadsheet);

		$spreadsheet = new Spreadsheet();
		$activeWorksheet = $spreadsheet->getActiveSheet();
		$row = 0;
		$totalRowLength = 0;
	}
}

function generateAndSaveXLSX($spreadsheet)
{
	ob_start();
	$writer = new Xlsx($spreadsheet);
	$writer->save('php://output');
	return ob_get_clean();
}

function generateAndDownloadXLSX($spreadsheet, $filename)
{
	// Set the appropriate headers to force a download
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment; filename="' . $filename . '.xlsx"');
	header('Cache-Control: max-age=0');

	$writer = new Xlsx($spreadsheet);
	$writer->save('php://output');
	exit;
}

function getItemIdByUrl($lastLinkHref, $table, $field, $text = "")
{
	global $GameMonetizeConnect;
	$itemData = $GameMonetizeConnect->query("SELECT * FROM " . $table . " WHERE " . $field . " = '{$lastLinkHref}' LIMIT 1");
	if (
		$itemData &&
		$itemData->num_rows > 0
	) {
		$itemData = $itemData->fetch_array();
		if ($table == GAMES) {
			return $itemData['game_id'];
		}
		return $itemData['id'];
	}

	if ($table == 'external_links' && $itemData) {
		$itemData = $GameMonetizeConnect->query("INSERT INTO " . EXTERNAL_LINKS . " (url, title) VALUES ('{$lastLinkHref}', '{$text}')");
		if ($itemData) {
			return $GameMonetizeConnect->insert_id;
		}
	}

	return null;
}
