<?php 

if ( !defined('R_PILOT') ) exit();
    
$catalog = file_get_contents( 'https://gamemonetize.com/feed.json' );

if ( !!$catalog ) {
    $games = json_decode($catalog, true);

    $i = 0;
    foreach( $games as $game ) {
        
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
            // $category = $game['category'];

            // if($category == "Arcade") {
            //       $category = "4";
            // }
            // if($category == "Action") {
            //       $category = "1";
            // }
            // if($category == "Puzzles") {
            //       $category = "5";
            // } 
            // if($category == "Multiplayer") {
            //       $category = "7";
            // }
            // if($category == "Shooting") {
            //       $category = "3";
            // } 
            // if($category == "Driving") {
            //       $category = "2";
            // }
            // if($category == "Sports") {
            //       $category = "8";
            // }
            // if($category == "Fighting") {
            //       $category = "9";
            // }

            /*
            // get thumb from the thumbserverfile
            $thumburl = $game_data['image'];
            $pinfo = pathinfo($thumburl);
            $extension = $pinfo['extension'];

            for($i=0;$i<count($sys_config["thumb_type"]);$i++){
                if($extension==$sys_config["thumb_type"][$i]){
                    $thumb_type=$i;
                    break;
                }
            }
            // $thumb= "../../../../images/".$title.".".$extension;
            $thumb= $config['site_url']. "/images/".$title.".".$extension;
            $thumburl1 = "/images/".$title.".".$extension;
                    
            $sp = fopen($thumb, "wb");
            fwrite($sp, GetUrlContent($thumburl));
            fclose($sp);
            */
            /*
            $thumburl = $game_data['image'];
            $pinfo = pathinfo($thumburl);
            $extension = $pinfo['extension'];

            $thumb= $config['site_url']. "/images/".$title.".".$extension;
            $thumburl1 = "/images/".$title.".".$extension;

            $ch = curl_init($thumburl);
            $fp = fopen($thumb, 'wb');
            curl_setopt($ch, CURLOPT_FILE, $fp);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_exec($ch);
            curl_close($ch);
            fclose($fp);
            */ 

            $thumburl = $game['thumb'];
            $pinfo = pathinfo($thumburl);
            $extension = $pinfo['extension'];

            $thumb= "../../../../images/" .$title.".".$extension;
            $thumburl1 = "/images/".$title.".".$extension;

            file_put_contents($thumb, file_get_contents($thumburl));

            $isSuccess = $GameMonetizeConnect->query("INSERT INTO ".GAMES." (
                catalog_id, 
                game_name, 
                name, 
                image, 
                import, 
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
                '{$thumburl1}',
                '1',
                '{$game_data['description']}',
                '{$array_item['instruction']}',
                '{$category}',
                '{$game_data['file']}',
                'html5',
                '{$game_data['width']}',
                '{$game_data['height']}',
                '{$time}', 
                '{$tags}',
                '0'
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

    sleep(0.7);

    $data['message'] = $i . ' ' . $lang['admin_premium_games_installed'];
} else {
    $data['error_message'] = 'Something went wrong!';
}

function seo_friendly_url($string){
    $string = str_replace(array('[\', \']'), '', $string);
    $string = preg_replace('/\[.*\]/U', '', $string);
    $string = preg_replace('/&(amp;)?#?[a-z0-9]+;/i', '-', $string);
    $string = htmlentities($string, ENT_COMPAT, 'utf-8');
    $string = preg_replace('/&([a-z])(acute|uml|circ|grave|ring|cedil|slash|tilde|caron|lig|quot|rsquo);/i', '\\1', $string );
    $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/') , '-', $string);
    return strtolower(trim($string, '-'));
}

function GetUrlContent($url){
    $fp = fopen($url, "rb");
    if (!$fp){
        echo "<font color=red>Could not access the file: ".$url.". </font>";
        return false;
    }
    $tmpfile="";
    while (!feof($fp)){
        $tmpfile .= fread($fp, 1024);
    }
    return $tmpfile;
}