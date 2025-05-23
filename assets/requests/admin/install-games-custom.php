<?php

if (!defined('R_PILOT')) exit();

// Get custom game feed url
$settingSql = "SELECT * FROM `" . SETTING . "` WHERE `id` = '1'";
$settings = $GameMonetizeConnect->query($settingSql);
$settings = $settings->fetch_assoc();

$custom_value = $_POST['customValue'];
// $catalog = file_get_contents('https://gamemonetize.com/feed.php?format=0&num=30');
$catalog = file_get_contents($settings['custom_game_feed_url']);
if (!!$catalog) {
      $games = json_decode($catalog, true);
      $i = 0;
      $installedGamesCounter = 0;
      $installedGamesMaximum = $custom_value;
      foreach ($games as $game) {
            if($installedGamesCounter >= $installedGamesMaximum) break;
            $title = seo_friendly_url($game['title']);
            $user_info = "SELECT * FROM `" . GAMES . "` WHERE `game_name` = '$title'";
            $user_info_query = $GameMonetizeConnect->query($user_info);

            if ($user_info_query->num_rows == 0) {

                  $game_data = array();
                  $game_data['catalog_id'] = secureEncode($game['id']);
                  $game_data['game_name'] = secureEncode($title);
                  $game_data['name'] = secureEncode($game['title']);
                  $game_data['description'] = !empty($game['description']) ? secureEncode($game['description']) : '';
                  $game_data['instructions'] = !empty($game['instructions']) ? secureEncode($game['instructions']) : '';
                  $game_data['file'] = secureEncode($game['url']);
                  $game_data['width'] = $game['width'];
                  $game_data['height'] = $game['height'];
                  $game_data['image'] = $game['thumb'];

                  preg_match("/\/([a-zA-Z0-9]+)\//", $game_data['image'], $matches);
                  $imageId = $matches[1];
                  $imageUrl = $game_data['image'];
                  $imagePath = $_SERVER['DOCUMENT_ROOT'] . '/games-image/' . $imageId . '/250x150.webp';
                  resizeAndCompressImage($imageUrl, $imagePath, 200, 150);

                  // Get category from database
                  $category_data = getCategoriesLikeName($game['category']);
                  if($category_data !== null){
                        $category = $category_data['id'];                        
                  }

                  // Get tags from database
                  $allTags = explode(",", $game['tags']);
                  $allTagsId = [];
                  foreach($allTags as $tag){
                        $tag_data = getTagsLikeName(trim($tag));
                        $allTagsId[] = "\"{$tag_data["id"]}\"";
                  }
                  if(count($allTagsId) > 0){
                        $tags = "[".implode(",", $allTagsId)."]";
                  }

                  $isSuccess = $GameMonetizeConnect->query("INSERT INTO " . GAMES . " (
                        catalog_id, 
                        game_name, 
                        name, 
                        image, 
                        description, 
                        instructions, 
                        category, 
                        file, 
                        game_type, 
                        w, 
                        h, 
                        date_added, 
                        tags_ids,
                        published
                  ) VALUES (
                        'gamemonetize-{$game_data['catalog_id']}',
                        '{$game_data['game_name']}',
                        '{$game_data['name']}',
                        '{$game_data['image']}',
                        '{$game_data['description']}',
                        '{$game_data['instructions']}',
                        '{$category}',
                        '{$game_data['file']}',
                        'html5',
                        '{$game_data['width']}',
                        '{$game_data['height']}',
                        '{$time}', 
                        '{$tags}',
                        '1'
                  )");
                  if ($isSuccess) {
                        $installedGamesCounter++;
                        addGameXml(siteUrl() . '/game/' . $game_data['game_name']);
                        
                        // Update total_games in CATEGORIES
                        $GameMonetizeConnect->query("UPDATE `" . CATEGORIES . "` SET `total_games` = `total_games` + 1 WHERE `id` = '{$category}'");

                        // Update total_games in TAGS
                        foreach($allTagsId as $tagId) {
                              $GameMonetizeConnect->query("UPDATE `" . TAGS . "` SET `total_games` = `total_games` + 1 WHERE `id` = {$tagId}");
                        }
                  }
                  $i++;
            }
      }

      sleep(1);
      $data['status'] = 200;
      $data['message'] = $i . ' ' . $lang['admin_premium_games_installed'];
} else {
      $data['error_message'] = 'Something went wrong!';
}

function seo_friendly_url($string)
{
      $string = str_replace(array('[\', \']'), '', $string);
      $string = preg_replace('/\[.*\]/U', '', $string);
      $string = preg_replace('/&(amp;)?#?[a-z0-9]+;/i', '-', $string);
      $string = htmlentities($string, ENT_COMPAT, 'utf-8');
      $string = preg_replace('/&([a-z])(acute|uml|circ|grave|ring|cedil|slash|tilde|caron|lig|quot|rsquo);/i', '\\1', $string);
      $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/'), '-', $string);
      return strtolower(trim($string, '-'));
}
