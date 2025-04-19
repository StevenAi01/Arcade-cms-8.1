-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2025 at 04:59 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u319353809_xcmslite`
--

-- --------------------------------------------------------

--
-- Table structure for table `gm_account`
--

CREATE TABLE `gm_account` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `email` varchar(250) NOT NULL,
  `avatar_id` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `language` varchar(250) NOT NULL,
  `profile_theme` varchar(250) NOT NULL DEFAULT 'style-1',
  `ip` varchar(250) NOT NULL,
  `registration_date` int(11) NOT NULL,
  `last_logged` int(11) NOT NULL,
  `last_update_info` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL
) ENGINE=ROCKSDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_account`
--

INSERT INTO `gm_account` (`id`, `name`, `username`, `password`, `admin`, `email`, `avatar_id`, `xp`, `language`, `profile_theme`, `ip`, `registration_date`, `last_logged`, `last_update_info`, `active`) VALUES
(1, 'Administrator', 'gamemonetize', '97f6ceaefd1d070aa9bbe6bb422a8747b17163d1', '1', 'admin@admin.com', 0, 0, 'english', 'style-1', '::0', 1478417322, 1743267354, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `gm_ads`
--

CREATE TABLE `gm_ads` (
  `id` int(11) NOT NULL,
  `728x90` varchar(700) NOT NULL,
  `300x250` varchar(700) NOT NULL,
  `600x300` varchar(700) NOT NULL,
  `728x90_main` varchar(700) NOT NULL,
  `300x250_main` varchar(700) NOT NULL,
  `ads_video` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_ads`
--

INSERT INTO `gm_ads` (`id`, `728x90`, `300x250`, `600x300`, `728x90_main`, `300x250_main`, `ads_video`) VALUES
(1, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gm_blogs`
--

CREATE TABLE `gm_blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `post` text DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_categories`
--

CREATE TABLE `gm_categories` (
  `id` int(11) NOT NULL,
  `category_pilot` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` text NOT NULL,
  `image` varchar(400) NOT NULL,
  `footer_description` text DEFAULT '',
  `show_home` tinyint(1) NOT NULL DEFAULT 0,
  `total_games` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_categories`
--

INSERT INTO `gm_categories` (`id`, `category_pilot`, `name`, `image`, `footer_description`, `show_home`, `total_games`) VALUES
(1, 'action-games', 'Action Games', '/cat/action-games.jpg', 'In the realm of gaming, action represents a genre synonymous with heart-pounding excitement and relentless challenges that keep players on the edge of their seats. Action games are renowned for their fast-paced gameplay, where every moment counts and decisions can mean the difference between victory and defeat. Whether you\'re scaling towering cliffs in a high-octane environment or battling hordes of enemies in intense combat sequences, action games provide a visceral experience that draws players into a world of danger and thrill.<br /><br />Looking for an adrenaline rush and a place to indulge in action-packed entertainment? Look no further than <a href=\"https://www.bestcrazygames.com/category/action\" target=\"_new\" rel=\"noopener\">Action Games</a>, where you’ll find a massive selection of thrilling games to keep you entertained for hours. Whether you enjoy battling enemies, solving intense challenges, or testing your reflexes in fast-paced scenarios, this platform has it all. Explore various categories, compete with friends, and discover new favorites that will keep you coming back for more. Dive into the excitement now and unleash your inner action hero with games designed to captivate every player!<br /><br />Typically, action games are characterized by dynamic gameplay mechanics that require quick reflexes, strategic thinking, and a keen sense of timing. Players often find themselves navigating through visually stunning environments, utilizing a mix of melee and ranged combat techniques against formidable foes. The interaction between characters and the intricate design of levels ensures that no two encounters are the same. As you dive deeper into the game, you\'ll encounter increasingly challenging foes and puzzles that demand both finesse and courage.<br /><br />One of the most appealing aspects of action games is their ability to create a narrative experience through gameplay. Many titles feature compelling storylines that immerse players in a rich universe filled with memorable characters and epic quests. Whether it\'s a lone hero on a quest to save the world or a band of rebels fighting against a tyrannical regime, these narratives often accompany the adrenaline-fueled action, adding depth to the gameplay experience.<br /><br />Furthermore, action games also incorporate various elements such as exploration, puzzle-solving, and resource management, enhancing the overall dynamics and allowing players to engage in different styles of play. You might find yourself solving intricate puzzles to unlock new areas or scavenging for resources to upgrade your character’s abilities. This blend of action and strategy permits a more enriched gaming experience, appealing to a diverse audience.<br /><br />The multiplayer aspects of action games are another layer of excitement. Many titles support cooperative and competitive gameplay, enabling players to team up with friends or challenge each other in exhilarating matchups. The cooperation between allies or the thrill of facing off against other players elevates the adrenaline rush, enhancing the social aspects of gaming.<br /><br />In conclusion, the allure of the action genre lies in its ability to deliver exhilarating experiences filled with challenges, immersive storytelling, and unforgettable moments. Whether you\'re an experienced gamer or a newcomer, the action genre promises a thrilling adventure that is sure to leave you breathless. Strap in and prepare for a rollercoaster of excitement, where every second counts!', 1, 1978),
(2, 'racing-games', 'Racing Games', '/cat/racing-games.png', '\"Racing\" is an exhilarating genre that encapsulates high-speed competition, adrenaline-pumping action, and an insatiable drive for victory. Whether you\'re navigating sharp turns on a dirt track or speeding down a sleek highway, the essence of racing lies in its ability to push both man and machine to their limits. <br /><br />Racing games offer players the chance to indulge in their need for speed from the comfort of their own homes, featuring stunning graphics, realistic physics, and a variety of vehicles that range from nimble sports cars to powerful trucks. Gamers can choose from several racing modes, including time trials, traditional circuit races, and even thrilling off-road adventures. The diversity within the racing genre means there’s something for everyone, whether you\'re a seasoned racing enthusiast or a newcomer looking to burn some rubber.<br /><br />Rev your engines and get ready for an adrenaline rush with <a href=\"https://www.bestcrazygames.com/home/keyword/racing/popular\" target=\"_new\" rel=\"noopener\">Popular Racing Games</a>! This exhilarating collection features fast-paced tracks, thrilling competitions, and stunning vehicles that will satisfy every racing enthusiast. Whether you’re navigating through challenging terrains, competing against skilled opponents, or mastering the art of drifting, these games promise heart-pounding excitement and intense gameplay. Perfect for speed lovers and competitive players alike, this category offers endless entertainment as you race to the finish line. Buckle up, take control, and experience the ultimate thrill of racing today!<br /><br />One of the most compelling aspects of racing games is the variety of environments that players can explore. From sun-drenched highways to rain-soaked tracks, each setting offers its own unique challenges. Players must not only think about speed but also strategize around weather conditions, terrain types, and opponent behaviors. This dynamic interplay makes every race an unpredictable spectacle, where split-second decisions can make the difference between standing atop the podium or ending up in the losing lane.<br /><br />Multiplayer racing modes are another thrilling feature of modern racing titles. Compete against friends or players from across the globe, utilizing skill and tactics to outpace your opponents. Online leaderboards and competitive events allow racers to showcase their abilities and strive for glory. Community engagement through forums and live events adds an additional layer of excitement, as players can share strategies, trade tips, and discuss the latest updates in their favorite games.<br /><br />Many popular racing franchises continuously evolve, integrating cutting-edge technology and innovative gameplay mechanics. By harnessing advancements in virtual reality and augmented reality, some games provide immersive experiences that blur the lines between the virtual world and reality, putting players right in the driver’s seat.<br /><br />In conclusion, racing is more than just a game; it is a test of skill, strategy, and determination. It offers a captivating blend of speed, competition, and community, making it a beloved genre among gamers of all ages. So buckle up, hit the accelerator, and experience the thrill of racing like never before! For more information regarding the latest racing games,.', 1, 4201),
(3, 'shooting-games', 'Shooting Games', '/cat/shooting-games.jpg', 'Shooting is a dynamic and adrenaline-pumping activity that captivates enthusiasts across various domains, from sports to gaming and even cinematic experiences. At its core, shooting involves the precision use of firearms or projectile-launching devices to hit targeted objects. This multifaceted discipline can cater to different interests, whether one is drawn to the precision of marksmanship, the strategy behind tactical shooting, or the thrill of competitive events.<br /><br />In the realm of sports, shooting has evolved into a recognized discipline often featured in global competitions, such as the Olympics. Here, athletes showcase their skills in air rifle, pistol shooting, and shotgun events, where accuracy and control define success. Participants undergo rigorous training to develop their mental and physical capabilities, honing focus, breathing techniques, and muscle memory. Each competition culminates in an exhilarating atmosphere as shooters take their positions, measuring their breaths and heartbeats before each shot.<br /><br />On the other hand, shooting games, both virtual and real-world, tap into the excitement of this activity while integrating strategy, teamwork, and immersive environments. From first-person shooters like Battlefield and Call of Duty to immersive simulations, players are thrust into high-stakes scenarios requiring quick thinking and accurate aim. These games often highlight the importance of collaboration and communication, as players must work together to outsmart opponents and achieve their objectives. The digital realm provides an avenue for enthusiasts to engage with shooting mechanics safely while experiencing the thrill of battle.<br />Step into the action and test your aim with <a href=\"https://www.bestcrazygames.com/category/shooting/popular\" target=\"_new\" rel=\"noopener\">Popular Shooting Games</a>! This exciting collection offers adrenaline-pumping challenges, intense battles, and a variety of missions to keep you on the edge of your seat. Whether you’re into fast-paced gunfights, strategic sniper missions, or explosive combat scenarios, these games have it all. Perfect for thrill-seekers and competitive players, this category guarantees endless entertainment and opportunities to showcase your skills. Gear up, take aim, and immerse yourself in the ultimate shooting experience where every shot counts. Play now and dominate the battlefield!<br /><br />Cinematic portrayals of shooting further enhance its allure, showcasing it in a dramatic and often artistic manner. Films often depict shootouts with elaborate choreography, intense score, and gripping narratives that keep audiences on the edge of their seats. From action-packed blockbusters to gritty thrillers, the representation of shooting plays a crucial role in storytelling, immersing viewers into high-octane scenarios where every shot can change the course of events.<br /><br />Beyond entertainment, shooting also holds significance in law enforcement and self-defense contexts. Here, mastery over one\'s weapon is essential for ensuring safety and effectiveness in various situations. Training programs emphasize responsible use, emphasizing ethical considerations and the importance of understanding the impact that shooting can have in real life.<br /><br />Overall, shooting encompasses a diverse array of experiences that engage participants mentally, physically, and emotionally. Whether through sport, gaming, or cinema, the traditional act of shooting transcends boundaries, creating a multifaceted culture rich with excitement, tension, and camaraderie.', 1, 3030),
(4, 'arcade-games', 'Arcade Games', '/cat/arcade-games.jpg', 'Arcade is a vibrant and exhilarating world where the nostalgic charm of classic gaming meets the thrill of modern entertainment. It serves as a haven for gamers of all ages, providing an immersive experience that combines retro aesthetics with cutting-edge technology. When you step into an arcade, you’re greeted by the blaring melodies of coin-operated machines, the flashing lights that beckon you closer, and the palpable excitement of competition and camaraderie.<br /><br />At the heart of every arcade are its iconic games, from timeless classics like \"Pac-Man,\" \"Street Fighter,\" and \"Donkey Kong\" to the latest high-tech creations that push the boundaries of interactive gaming. Each machine stands as a portal to another universe, inviting players to test their skills and challenge their friends. Whether you’re battling it out in a racing game, solving puzzles, or exploring fantastical worlds, every moment in an arcade is filled with fun and adventure.<br /><br />In addition to traditional arcade games, many modern gaming centers have expanded their offerings to include a variety of attractions. Virtual reality stations transport players into fully immersive environments, where they can fight dragons, race futuristic vehicles, or solve complex mysteries. Escape rooms challenge teamwork and problem-solving skills, while redemption games offer the chance to win tickets that can be exchanged for exciting prizes. This diverse range of activities ensures that every visit to the arcade is unique and thrilling.<br /><br />Arcade culture thrives on community and social interaction. Friends gather to compete for high scores, families bond over retro games, and strangers often become allies as they join forces in multiplayer adventures. Events and tournaments add an extra layer of excitement, giving gamers the chance to showcase their skills and win accolades. Whether you’re a casual player or a serious competitor, there’s a space for everyone in the arcade.<br /><br />Moreover, the experience is enriched by the nostalgic ambiance and the smell of fresh popcorn wafting through the air, creating an inviting atmosphere that feels both familiar and exciting. Many arcades also offer a selection of snacks and beverages, ensuring that players can refuel during their gaming sessions.<br /><br />In summary, arcades are dynamic spaces that celebrate the joy of gaming through an eclectic mix of experiences. They blend nostalgia with innovation, providing a fun-filled environment for entertainment, competition, and socialization. Whether you’re reliving your childhood memories or discovering new favorites, an arcade promises unforgettable moments that keep you coming back for more.', 1, 7293),
(5, 'puzzle-games', 'Puzzle Games', '/cat/puzzle-games.jpg', 'Puzzle games have captivated players for centuries, offering a unique blend of challenge and entertainment. As one of the most versatile genres in the gaming world, puzzles come in various forms, from traditional jigsaw puzzles to intricate logic challenges and beyond. Engaging with puzzles is not just about solving problems; it\'s an immersive experience that stimulates the mind and encourages creative thinking.<br /><br />At its core, a puzzle game entices players to think critically and strategically. Each challenge presents an opportunity to explore different pathways, encouraging experimentation and perseverance. Whether you’re maneuvering pieces on a board or deciphering complex codes, the satisfaction derived from piecing everything together is unparalleled. The thrill of completing a difficult puzzle is comparable to unlocking a mystery—all the effort pays off in an exhilarating moment of triumph.<br /><br />One of the most appealing aspects of puzzle games is their accessibility. Players of all ages can enjoy them, as they often come with varying difficulty levels. This inclusivity makes puzzles a fantastic choice for family game nights or casual gaming with friends. Whether you\'re collaborating on a massive jigsaw puzzle or competing in fast-paced challenges, there’s always a way to enjoy the experience together. <br /><br />Furthermore, many modern puzzle games incorporate stunning visuals and engaging storylines, enhancing the overall experience. From vibrant graphics to immersive soundscapes, these games create a captivating environment that draws players in. Many titles leverage different themes and narratives, inviting players to embark on journeys filled with intrigue, adventure, and suspense, all while unraveling cleverly crafted puzzles.<br /><br />In recent years, the rise of mobile technology has made puzzle games more accessible than ever. With a myriad of apps available, players can enjoy puzzles on the go, transforming mundane moments into engaging challenges. Whether you find yourself on a lengthy commute or waiting in line, these bite-sized puzzle experiences offer a great way to keep your mind sharp.<br /><br />Online platforms and multiplayer modes also add a new dimension to traditional puzzles, allowing players to connect with others worldwide. Competing against friends or collaborating on challenging tasks fosters camaraderie and can lead to unforgettable gaming moments.<br /><br />In summary, puzzle games are not only about finding solutions; they are about embracing the journey of logic, creativity, and collaboration. So whether you\'re a seasoned puzzler or new to the genre, dive into the captivating world of puzzle games and discover the joy and excitement that await you.', 1, 5909),
(6, 'strategy-games', 'Strategy Games', '/cat/strategy-games.png', 'In the dynamic world of gaming, strategy forms the backbone of success. It encompasses the meticulous planning and clever execution needed to outsmart opponents, conquer challenges, and achieve victory. Whether you’re navigating a battlefield, managing resources in a civilization, or devising intricate tactics in a card game, mastering strategy is essential for gamers who aspire to elevate their gameplay.<br /><br />At its core, strategy is about understanding the landscape of the game, analyzing your options, and making informed decisions to gain an advantage. Players must identify their strengths and weaknesses while adapting to the evolving circumstances that unfold during competition. Successful strategists utilize critical thinking skills to evaluate potential outcomes, predict competitors\' moves, and capitalize on opportunities as they arise.<br /><br />One of the fundamental components of strategy is the ability to adapt. No plan is foolproof, and unforeseen variables can disrupt even the best-laid strategies. This is where flexibility comes into play. A good strategist is not only equipped with an initial plan but is also prepared to revise it in response to new information or changing conditions. The capacity to pivot quickly can be the difference between triumph and defeat.<br /><br />Moreover, strategic thinking transcends simple calculations and tactical maneuvers. It involves psychological elements, such as reading opponents\' behaviors and intentions. By understanding their thought processes, you can anticipate their actions and craft counter-strategies to thwart them. This mental chess expands your gameplay from mere mechanics to a cerebral duel, enriching your gaming experience.<br /><br />Collaboration also plays a pivotal role in strategy. In multiplayer settings, effective communication and teamwork can enhance your strategies, leading to synergistic plays that maximize your group’s potential. Convincing allies to follow a particular strategy requires charisma and a solid understanding of each team member\'s capabilities.<br /><br />Furthermore, different genres of games offer unique strategic challenges. In real-time strategy (RTS) games, players face the pressure of rapid decision-making and resource management, while turn-based strategy (TBS) games emphasize deep planning and foresight. Each genre presents its own set of strategic dilemmas, pushing players to think critically and engage with the game on a deeper level.<br /><br />Ultimately, mastering strategy transforms gaming from a mere pastime into an exhilarating intellectual pursuit. As players refine their strategic skills, they unlock new levels of enjoyment and satisfaction, making each victory more rewarding.', 1, 0),
(7, 'multiplayer-games', 'Multiplayer Games', '/cat/multiplayer-games.jpg', '&lt;b&gt;Multiplayer Gaming: A Thrilling Collective Experience&lt;/b&gt;<br /><br />Multiplayer gaming has transformed the landscape of interactive entertainment, offering players the chance to dive into worlds filled with action, strategy, and camaraderie. Whether you’re teaming up with friends or facing off against rivals from around the globe, multiplayer experiences elevate the excitement and engagement of gameplay. With the advent of online connectivity, gamers can connect, communicate, and compete in real-time, creating a dynamic environment that fosters teamwork and competition.<br /><br />In multiplayer formats, players often assume various roles within a game, making strategic decisions that can influence the outcome of matches. These dynamics are especially prevalent in genres like first-person shooters, battle royales, and massive online battle arenas (MOBAs) where cooperation and strategy are essential. Gamers can utilize voice chat systems, in-game messaging, and social media platforms to strategize with teammates or taunt opponents, adding layers of interaction that single-player modes simply do not offer.<br /><br />One of the key aspects of multiplayer gaming is its ability to forge friendships. Joining forces with friends online can amplify the fun, creating shared memories of victory and defeat. This social aspect is reinforced through platforms that allow players to form clans, guilds, or teams, enhancing the sense of belonging and community. Regular tournaments and events also encourage players to engage actively, fostering an environment where skills can be honed and celebrated.<br /><br />Not only does multiplayer gaming connect friends, but it also opens up opportunities to meet new people from diverse backgrounds. With a global player base, the multiplayer gaming community thrives on collaborative interaction, where players can share tips, strategies, and stories. This diversity enriches the gaming experience, presenting challenges and viewpoints that players may not encounter in their local communities.<br /><br />Furthermore, the rise of esports has taken multiplayer gaming to new heights. Tournaments featuring top players compete for substantial prizes and recognition, captivating audiences worldwide. Watching these events, fans can cheer on their favorite teams and players, adding to the thrill of competition and deepening their engagement with specific games.<br /><br />In conclusion, multiplayer gaming stands at the forefront of modern entertainment, blending competition, teamwork, and community. Whether you seek the adrenaline rush of competitive gameplay or the joy of connecting with friends, the multiplayer experience offers something for everyone. Discover the possibilities and immerse yourself in the vibrant world of multiplayer gaming.', 1, 617),
(8, 'sports-games', 'Sports Games', '/cat/sports-games.png', 'Sports is a dynamic and exhilarating aspect of human culture that transcends boundaries and unites individuals from diverse backgrounds. As an organized form of physical activity, sports encompass a wide array of disciplines and skills, ranging from team games like soccer and basketball to individual competitions such as athletics and gymnastics. The fundamental appeal of sports lies in their ability to foster a sense of camaraderie, build discipline, and promote physical fitness.<br /><br />At the heart of sports is the spirit of competition. Athletes train rigorously, often dedicating countless hours to perfect their skills and techniques. This commitment not only enhances their physical abilities but also instills a strong work ethic and a desire to achieve excellence. Whether it’s the thrill of scoring a last-minute goal or the adrenaline rush of crossing the finish line, the emotional highs and lows of participating in sports create lifelong memories for players and fans alike.<br /><br />Sports also serve as a powerful means of cultural expression. Traditional games reflect the values and history of different societies, showcasing unique customs and practices. From the ancient Olympic Games in Greece to the modern-day World Cup, sports have the power to bring people together, fostering a shared sense of identity and purpose. Major international events, like the Olympics or the FIFA World Cup, draw millions of viewers, celebrating the spirit of competition and sportsmanship across the globe.<br /><br />Moreover, sports play a pivotal role in promoting health and wellness. Engaging in physical activities can significantly improve one’s overall health, reducing the risk of chronic diseases, enhancing mental well-being, and boosting self-esteem. Moreover, participating in sports encourages teamwork and social interaction, vital components for a healthy lifestyle.<br /><br />In recent years, the rise of technology in the sports industry has further transformed how athletes train and compete. The integration of advanced analytics, wearable technology, and digital platforms has revolutionized coaching strategies and enhanced performance monitoring. This evolution allows athletes to push their limits further while ensuring safety and maximizing their potential.<br /><br />Overall, sports encapsulate the essence of human perseverance and passion. They offer a plethora of benefits, from enhancing physical health to fostering lifelong friendships. Whether you’re an athlete, a passionate fan, or a casual observer, the world of sports provides a rich tapestry of experiences that celebrate the human spirit.', 0, 1817),
(9, 'fighting-games', 'Fighting Games', '/cat/fighting-games.png', '&lt;b&gt;Fighting: A Journey into the Heart of Combat&lt;/b&gt;<br /><br />Fighting is an ancient practice that transcends cultures and eras, embodying the spirit of resilience and the quest for mastery. From the primal instincts of self-defense to organized sports showcasing discipline and skill, the world of fighting encompasses a wide range of techniques, styles, and philosophies. <br /><br />At its core, fighting is a form of expression—one that communicates strength, strategy, and endurance. It has evolved from the raw bouts seen in prehistoric times to a refined array of martial arts, including boxing, wrestling, Brazilian Jiu-Jitsu, Muay Thai, and mixed martial arts (MMA). Each discipline offers its unique approaches, training methods, and competitive frameworks, inviting practitioners to explore their physical and mental limits.<br /><br />Modern fighting goes beyond mere combat; it fosters personal growth and community. Training in martial arts instills values such as respect, humility, and perseverance. Practitioners learn not only how to fight but also how to control their emotions, handle pressure, and appreciate the importance of discipline. This holistic development is crucial—not just for athletes—who may one day enter the ring or cage, but also for individuals seeking a structured path to improve their physical fitness and mental fortitude.<br /><br />In addition to physical benefits, the martial arts community emphasizes camaraderie. Training with others cultivates friendships, trust, and mutual respect. Gyms and dojos become places where individuals gather to share knowledge, support one another, and celebrate achievements, fostering a sense of belonging that transcends the sport itself.<br /><br />Fighting arts also capture the imagination of many through cinematic portrayals and competitive events. Iconic films and popular shows bring fighters to the forefront, illustrating both the beauty and brutality of combat. Championships and tournaments elevate the sport, showcasing elite athletes who dedicate their lives to achieving greatness in the ring. These events provide exhilarating entertainment while highlighting the incredible skill and strategy involved in fighting.<br /><br />Furthermore, fighting serves as a compelling metaphor for life\'s challenges. It teaches us that every struggle is an opportunity for growth, and every setback is a lesson in resilience. Whether through a training session, a competition, or a sparring match, practitioners are reminded that success lies not just in victory but in the journey itself.<br /><br />In conclusion, fighting is much more than a physical confrontation; it is a profound journey of self-discovery and empowerment. Whether you are a seasoned competitor or a curious newcomer, the world of combat awaits, ready to challenge and inspire you.', 0, 268),
(10, 'girls-games', 'Girls Games', '/cat/girls-games.jpg', '				\r\n				', 0, 55),
(11, 'hypercasual-games', 'Hypercasual Games', '/cat/hypercasual-games.jpg', '				\r\n				', 0, 177),
(12, 'boys-games', 'Boys Games', '/cat/boys-games.jpg', '				\r\n				', 0, 2),
(13, 'adventure-games', 'Adventure Games', '/cat/adventure-games.jpg', '				\r\n				', 0, 42),
(14, 'bejeweled-games', 'Bejeweled Games', '/cat/bejeweled-games.jpg', '				\r\n				', 0, 2),
(15, 'clicker-games', 'Clicker Games', '/cat/clicker-games.jpg', '				\r\n				', 0, 36),
(16, 'cooking-games', 'Cooking Games', '/cat/cooking-games.jpg', '				\r\n				', 0, 2),
(17, 'soccer-games', 'Soccer Games', '/cat/soccer-games.jpg', '				\r\n				', 0, 2),
(18, 'stickman-games', 'Stickman Games', '/cat/stickman-games.jpg', '				\r\n				', 0, 0),
(19, 'io-games', '.IO Games', '/cat/io-games.jpg', '				\r\n				', 0, 0),
(20, '3d-games', '3D Games', '/cat/3d-games.jpg', '				\r\n				', 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `gm_chatgpt`
--

CREATE TABLE `gm_chatgpt` (
  `id` int(11) NOT NULL,
  `api_key` varchar(200) DEFAULT NULL,
  `template_game` text DEFAULT NULL,
  `template_category` text DEFAULT NULL,
  `template_tags` text DEFAULT NULL,
  `template_footer` text DEFAULT NULL,
  `random_words_before_tags` varchar(1000) DEFAULT NULL,
  `random_words_after_tags` varchar(1000) DEFAULT NULL,
  `chatgpt_model` varchar(100) NOT NULL DEFAULT 'gpt-3.5-turbo',
  `maximum_words` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_chatgpt`
--

INSERT INTO `gm_chatgpt` (`id`, `api_key`, `template_game`, `template_category`, `template_tags`, `template_footer`, `random_words_before_tags`, `random_words_after_tags`, `chatgpt_model`, `maximum_words`) VALUES
(1, 'here add your chatgpt api, login here and buy 10$ API and will work around 20k games to rewrite with 200 words per each description , on this link you can buy API https://platform.openai.com/settings/', 'Rewrite this $description in 100 words.', 'Write 300 words description related to this title $title.\n', 'Write 500 words description related this title $title.', '', '', '', 'gpt-4o-mini', 9009);

-- --------------------------------------------------------

--
-- Table structure for table `gm_footer_description`
--

CREATE TABLE `gm_footer_description` (
  `id` int(11) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `page_url` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `has_content` enum('1','0') NOT NULL DEFAULT '0',
  `content_value` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_footer_description`
--

INSERT INTO `gm_footer_description` (`id`, `page_name`, `page_url`, `description`, `has_content`, `content_value`) VALUES
(1, 'home', '/', '<p>Are you tired of the same old games that offer little excitement? Look no further! Our collection of <strong>crazy games unblocked</strong> is packed with thrilling, action-packed adventures and mind-bending puzzles that will keep you hooked for hours. Whether you\'re a fan of high-speed racing or intense first-person shooters, we have something for everyone.</p>\r\n<p>Explore our <strong>crazy dress-up games</strong>, where you\'ll find titles that challenge your creativity and keep you on the edge of your seat. From racing games that test your reflexes to immersive action-packed shooters, there\'s no shortage of adrenaline-pumping fun. And with our <strong>unblocked versions</strong>, you can enjoy these crazy games anywhere, anytime.</p>\r\n<p>One of the standout categories in our collection is <strong>crazy fashion games</strong>. Get ready to dive into blocky worlds filled with endless possibilities. Build, explore, and survive in lush forests or desolate deserts. With multiplayer options available, you can team up with friends for a unique and unforgettable experience.</p>\r\n<p>But it’s not all about the latest trends – we also have a fantastic selection of <strong>crazy games in Spanish</strong>, offering a variety of experiences that will challenge your skills and reflexes. Whether you\'re playing classic card games like <strong>Crazy Uno</strong> or aiming for victory in archery competitions, there\'s something for everyone to enjoy.</p>\r\n<p>If you\'re looking for fresh content, check out our latest additions, including <strong>crazy games 3</strong>. From fast-paced action to intricate puzzles, there’s no shortage of new experiences to explore. Try <strong>Smash Karts</strong>, a wildly fun multiplayer game, and discover your next obsession!</p>\r\n<p>Need a break from the ordinary? Jump into the world of <strong>Crazy Games Shell Shockers</strong>! This multiplayer shooter will keep you on your toes as you battle players from around the globe. With a variety of weapons and game modes, the action never stops.</p>\r\n<p>We also offer a fantastic range of <strong>crazy games in Arabic</strong>. Whether you\'re into strategy games, puzzle challenges, or classic arcade titles, you’ll find plenty to love in this diverse collection.</p>\r\n<p>If you\'re a fan of precision, try <strong>Crazy Archery Games</strong>, where you can test your aim in a series of challenging levels. With realistic physics and intuitive controls, you\'ll feel like a true archery master. Plus, with multiplayer options, you can challenge friends to see who’s the best shot!</p>\r\n<p>For a more laid-back experience, explore our selection of <strong>crazy game apps</strong>. From relaxing puzzles to addictive match-three games, there\'s something for everyone. Play whenever and wherever you want with easy-to-use touch controls – no console required!</p>\r\n<p>Ready to discover more? Check out <strong>Crazy Among Us</strong> games for a mix of strategy and fun. Whether you\'re playing solo or with friends, the excitement never ends.</p>\r\n<p>Looking for something new? Dive into <strong>Crazy Air Wars 3</strong>, where you can pilot a fighter jet and engage in epic dogfights with players around the world. It\'s an action-packed experience you won’t want to miss.</p>\r\n<p>For fans of strategy, <strong>Crazy Airport Security</strong> offers a thrilling challenge. Stay vigilant, make quick decisions, and protect your airport in this realistic simulation.</p>\r\n<p>If you love action and adventure, we also have <strong>Crazy Assault Bots</strong> – intense, strategic games where you’ll face off against challenging opponents. Whether you\'re into first-person shooters or strategic tower defense, our collection has something for every kind of gamer.</p>\r\n<p>Looking for a puzzle to solve? Try <strong>Crazy PuzzleBlock Games</strong> for a brain-teasing challenge that will keep you thinking.</p>\r\n<p>For a bit of competitive fun, <strong>Crazy Basketball Games</strong> like <strong>Basketball Stars</strong> let you hit the court and show off your skills in fast-paced, arcade-style games. Whether you\'re into hoops or high-speed racing, there’s a game here for you.</p>\r\n<p>Not into basketball? No problem! From <strong>Crazy Racing Games</strong> to <strong>Crazy Strategy Games</strong>, we’ve got you covered. The best part? All of these games are free to play, directly in your browser – no downloads or installations required. Start playing today and discover your next favorite game.</p>\r\n<p>And for those who crave something truly wild, check out <strong>Crazy Bullet Force</strong> – an adrenaline-fueled first-person shooter that’ll put your combat skills to the test.</p>\r\n<p>Ready for more? Our ever-growing collection of <strong>crazy girls games</strong> and <strong>basketball-themed games</strong> are perfect for players of all ages. Whether you\'re into strategy, puzzles, or action-packed fun, we have something for you.</p>\r\n<p>So why wait? Explore our collection of <strong>crazy games</strong> today and dive into a world of endless entertainment and excitement!</p>', '0', ''),
(2, 'new games', '/new-games', '<p>CrazyGames is an exciting, dynamic platform that\'s constantly updated with fresh, engaging content, making it the perfect destination for gamers eager to try out the latest titles in online gaming—no downloads or annoying ads required. The <strong>New Games</strong> section is regularly refreshed, ensuring there’s always something new and thrilling to dive into. Featuring a broad range of genres, from action and adventure to puzzles and sports, it caters to every type of gamer.</p>\r\n<p>Some of the standout new additions include <em>Secrets of Charmland</em>, <em>Shoe Race</em>, and <em>Steam City</em>, each offering distinct gameplay and challenges. For players craving high-stakes action, <em>Dino Survival: 3D Simulator</em> and <em>Death City Zombie Invasion</em> provide intense, immersive survival scenarios. Fans of strategy will enjoy <em>Chicken CS</em>, while <em>Mystical Blade</em> takes players deep into fantasy combat for a truly epic experience.</p>\r\n<p>Beyond individual titles, CrazyGames offers a wide variety of game categories, ranging from action-packed shooters to mind-bending puzzles and competitive sports games. Whether you\'re looking for a quick solo challenge or a multiplayer showdown, CrazyGames provides a rich selection of games playable directly in your browser, on both desktop and mobile devices.</p>\r\n<p>If you’re eager to explore these exciting new releases, visit CrazyGames’ <strong>New Games</strong> page to check out the full list and find your next favorite game.</p>\r\n<p>For a truly unique experience, dive into <em>Hospital Stories: Doctor Soccer</em>, a game where you take on the dual roles of a soccer-loving doctor managing a hospital emergency room. You’ll need to treat patients while balancing the chaotic demands of the medical and sporting worlds. It’s a thrilling mix of sports and medical drama that’s sure to keep you on your toes.</p>\r\n<p>Embrace the magic of the season with <em>New Year Santa Claus</em>, a heartwarming game where you help Santa deliver gifts to children across snowy landscapes, spreading joy and holiday cheer along the way. Its charming visuals and festive spirit make it perfect for players of all ages.</p>\r\n<p>For those who prefer darker adventures, our <strong>Vampire Games</strong> collection offers a gripping mix of mystery, danger, and intrigue. Battle undead creatures and explore ominous landscapes in these atmospheric games that will keep you on the edge of your seat.</p>\r\n<p>Looking to discover the latest games? Our expansive collection of <strong>new games</strong> is tailored for a variety of platforms, so no matter whether you\'re gaming on a laptop, PC, or Android device, there’s something to suit every taste and device type.</p>\r\n<p>If you\'re after the most realistic and engaging new games that can be played unblocked at school, you’re in luck. Our curated selection of games delivers immersive experiences with high-quality graphics and gameplay that are perfect for school breaks. These top-tier titles will captivate and entertain you while you’re away from the classroom.</p>\r\n<p>For those gaming on laptops, our collection features cutting-edge titles optimized for a smooth, immersive experience. With stunning visuals and challenging gameplay, you’ll be hooked for hours as you navigate intricate storylines and test your skills.</p>\r\n<p>If you enjoy playing games directly on your laptop, our platform offers an impressive selection of titles that are tailored for smooth gameplay. From action-packed adventures to mind-bending puzzles and strategic challenges, there’s something for every gamer.</p>\r\n<p>Looking for fun, new games you can play for free, online? Our platform offers a wealth of options that require no downloads or installations. Simply pick your game, and start playing instantly! Explore an endless array of entertainment with our vast collection of free-to-play games.</p>\r\n<p>For Android users, we’ve curated a range of exciting, new games that offer the perfect blend of innovation and excitement. Whether you’re into racing, puzzles, or RPGs, our collection will keep you entertained for hours. Download these games onto your device and dive into the action.</p>\r\n<p>If you\'re a PC gamer, our platform is the perfect place to find top-tier games that push the boundaries of visual and gameplay design. From AAA titles to indie gems, our collection includes games that will immerse you in their worlds, offering something for every type of gamer.</p>\r\n<p>Looking for a seamless gaming experience on your PC? Our user-friendly platform provides a vast library of online games optimized for PC gaming. Whether you prefer single-player experiences or multiplayer challenges, you\'ll find endless fun with smooth performance and minimal lag.</p>\r\n<p>And if you\'re in need of fun, unblocked games to play during school, we’ve got you covered. Our collection of school-friendly games offers engaging, entertaining experiences that are safe for all ages. Whether you enjoy puzzles, sports, or adventure, there’s something for everyone to enjoy during your break.</p>', '0', ''),
(3, 'best games', '/best-games', '<p>Looking for the <strong>best games to play online</strong>? You\'ve come to the right place! Whether you\'re into thrilling adventures, creative activities, or adrenaline-packed action, we\'ve curated a selection of top games that will keep you entertained for hours. Here are some must-try titles for every kind of gamer.</p>\r\n<h3>1. <strong>Driving In Big City</strong></h3>\r\n<p>If you\'re a fan of driving games, <em>Driving In Big City</em> is a must-play. It offers a realistic driving experience in a vibrant, bustling city where you can test your skills behind the wheel. Race through traffic, explore the city, and see how fast you can navigate the streets.</p>\r\n<h3>2. <strong>Best Coloring Book</strong></h3>\r\n<p>Unleash your creativity with <em>Best Coloring Book</em>. If you enjoy relaxing and artistic gameplay, this game lets you create stunning masterpieces with a wide variety of coloring tools and intricate designs. Perfect for those looking to unwind and express their creativity.</p>\r\n<h3>3. <strong>Crazy Games</strong></h3>\r\n<p>For those who crave heart-pounding action, <em>Crazy Games</em> has something for you. With a mix of intense action, challenging puzzles, and wacky gameplay, these games will keep you on the edge of your seat. Perfect for players looking for excitement and fun.</p>\r\n<h3>4. <strong>Five Nights at Horror Games</strong></h3>\r\n<p>For fans of horror and suspense, <em>Five Nights at Horror Games</em> offers a spine-tingling experience. Can you survive the night in creepy, dark environments filled with terrifying creatures? Test your nerves and see if you can make it through without being caught.</p>\r\n<h3>5. <strong>Best Browser for Gaming</strong></h3>\r\n<p>Wondering which browser is best for gaming? Popular choices include <strong>Chrome</strong>, <strong>Firefox</strong>, and <strong>Safari</strong>. Each browser provides a smooth, seamless experience for playing your favorite <strong>Best Games</strong>. It\'s all about personal preference, but these options are reliable for gaming.</p>\r\n<h3>6. <strong>3D Games for Kids</strong></h3>\r\n<p>Looking for fun and engaging <strong>3D games for kids</strong>? There are plenty of child-friendly games with immersive gameplay that not only entertain but also promote creativity and learning. These games are designed to keep young players engaged with interactive features and fun environments.</p>\r\n<h3>7. <strong>Best Free Browser Games</strong></h3>\r\n<p>The internet is full of amazing <strong>free browser games</strong>! Whether you love puzzle games, action-packed adventures, or sports simulations, there are plenty of free options available that you can enjoy directly in your browser. No downloads, no payments—just pure fun.</p>\r\n<h3>8. <strong>Best Free Online Games for School</strong></h3>\r\n<p>If you\'re looking for <strong>free online games</strong> to play during school breaks, there are tons of educational and entertaining options available. These games help promote critical thinking and problem-solving skills, making them perfect for a quick study break or to unwind after class.</p>\r\n<h3>9. <strong>Best Free Android Games</strong></h3>\r\n<p>Explore the <strong>best free Android games</strong> available on the Google Play Store. From puzzle games to action-packed adventures, there\'s something for everyone. Download and play on your Android phone or tablet for endless entertainment on the go.</p>\r\n<h3>10. <strong>Poki Best Games for Laptop</strong></h3>\r\n<p>If you prefer gaming on your laptop, <strong>Poki Best Games</strong> is a great platform to explore. Poki.com offers a wide range of online games optimized for laptops and desktop computers, providing hours of entertainment across all genres.</p>\r\n<h3>11. <strong>Unblocked Crazy Games at School</strong></h3>\r\n<p>Want to play some <strong>crazy games unblocked</strong> at school? There are several websites offering a selection of unblocked games, which you can enjoy during your free periods or study breaks. Have fun while being mindful of your school’s policies.</p>\r\n<h3>12. <strong>Fun Free Games Online</strong></h3>\r\n<p>Looking for <strong>free online games</strong> that are fun and easy to play? Explore a wide variety of titles that can be played directly from your browser. Whether you\'re into casual puzzles, strategic gameplay, or fast-paced action, there\'s something for everyone.</p>\r\n<h3>13. <strong>Best Unblocked Games at School</strong></h3>\r\n<p>Curious about the <strong>best free unblocked games at school</strong>? From classic arcade games to modern titles, there are plenty of options that let you enjoy hours of entertainment without any restrictions. These games are perfect for quick breaks during the school day.</p>\r\n<h3>14. <strong>Free Offline Games</strong></h3>\r\n<p>If you\'re looking to enjoy games without needing an internet connection, many <strong>free offline games</strong> are available for download on your mobile device. Whether you\'re traveling or just want to play without a Wi-Fi connection, these games offer immersive experiences for hours of enjoyment on the go.</p>\r\n<h3>Final Thoughts</h3>\r\n<p>With so many exciting options available, you\'ll never run out of games to play! Whether you\'re into <strong>creative activities</strong>, <strong>adrenaline-pumping challenges</strong>, or <strong>immersive adventures</strong>, there’s a game here for everyone. Play <strong>Best Games</strong> online, offline, or on the go—endless fun awaits!</p>', '0', ''),
(4, 'featured games', '/featured-games', '<p>Are you in search of <strong>the best games</strong> for non-stop fun and excitement? Look no further! We’ve curated a list of top gaming titles that cater to a wide range of interests and preferences, ensuring there\'s something for everyone.</p>\r\n<h3>1. <strong>Driving In Big City</strong></h3>\r\n<p>For fans of driving games, <em>Driving In Big City</em> offers an immersive experience where you can navigate the bustling streets of a vibrant city. Put your skills to the test as you race against time, dodge traffic, and experience the thrill of urban driving.</p>\r\n<h3>2. <strong>Best Coloring Book</strong></h3>\r\n<p>If you\'re looking for a more relaxed gaming experience, <em>Best Coloring Book</em> is perfect for unleashing your inner artist. With an array of intricate designs and vibrant color options, you can create stunning, personalized artwork at your own pace, making it the ultimate creative escape.</p>\r\n<h3>3. <strong>Crazy Games</strong></h3>\r\n<p>For those who crave fast-paced action and intense challenges, <em>Crazy Games</em> is where you’ll find endless excitement. Packed with thrilling gameplay and wacky challenges, these games will keep you engaged and on the edge of your seat for hours.</p>\r\n<h3>4. <strong>Five Nights at Horror Games</strong></h3>\r\n<p>Step into the chilling world of <em>Five Nights at Horror Games</em>. This spine-tingling series will test your nerves as you face creepy creatures lurking in the dark. Survive the night and outwit the horrors in a truly terrifying experience.</p>\r\n<h3>5. <strong>Best Browser Games</strong></h3>\r\n<p>Looking for <strong>browser-based games</strong> that you can play directly from your browser? We’ve got you covered with a selection of titles that cater to all types of gamers. Whether you enjoy strategy, action, or puzzles, these games offer something for everyone, all without needing to download anything.</p>\r\n<h3>6. <strong>3D Games for Kids</strong></h3>\r\n<p>Kids can enjoy a range of fun and educational <strong>3D games</strong> that not only entertain but also enhance their learning. From action-packed adventures to brain-teasing puzzles, these games provide an interactive and engaging experience that sparks creativity and critical thinking.</p>\r\n<h3>7. <strong>Free Best Games on Browser</strong></h3>\r\n<p>Why spend money when you can enjoy the best <strong>free browser games</strong>? With a vast collection of titles available at your fingertips, you can dive into exciting worlds and challenging puzzles without spending a penny. It’s endless entertainment at no cost!</p>\r\n<h3>8. <strong>Free Games to Play at School</strong></h3>\r\n<p>Looking for <strong>free online games</strong> to play at school? Whether it\'s a quick break between classes or some downtime during lunch, you\'ll find a variety of entertaining titles that let you relax and have fun while still being suitable for school environments.</p>\r\n<h3>9. <strong>Best Free Android Games</strong></h3>\r\n<p>If you’re on the go, explore the <strong>best free Android games</strong> available in the Google Play Store. With high-quality graphics and engaging gameplay, you can enjoy hours of entertainment right from your smartphone or tablet, no matter where you are.</p>\r\n<h3>10. <strong>Poki Games for Laptops</strong></h3>\r\n<p>For those who prefer gaming on a larger screen, <em>Poki Best Games</em> offers an excellent selection of games optimized for <strong>laptops and PCs</strong>. Whether you love action, strategy, or simulation games, you\'ll find a variety of genres that are perfect for long gaming sessions.</p>\r\n<h3>11. <strong>Unblocked Crazy Games at School</strong></h3>\r\n<p>Enjoy <strong>crazy games unblocked</strong> at school! These games are perfect for school breaks or free periods. With a variety of exciting challenges and fun gameplay, you can have a blast while staying entertained between classes.</p>\r\n<h3>12. <strong>Fun Free Games Online</strong></h3>\r\n<p>Looking to have fun with friends? Explore <strong>fun free games online</strong> that let you enjoy multiplayer experiences and friendly competition. With a wide range of genres, you can team up or challenge your buddies in thrilling online games.</p>\r\n<h3>13. <strong>Best Unblocked Games at School</strong></h3>\r\n<p>Want to know what the best <strong>unblocked games at school</strong> are? We\'ve compiled a selection of titles that are both safe and fun, allowing you to enjoy gaming during school hours without restrictions. Perfect for quick breaks and moments of downtime!</p>\r\n<h3>14. <strong>Offline Best Games</strong></h3>\r\n<p>No internet? No problem! Discover the best <strong>offline games</strong> that you can play on your mobile device anytime, anywhere. From immersive adventures to addictive puzzles, these games offer endless entertainment without needing an internet connection.</p>\r\n<p>Dive into these <strong>best games</strong> today and explore exciting worlds, engaging challenges, and hours of entertainment tailored to your gaming preferences! Whether you\'re at home, at school, or on the go, there’s a game here for everyone.</p>', '0', ''),
(5, 'played games', '/played-games', '<p>Looking for the <strong>best games to play online</strong>? You’ve come to the right place! Our handpicked collection of top games spans a variety of genres and styles, ensuring there\'s something for every gamer’s taste.</p>\r\n<h3>1. <strong>Driving In Big City</strong></h3>\r\n<p>Experience the thrill of urban driving in <em>Driving In Big City</em>. Race against time, navigate through busy streets, and test your skills behind the wheel in this adrenaline-charged game. Perfect for those who love fast-paced action and challenges on the open road.</p>\r\n<h3>2. <strong>Best Coloring Book</strong></h3>\r\n<p>Unleash your inner artist with <em>Best Coloring Book</em>. Bring intricate designs to life by adding vibrant colors to detailed illustrations, creating beautiful and unique artworks that reflect your creativity. A relaxing yet rewarding experience for all ages.</p>\r\n<h3>3. <strong>Crazy Games</strong></h3>\r\n<p>For a dose of fun and chaos, dive into <em>Crazy Games</em>. Packed with wacky challenges, unpredictable gameplay, and endless entertainment, this collection will keep you hooked for hours, offering a mix of thrilling and hilarious experiences.</p>\r\n<h3>4. <strong>Five Nights at Horror Games</strong></h3>\r\n<p>Brace yourself for spine-chilling suspense in <em>Five Nights at Horror Games</em>. Can you survive a series of terrifying challenges in a haunted world? Test your courage and quick thinking as you face creepy encounters that will keep you on the edge of your seat.</p>\r\n<h3>5. <strong>Best Browser for Best Games</strong></h3>\r\n<p>Wondering which browser is ideal for gaming? Explore the world of online gaming platforms and find the perfect browser that offers smooth performance, fast load times, and the best gaming experience for all your favorite online games.</p>\r\n<h3>6. <strong>Best Games for Kids</strong></h3>\r\n<p>Kids can enjoy immersive 3D gaming experiences with <em>Best Games</em>. From exciting action-packed adventures to brain-boosting educational puzzles, these games are designed to engage and entertain young players, providing hours of fun and learning.</p>\r\n<h3>7. <strong>Best Free Browser Games</strong></h3>\r\n<p>Discover the world of <strong>free browser games</strong> with <em>Best Games</em>. Embark on epic quests, solve challenging puzzles, and battle fierce enemies without spending a dime. The possibilities are endless in the world of free-to-play online gaming.</p>\r\n<h3>8. <strong>Best Games for School</strong></h3>\r\n<p>Looking for fun games to play during your school breaks? <em>Best Games</em> offers a wide variety of online games that are perfect for winding down and having a bit of fun during your downtime at school. Enjoy engaging puzzles, action-packed challenges, and more—all for free!</p>\r\n<h3>9. <strong>Best Free Android Games</strong></h3>\r\n<p>Explore the best free Android games on the <strong>Google Play Store</strong>. Whether you\'re into action, strategy, or adventure, you\'ll find mobile games that suit your taste, offering endless hours of entertainment on your smartphone or tablet.</p>\r\n<h3>10. <strong>Poki Best Games for Laptop</strong></h3>\r\n<p>Looking for the best games for PC? <em>Poki</em> offers a diverse selection of high-quality browser games optimized for laptop and desktop play. With stunning graphics, smooth gameplay, and immersive experiences, you\'ll be entertained for hours on end.</p>\r\n<h3>11. <strong>Unblocked Crazy Games at School</strong></h3>\r\n<p>Want to play games at school? Check out <em>Crazy Games Unblocked</em> for a variety of exciting and fun-filled games that you can play during breaks. No need to worry about restrictions—these games are perfect for gaming during school downtime.</p>\r\n<h3>12. <strong>Best Games Multiplayer</strong></h3>\r\n<p>Looking to play <strong>online games with friends</strong>? <em>Best Games</em> offers multiplayer options that let you challenge your friends in exciting competitive or cooperative gameplay. Test your skills, work as a team, or compete for the top spot in a variety of thrilling games.</p>\r\n<h3>13. <strong>Best Unblocked Games at School</strong></h3>\r\n<p>Searching for unblocked games to enjoy at school? Discover a wide array of <strong>unblocked games</strong> that are fun, engaging, and perfect for some quick gaming during class breaks. Enjoy a variety of genres without the restrictions, and take a well-deserved break from your studies.</p>\r\n<h3>14. <strong>Offline Best Games on Mobile</strong></h3>\r\n<p>No internet? No problem! Play your favorite <em>Best Games</em> offline on your mobile device. From immersive single-player adventures to puzzle-solving escapades, enjoy uninterrupted gaming anytime and anywhere—even without an internet connection.</p>\r\n<p>Dive into the exciting world of <strong>Best Games</strong> and find the perfect game for you, no matter where or how you like to play!</p>', '0', ''),
(6, 'about', '/about', '<p>Welcome to GameMonetize, the premier platform designed to help game developers and website owners maximize their revenue through game monetization. Whether you\'re a developer eager to earn from your creations or a site owner looking to add engaging content that boosts revenue, GameMonetize is here to guide and support your journey to success.</p>\r\n<h3>Who We Are</h3>\r\n<p>At GameMonetize, we’re a team of passionate gamers and monetization specialists committed to providing the tools, insights, and resources you need to unlock the full earning potential of your games. We understand the challenges that come with monetizing games effectively, and our mission is to make this process easy, accessible, and profitable for everyone.</p>\r\n<h3>Our Vision</h3>\r\n<p>Our vision is simple: to empower developers and content creators around the world by offering innovative monetization solutions that make gaming both profitable and enjoyable. We believe that monetization should be seamless, allowing creators to focus on what they do best—crafting exceptional gaming experiences.</p>\r\n<h3>What We Offer</h3>\r\n<ul>\r\n<li>\r\n<p><strong>Monetization Guides and Tips</strong><br />We offer comprehensive guides on a range of monetization strategies, including in-game ads, premium content, and more. Our tips are designed to help you maximize your revenue without sacrificing the user experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Platform Integration</strong><br />GameMonetize integrates with leading ad networks, providing access to high-quality, engaging ads. With minimal setup, you can easily add ads to your games or websites, turning your traffic into steady revenue.</p>\r\n</li>\r\n<li>\r\n<p><strong>Insights and Analytics</strong><br />Successful monetization starts with understanding your audience. Our platform provides powerful insights and analytics to help you track performance, optimize ad placements, and make data-driven decisions to increase your earnings.</p>\r\n</li>\r\n<li>\r\n<p><strong>Community and Support</strong><br />GameMonetize is more than just a platform; it\'s a community. Access forums, tutorials, and expert advice to stay up to date with the latest trends, strategies, and best practices in game monetization.</p>\r\n</li>\r\n</ul>\r\n<h3>Why Choose GameMonetize?</h3>\r\n<p>GameMonetize is dedicated to providing a user-friendly, reliable, and effective monetization experience. Our team is focused on innovation, ensuring that our tools are simple to use and designed to generate maximum revenue. Whether you\'re just starting out or looking to elevate your earnings, we’re here to help you succeed.</p>\r\n<p>Thank you for choosing GameMonetize as your trusted monetization partner. Let’s turn your passion into profit and make your games more rewarding for both you and your audience!</p>', '0', ''),
(7, 'contact', '/contact', '<p>Thank you for your interest in GameMonetize! We\'re here to assist you with any questions, suggestions, or partnership opportunities. Whether you\'re looking to optimize your game\'s revenue potential, need guidance on monetization strategies, or want to explore collaboration possibilities, we’re eager to help!</p>\r\n<p><strong>Stay Connected</strong><br />Follow us on our social media channels to get the latest updates, features, and expert tips on game monetization. Join our growing community of developers and site owners to exchange ideas, share experiences, and find inspiration.</p>\r\n<p>Thank you for choosing GameMonetize. We’re excited to support you on your journey to success in game monetization!</p>', '0', ''),
(8, 'privacy', '/privacy', '<p>Welcome to GameMonetize! We prioritize your privacy and are committed to safeguarding any personal information you provide. This Privacy Policy outlines how we collect, use, and protect your data when you interact with our website, services, and tools. By using GameMonetize, you consent to the practices outlined in this policy.</p>\r\n<h2><strong>1. Information We Collect</strong></h2>\r\n<p>We may collect different types of information, including:</p>\r\n<ul>\r\n<li><strong>Personal Information:</strong> Information you provide voluntarily, such as your name, email address, and contact details when you sign up, contact us, or engage with our services.</li>\r\n<li><strong>Usage Data</strong>: Data collected automatically, such as your IP address, browser type, device information, and pages visited on GameMonetize. This helps us understand how users interact with our site and improve our services.</li>\r\n<li><strong>Cookies and Tracking Technologies</strong>: We use cookies, beacons, and other technologies to enhance your experience, track website performance, and analyze user behavior.</li>\r\n</ul>\r\n<h2><strong>2. How We Use Your Information</strong></h2>\r\n<p>GameMonetize uses the information collected to:</p>\r\n<ul>\r\n<li>Improve website functionality and optimize user experience.</li>\r\n<li>Provide personalized content and recommendations.</li>\r\n<li>Communicate with you regarding updates, promotions, or customer support inquiries.</li>\r\n<li>Monitor website analytics and user trends to enhance our services.</li>\r\n<li>Ensure compliance with our terms, policies, and legal requirements.</li>\r\n</ul>\r\n<h2><strong>3. Data Sharing and Disclosure</strong></h2>\r\n<p>We value your privacy and do not sell or rent your personal information. However, we may share data in the following cases:</p>\r\n<ul>\r\n<li><strong>Service Providers</strong>: With third-party partners who assist in operating our website, conducting our business, or providing services to you, provided they agree to keep your information confidential.</li>\r\n<li><strong>Legal Requirements</strong>: When required by law or in response to valid requests by public authorities.</li>\r\n</ul>\r\n<h2><strong>4. Security of Your Information</strong></h2>\r\n<p>We implement security measures designed to protect your personal information from unauthorized access, alteration, or disclosure. However, please understand that no method of transmission over the internet or electronic storage is completely secure.</p>\r\n<h2><strong>5. Third-Party Links</strong></h2>\r\n<p>Our site may contain links to third-party websites. GameMonetize is not responsible for the privacy practices or content of these external sites. We encourage you to review their privacy policies before providing any personal information.</p>\r\n<h2><strong>6. Your Privacy Choices</strong></h2>\r\n<p>You have the right to:</p>\r\n<ul>\r\n<li><strong>Access or Update Your Data</strong>: Contact us if you wish to access, correct, or delete your personal information.</li>\r\n<li><strong>Opt-Out of Communications</strong>: You may unsubscribe from our promotional emails or notifications by following the unsubscribe link in any email.</li>\r\n<li><strong>Disable Cookies</strong>: Adjust your browser settings to refuse cookies if you prefer not to have them collected.</li>\r\n</ul>\r\n<h2><strong>7. Changes to This Privacy Policy</strong></h2>\r\n<p>GameMonetize may update this Privacy Policy periodically to reflect changes in our practices or regulatory requirements. Any updates will be posted on this page, and we encourage you to review this policy regularly.</p>', '0', '');
INSERT INTO `gm_footer_description` (`id`, `page_name`, `page_url`, `description`, `has_content`, `content_value`) VALUES
(9, 'terms', '/terms', '<p>Creating a successful gaming website involves understanding and utilizing a wide array of related terms that resonate with your target audience, enhance your website’s SEO, and provide valuable content. Below is a comprehensive list of related terms categorized into different segments of the gaming ecosystem. This guide will help you optimize your gaming website effectively.</p>\r\n<h3><strong>1. Gaming Genres</strong></h3>\r\n<p>Understanding various gaming genres is fundamental as it helps categorize content and attract specific audiences.</p>\r\n<ul>\r\n<li><strong>Action Games:</strong> Fast-paced games focusing on physical challenges. Examples include platformers and shooters.</li>\r\n<li><strong>Adventure Games:</strong> Emphasize exploration and puzzle-solving. Often narrative-driven.</li>\r\n<li><strong>Role-Playing Games (RPGs):</strong> Players assume roles of characters in a fictional setting. Sub-genres include JRPGs and MMORPGs.</li>\r\n<li><strong>Simulation Games:</strong> Mimic real-world activities, such as flight simulators or life simulations like <em>The Sims</em>.</li>\r\n<li><strong>Strategy Games:</strong> Require tactical and strategic thinking. Includes real-time strategy (RTS) and turn-based strategy (TBS).</li>\r\n<li><strong>Sports Games:</strong> Replicate real-world sports. Examples include FIFA, NBA 2K.</li>\r\n<li><strong>Racing Games:</strong> Focus on vehicle racing, from realistic simulators to arcade-style games.</li>\r\n<li><strong>Puzzle Games:</strong> Challenge problem-solving skills, such as <em>Tetris</em> or <em>Candy Crush</em>.</li>\r\n<li><strong>Horror Games:</strong> Aim to evoke fear and suspense, often with survival elements.</li>\r\n<li><strong>Battle Royale:</strong> A large number of players compete until only one remains, popularized by games like <em>Fortnite</em> and <em>PUBG</em>.</li>\r\n</ul>\r\n<h3><strong>2. Gaming Platforms</strong></h3>\r\n<p>Different platforms cater to varied gaming preferences and hardware setups.</p>\r\n<ul>\r\n<li><strong>PC Gaming:</strong> Games played on personal computers, offering flexibility and customization.</li>\r\n<li><strong>Console Gaming:</strong> Dedicated gaming consoles like PlayStation, Xbox, and Nintendo Switch.</li>\r\n<li><strong>Mobile Gaming:</strong> Games designed for smartphones and tablets, accessible on the go.</li>\r\n<li><strong>Cloud Gaming:</strong> Streaming games over the internet without the need for powerful hardware, such as Google Stadia and NVIDIA GeForce Now.</li>\r\n<li><strong>VR Gaming:</strong> Virtual Reality platforms providing immersive experiences, like Oculus Rift and PlayStation VR.</li>\r\n<li><strong>AR Gaming:</strong> Augmented Reality games that blend the virtual and real world, such as <em>Pokémon GO</em>.</li>\r\n<li><strong>Handheld Gaming:</strong> Portable consoles like the Nintendo 3DS or Steam Deck.</li>\r\n</ul>\r\n<h3><strong>3. Gaming Hardware</strong></h3>\r\n<p>Key hardware components and peripherals essential for gaming enthusiasts.</p>\r\n<ul>\r\n<li><strong>Gaming PCs:</strong> High-performance personal computers tailored for gaming.</li>\r\n<li><strong>Gaming Consoles:</strong> Devices like PlayStation, Xbox, and Nintendo Switch designed for gaming.</li>\r\n<li><strong>Graphics Cards (GPUs):</strong> Crucial for rendering high-quality visuals.</li>\r\n<li><strong>Processors (CPUs):</strong> The brain of the gaming system, impacting performance.</li>\r\n<li><strong>RAM:</strong> Memory that affects game loading times and multitasking.</li>\r\n<li><strong>Storage Solutions:</strong> SSDs and HDDs for game installation and data storage.</li>\r\n<li><strong>Gaming Monitors:</strong> High-refresh-rate and low-latency displays.</li>\r\n<li><strong>Keyboards and Mice:</strong> Specialized peripherals for enhanced gaming control.</li>\r\n<li><strong>Controllers:</strong> Gamepads and joysticks for console and PC gaming.</li>\r\n<li><strong>Headsets:</strong> For immersive audio and communication in multiplayer games.</li>\r\n<li><strong>Gaming Chairs:</strong> Ergonomic seating designed for long gaming sessions.</li>\r\n</ul>\r\n<h3><strong>4. Game Development</strong></h3>\r\n<p>Terms related to the creation and production of games, valuable for developers and enthusiasts.</p>\r\n<ul>\r\n<li><strong>Game Engine:</strong> Software frameworks like Unity and Unreal Engine used to create games.</li>\r\n<li><strong>Programming Languages:</strong> Such as C++, C#, and Python, used in game development.</li>\r\n<li><strong>3D Modeling:</strong> Creating three-dimensional assets for games.</li>\r\n<li><strong>Animation:</strong> Bringing characters and environments to life through movement.</li>\r\n<li><strong>Level Design:</strong> Crafting the stages and environments where gameplay occurs.</li>\r\n<li><strong>Game Design Document (GDD):</strong> Comprehensive plan outlining game mechanics and features.</li>\r\n<li><strong>Alpha/Beta Testing:</strong> Phases of testing before the final release to identify bugs and gather feedback.</li>\r\n<li><strong>Modding:</strong> Creating user-generated modifications to alter or enhance games.</li>\r\n<li><strong>AI in Games:</strong> Implementing artificial intelligence to create responsive and challenging NPCs.</li>\r\n<li><strong>Sound Design:</strong> Creating and integrating audio elements like music and sound effects.</li>\r\n</ul>\r\n<h3><strong>5. Online Gaming</strong></h3>\r\n<p>Terms associated with multiplayer and online interactions in gaming.</p>\r\n<ul>\r\n<li><strong>MMORPG (Massively Multiplayer Online Role-Playing Game):</strong> Games like <em>World of Warcraft</em> with large player bases.</li>\r\n<li><strong>LAN Parties:</strong> Local Area Network gatherings for multiplayer gaming.</li>\r\n<li><strong>Online Multiplayer:</strong> Games that allow multiple players to interact over the internet.</li>\r\n<li><strong>eSports:</strong> Competitive gaming as a spectator sport, with tournaments and professional players.</li>\r\n<li><strong>Guilds/Clans:</strong> Player-formed groups for collaboration in games.</li>\r\n<li><strong>Leaderboards:</strong> Rankings showing top players based on performance metrics.</li>\r\n<li><strong>Matchmaking:</strong> Systems that pair players of similar skill levels.</li>\r\n<li><strong>Voice Chat:</strong> Communication tools integrated into games for team coordination.</li>\r\n<li><strong>Streaming:</strong> Broadcasting gameplay live on platforms like Twitch and YouTube Gaming.</li>\r\n<li><strong>Virtual Economies:</strong> In-game marketplaces where players trade virtual items or currency.</li>\r\n</ul>\r\n<h3><strong>6. Gaming Culture and Community</strong></h3>\r\n<p>Terms that reflect the social and cultural aspects of gaming.</p>\r\n<ul>\r\n<li><strong>Gamers:</strong> Individuals who play video games, often categorized by platform or genre preference.</li>\r\n<li><strong>Streaming:</strong> Broadcasting gameplay live for an audience.</li>\r\n<li><strong>Let\'s Play:</strong> Video series where players record themselves playing games, often with commentary.</li>\r\n<li><strong>Speedrunning:</strong> Completing games as quickly as possible, often exploiting glitches.</li>\r\n<li><strong>Cosplay:</strong> Dressing up as game characters, popular at conventions.</li>\r\n<li><strong>Fan Art:</strong> Artistic creations inspired by games.</li>\r\n<li><strong>Memes:</strong> Humorous content related to gaming culture.</li>\r\n<li><strong>Tournaments:</strong> Organized competitions for games, often with prizes.</li>\r\n<li><strong>Forums and Communities:</strong> Online spaces where gamers discuss games, share tips, and socialize.</li>\r\n<li><strong>Influencers:</strong> Content creators who impact gaming trends and opinions.</li>\r\n</ul>\r\n<h3><strong>7. Game Reviews and Media</strong></h3>\r\n<p>Terms related to evaluating and discussing games.</p>\r\n<ul>\r\n<li><strong>Reviews:</strong> Critical assessments of games, covering aspects like gameplay, graphics, and story.</li>\r\n<li><strong>Previews:</strong> Early looks at upcoming games, often including initial impressions and expectations.</li>\r\n<li><strong>Walkthroughs:</strong> Guides that help players navigate through game levels or challenges.</li>\r\n<li><strong>Let’s Plays:</strong> Series where gamers play through games, providing commentary and reactions.</li>\r\n<li><strong>News:</strong> Updates on game releases, patches, and industry events.</li>\r\n<li><strong>Interviews:</strong> Conversations with game developers, designers, and other industry professionals.</li>\r\n<li><strong>Top Lists:</strong> Curated rankings of games based on various criteria like popularity or quality.</li>\r\n<li><strong>Tutorials:</strong> Instructional content teaching players how to play or improve in games.</li>\r\n<li><strong>Opinion Pieces:</strong> Articles expressing personal viewpoints on gaming topics.</li>\r\n<li><strong>Podcasts:</strong> Audio shows discussing gaming news, trends, and topics.</li>\r\n</ul>\r\n<h3><strong>8. Monetization and Business</strong></h3>\r\n<p>Terms related to the financial aspects of gaming websites and the gaming industry.</p>\r\n<ul>\r\n<li><strong>Ad Revenue:</strong> Income generated from displaying advertisements on the website.</li>\r\n<li><strong>Affiliate Marketing:</strong> Earning commissions by promoting gaming products or services.</li>\r\n<li><strong>Sponsorships:</strong> Partnerships with brands for mutual promotion and financial support.</li>\r\n<li><strong>Merchandising:</strong> Selling branded merchandise related to gaming content.</li>\r\n<li><strong>Subscription Models:</strong> Offering premium content or features for a recurring fee.</li>\r\n<li><strong>In-Game Purchases:</strong> Buying virtual items or currency within games.</li>\r\n<li><strong>Crowdfunding:</strong> Raising funds for game development through platforms like Kickstarter.</li>\r\n<li><strong>Microtransactions:</strong> Small, often in-game, purchases made by players.</li>\r\n<li><strong>Patreon:</strong> Platform for creators to receive recurring funding from supporters.</li>\r\n<li><strong>Digital Distribution:</strong> Selling games through online platforms like Steam, Epic Games Store.</li>\r\n</ul>\r\n<h3><strong>9. SEO and Content Strategy</strong></h3>\r\n<p>Terms essential for optimizing a gaming website for search engines and user engagement.</p>\r\n<ul>\r\n<li><strong>Keywords:</strong> Specific terms gamers search for, like “best RPGs 2024” or “gaming PC builds”.</li>\r\n<li><strong>Long-Tail Keywords:</strong> More specific phrases that attract niche audiences, e.g., “how to speedrun <em>Super Mario</em>”.</li>\r\n<li><strong>Meta Tags:</strong> HTML elements that provide information about the website to search engines.</li>\r\n<li><strong>Backlinks:</strong> Links from other websites pointing to your gaming site, improving SEO.</li>\r\n<li><strong>Content Marketing:</strong> Creating valuable content to attract and retain an audience.</li>\r\n<li><strong>User Engagement:</strong> Strategies to keep visitors interacting with the website, such as comments and shares.</li>\r\n<li><strong>Responsive Design:</strong> Ensuring the website works well on all devices, including mobiles and tablets.</li>\r\n<li><strong>Page Speed:</strong> Optimizing website loading times for better user experience and SEO.</li>\r\n<li><strong>Analytics:</strong> Tools like Google Analytics to track website performance and user behavior.</li>\r\n<li><strong>Social Media Integration:</strong> Connecting the website with platforms like Twitter, Facebook, and Instagram to broaden reach.</li>\r\n</ul>\r\n<h3><strong>10. Trends and Innovations</strong></h3>\r\n<p>Staying updated with the latest developments in the gaming industry to keep the website relevant.</p>\r\n<ul>\r\n<li><strong>Cloud Gaming:</strong> The shift towards streaming games rather than downloading them.</li>\r\n<li><strong>Cross-Platform Play:</strong> Allowing gamers on different platforms to play together.</li>\r\n<li><strong>Augmented Reality (AR) and Virtual Reality (VR):</strong> Emerging technologies enhancing gaming experiences.</li>\r\n<li><strong>Artificial Intelligence (AI):</strong> Increasing use in game design for smarter NPCs and adaptive gameplay.</li>\r\n<li><strong>Blockchain Gaming:</strong> Integration of blockchain for ownership of in-game assets and cryptocurrencies.</li>\r\n<li><strong>Mobile eSports:</strong> The rise of competitive gaming on mobile platforms.</li>\r\n<li><strong>Indie Games:</strong> Independent game development gaining popularity and support.</li>\r\n<li><strong>Game Streaming Services:</strong> Platforms offering subscription-based access to a library of games.</li>\r\n<li><strong>Esports Betting:</strong> The growing trend of wagering on esports competitions.</li>\r\n<li><strong>Sustainable Gaming:</strong> Efforts to make gaming more environmentally friendly.</li>\r\n</ul>\r\n<h3><strong>11. Legal and Ethical Terms</strong></h3>\r\n<p>Understanding the legal aspects and ethical considerations in gaming.</p>\r\n<ul>\r\n<li><strong>Intellectual Property (IP):</strong> Protecting game content, including characters and storylines.</li>\r\n<li><strong>Copyright:</strong> Legal rights protecting original works, crucial for game developers and content creators.</li>\r\n<li><strong>Licensing:</strong> Obtaining rights to use certain content or technologies in games.</li>\r\n<li><strong>Privacy Policy:</strong> Guidelines on how user data is collected and used on the website.</li>\r\n<li><strong>Terms of Service (ToS):</strong> Rules and regulations users must agree to when using the website.</li>\r\n<li><strong>Age Ratings:</strong> Classifications indicating the suitable age group for games, such as ESRB ratings.</li>\r\n<li><strong>Cheating and Hacking:</strong> Issues related to maintaining fair play in online games.</li>\r\n<li><strong>Toxicity Management:</strong> Addressing negative behavior within gaming communities.</li>\r\n<li><strong>Accessibility:</strong> Ensuring games and websites are usable by people with disabilities.</li>\r\n<li><strong>Fair Use:</strong> Legal doctrine allowing limited use of copyrighted material without permission.</li>\r\n</ul>\r\n<h3><strong>12. Localization and Global Reach</strong></h3>\r\n<p>Expanding the website’s audience by catering to different languages and regions.</p>\r\n<ul>\r\n<li><strong>Localization:</strong> Adapting content to suit different languages and cultures.</li>\r\n<li><strong>Translation Services:</strong> Converting website content into multiple languages.</li>\r\n<li><strong>Regional Content:</strong> Creating content specific to different geographical areas.</li>\r\n<li><strong>Global SEO:</strong> Optimizing the website to rank well in search engines across different countries.</li>\r\n<li><strong>Currency Conversion:</strong> Displaying prices in various currencies for international users.</li>\r\n<li><strong>Time Zones:</strong> Scheduling content releases to accommodate different time zones.</li>\r\n<li><strong>Cultural Sensitivity:</strong> Ensuring content respects cultural differences and avoids offense.</li>\r\n<li><strong>International Partnerships:</strong> Collaborating with global brands and influencers.</li>\r\n<li><strong>Multilingual Support:</strong> Offering customer service and support in multiple languages.</li>\r\n<li><strong>Global Payment Options:</strong> Providing various payment methods to cater to international users.</li>\r\n</ul>\r\n<h3><strong>13. User-Generated Content (UGC)</strong></h3>\r\n<p>Encouraging and managing content created by the website’s users to enhance engagement.</p>\r\n<ul>\r\n<li><strong>Forums:</strong> Online discussion boards where users can share opinions and tips.</li>\r\n<li><strong>Reviews and Ratings:</strong> Allowing users to rate and review games, influencing others’ decisions.</li>\r\n<li><strong>Blogs and Articles:</strong> User-submitted content sharing experiences and insights.</li>\r\n<li><strong>Video Content:</strong> User-created videos, such as gameplay highlights and tutorials.</li>\r\n<li><strong>Screenshots and Artwork:</strong> Sharing visual content created by users related to games.</li>\r\n<li><strong>Contests and Challenges:</strong> Engaging users through competitions and in-game challenges.</li>\r\n<li><strong>Polls and Surveys:</strong> Gathering user feedback and opinions on various gaming topics.</li>\r\n<li><strong>Modding Communities:</strong> Platforms where users can share and download game modifications.</li>\r\n<li><strong>Fan Fiction:</strong> Stories written by fans based on game universes.</li>\r\n<li><strong>Social Sharing:</strong> Tools allowing users to share website content on their social media profiles.</li>\r\n</ul>\r\n<h3><strong>14. Security and Maintenance</strong></h3>\r\n<p>Ensuring the website is secure and operates smoothly to provide a reliable user experience.</p>\r\n<ul>\r\n<li><strong>SSL Certificates:</strong> Encrypting data to protect user information.</li>\r\n<li><strong>Firewall Protection:</strong> Defending against unauthorized access and cyber threats.</li>\r\n<li><strong>Regular Backups:</strong> Ensuring website data is safely backed up to prevent loss.</li>\r\n<li><strong>Software Updates:</strong> Keeping website software and plugins up to date to avoid vulnerabilities.</li>\r\n<li><strong>DDoS Protection:</strong> Safeguarding against Distributed Denial of Service attacks.</li>\r\n<li><strong>User Authentication:</strong> Implementing secure login systems to protect user accounts.</li>\r\n<li><strong>Data Encryption:</strong> Protecting sensitive information through encryption methods.</li>\r\n<li><strong>Privacy Compliance:</strong> Adhering to regulations like GDPR and CCPA to protect user data.</li>\r\n<li><strong>Content Moderation:</strong> Monitoring and managing user-generated content to prevent inappropriate material.</li>\r\n<li><strong>Performance Optimization:</strong> Regularly tuning the website for speed and reliability.</li>\r\n</ul>\r\n<h3><strong>15. Marketing and Promotion</strong></h3>\r\n<p>Strategies and terms related to promoting the gaming website to attract and retain visitors.</p>\r\n<ul>\r\n<li><strong>Social Media Marketing:</strong> Using platforms like Twitter, Facebook, and Instagram to promote content.</li>\r\n<li><strong>Email Marketing:</strong> Sending newsletters and updates to subscribers.</li>\r\n<li><strong>Influencer Partnerships:</strong> Collaborating with gaming influencers to reach a broader audience.</li>\r\n<li><strong>Search Engine Optimization (SEO):</strong> Optimizing website content to rank higher in search results.</li>\r\n<li><strong>Pay-Per-Click (PPC) Advertising:</strong> Using ads that charge per click to drive traffic.</li>\r\n<li><strong>Content Syndication:</strong> Distributing content across multiple platforms to increase visibility.</li>\r\n<li><strong>Affiliate Programs:</strong> Allowing others to promote your website in exchange for commissions.</li>\r\n<li><strong>Referral Programs:</strong> Encouraging existing users to refer new visitors to the website.</li>\r\n<li><strong>Press Releases:</strong> Announcing significant updates or events to media outlets.</li>\r\n<li><strong>Event Sponsorship:</strong> Supporting gaming events and tournaments to increase brand presence.</li>\r\n</ul>', '0', ''),
(10, 'blogs', '/blogs', '', '0', ''),
(11, 'categories', '/categories', '', '0', ''),
(12, 'search', '/search', '', '0', ''),
(13, 'tags', '/tags', '<h1>Tag Overview</h1>\r\n<p>Crazygamesx is a widely acclaimed online gaming platform that caters to players of all types, offering a vast array of games across various genres. Whether you\'re a casual gamer seeking a fun distraction or a dedicated player searching for deeper, more immersive experiences, Crazygamesx has something to satisfy every preference. With hundreds of game categories available, it\'s easy for users to find the perfect game, whether you\'re in the mood for action-packed excitement or a relaxing puzzle challenge.</p>\r\n<p>Action games are a cornerstone of Crazygamesx, providing fast-paced, adrenaline-pumping experiences that test your reflexes, coordination, and quick thinking. Players can dive into various action-packed sub-genres such as shooters, fighting games, and platformers. Popular titles like <em>Strike Force Heroes</em> and <em>Iron Snout</em> offer thrilling gameplay that keeps you on the edge of your seat.</p>\r\n<p>For fans of multiplayer gaming, Crazygamesx offers a wide range of games that allow you to team up or compete against others in real-time. From casual, party-style games to more intense strategy-based challenges, there’s no shortage of competitive options. Games like <em>Slither.io</em> and <em>Madalin Stunt Cars 2</em> let you race or outsmart friends and foes in exciting online battles.</p>\r\n<p>If you’re looking for a more thoughtful gaming experience, Crazygamesx also features a diverse selection of puzzle games. These games encourage critical thinking and problem-solving, with challenges ranging from logic puzzles to physics-based tasks. Titles like <em>Cut the Rope</em> and <em>2048</em> provide a mentally stimulating yet laid-back experience, perfect for players who enjoy a slower-paced challenge.</p>\r\n<p>A standout feature of Crazygamesx is its intuitive tagging system, which allows players to easily explore games based on specific categories and themes. Whether you\'re in the mood for an adventure, a relaxing puzzle, or a competitive multiplayer showdown, the platform’s categorization makes it simple to find exactly what you\'re looking for.</p>\r\n<p><strong>Adventure games</strong> on Crazygamesx offer immersive experiences filled with exploration, puzzles, and storytelling. Players navigate rich, narrative-driven worlds, solving problems, discovering hidden items, and defeating enemies. Games like <em>Fireboy and Watergirl</em> capture the spirit of adventure and remain fan favorites.</p>\r\n<p>For those who enjoy a challenge that tests their precision and reaction time, Crazygamesx offers an exciting selection of <strong>shooting games</strong>. These games range from first-person shooters (FPS) to third-person games, offering everything from zombie survival in <em>Zombotron</em> to tactical battles in <em>Masked Forces</em>.</p>\r\n<p>For younger players or anyone looking for a lighthearted gaming experience, Crazygamesx has a collection of <strong>baby games</strong>. These interactive games revolve around caregiving tasks, allowing players to take care of virtual babies, changing diapers, feeding, and playing. Explore more baby games in the platform\'s dedicated section for hours of family-friendly fun.</p>\r\n<p>Fashion enthusiasts can indulge their creativity in <strong>dress-up</strong> and <strong>makeover games</strong>, where they can style characters, select outfits, and experiment with makeup. These games often feature themes like princesses, celebrities, and fashion contests, offering endless customization options. If you enjoy styling and creativity, the Dress-Up and Makeover Games sections are perfect for you.</p>\r\n<p><strong>Two-player games</strong> bring the fun to a whole new level, offering exciting opportunities for friends or family members to play together. Whether you’re racing, competing in a sports game, or solving puzzles cooperatively, these games allow for shared experiences. With options for friendly competition or teamwork, there\'s no shortage of thrilling two-player games in Crazygamesx.</p>\r\n<p><strong>Hyper-casual games</strong> are another highlight of the platform, known for their simplicity and ease of play. These games are designed for quick, engaging sessions with minimal learning curve, perfect for players who want a casual gaming experience without a big time commitment. If you\'re in the mood for some light, enjoyable gameplay, the Hypercasual Games section has you covered.</p>\r\n<p>Crazygamesx continues to be a top-tier platform for online gaming, providing an exceptional variety of games across every genre imaginable. With its user-friendly tagging system, players can easily discover new games suited to their unique tastes, whether they prefer intense action, strategic multiplayer fun, or relaxing puzzle challenges.</p>\r\n<p>With so many options to choose from, Crazygamesx ensures that every player can find their ideal game, whether you\'re in the mood for a heart-racing adventure, a casual break, or something in between.</p>', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `gm_games`
--

CREATE TABLE `gm_games` (
  `game_id` int(11) NOT NULL,
  `catalog_id` varchar(250) NOT NULL,
  `game_name` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(500) NOT NULL,
  `import` enum('0','1') NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL,
  `plays` int(11) NOT NULL,
  `rating` enum('0','0.5','1','1.5','2','2.5','3','3.5','4','4.5','5') NOT NULL DEFAULT '0',
  `description` varchar(15000) NOT NULL,
  `instructions` varchar(600) NOT NULL,
  `file` varchar(500) NOT NULL,
  `game_type` varchar(250) NOT NULL,
  `w` int(10) NOT NULL,
  `h` int(10) NOT NULL,
  `date_added` int(11) NOT NULL,
  `published` enum('0','1') NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `mobile` int(255) NOT NULL,
  `featured_sorting` varchar(255) NOT NULL,
  `field_1` varchar(500) NOT NULL,
  `field_2` varchar(500) NOT NULL,
  `field_3` varchar(500) NOT NULL,
  `field_4` varchar(500) NOT NULL,
  `field_5` varchar(500) NOT NULL,
  `field_6` varchar(500) NOT NULL,
  `field_7` varchar(500) NOT NULL,
  `field_8` varchar(500) NOT NULL,
  `field_9` varchar(500) NOT NULL,
  `field_10` varchar(500) NOT NULL,
  `tags_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags_ids`)),
  `video_url` varchar(100) DEFAULT NULL,
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `wt_video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gm_games`
--

INSERT INTO `gm_games` (`game_id`, `catalog_id`, `game_name`, `name`, `image`, `import`, `category`, `plays`, `rating`, `description`, `instructions`, `file`, `game_type`, `w`, `h`, `date_added`, `published`, `featured`, `mobile`, `featured_sorting`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `tags_ids`, `video_url`, `is_last_rewrite`, `wt_video`) VALUES
(1, 'gamemonetize-33596', 'get-13-puzzle', 'Get 13 Puzzle', 'https://img.gamemonetize.com/psjtvdszfxyzn9usxmrvh5pffqe6kodm/512x384.jpg', '0', 0, 0, '0', 'Just get 13 to WIN The gameplay is simple, just get 13. Merge blocks with the same number to increase by 1 until you get 13. Already got 13?', 'Tap on Block to Merge blocks with the same number to increase by 1', 'https://html5.gamemonetize.com/psjtvdszfxyzn9usxmrvh5pffqe6kodm/', 'html5', 600, 800, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"1\",\"2\",\"3\"]', NULL, 0, 'https://gamemonetize.video/video/psjtvdszfxyzn9usxmrvh5pffqe6kodm-1743242438.mp4'),
(2, 'gamemonetize-33595', 'relaxing-games', 'Relaxing Games', 'https://img.gamemonetize.com/kc2nwz5c7keuuxdu8a2142ipl74orghx/512x384.jpg', '0', 0, 0, '0', 'Relax and take a Relaxing Games tour! Relaxing Games brings you a series of casual and fun mini-games, designed for you to relax in your spare time! There are various types of games, each easy to play and extremely fun, allowing you to immerse yourself easily in the game world.Simple elimination, simulation challenges, easy hooting and puzzle games, let you switch freely', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/kc2nwz5c7keuuxdu8a2142ipl74orghx/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"4\",\"5\",\"6\",\"3\",\"7\",\"8\"]', NULL, 0, 'https://gamemonetize.video/video/kc2nwz5c7keuuxdu8a2142ipl74orghx-1743159745.mp4'),
(3, 'gamemonetize-33594', 'ice-cream-stack-runner', 'Ice Cream Stack Runner', 'https://img.gamemonetize.com/psogl6861khooa0ywjkrfxrt3fi0v326/512x384.jpg', '0', 11, 2, '0', 'Ice Cream Stack Runner is a fun game combining parkour with everyones favorite food: ice cream.Run through a world full of obstacles while stacking the best ice cream cones. You will control ten stickmen on the parkour platform. Lead them to collect ice cream cones. Top it up with ice cream and candy.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/psogl6861khooa0ywjkrfxrt3fi0v326/', 'html5', 750, 1334, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"9\",\"10\",\"11\",\"12\"]', NULL, 0, 'https://gamemonetize.video/video/psogl6861khooa0ywjkrfxrt3fi0v326-1743159739.mp4'),
(4, 'gamemonetize-33593', 'shape-walls', 'Shape Walls', 'https://img.gamemonetize.com/q6lsd6q6espgn26s1ac2whbkw6r9yibk/512x384.jpg', '0', 11, 0, '0', 'Shape Walls is a fun and challenging puzzle game where you arrange shape pieces to reveal hidden objects. Tap to rotate the pieces and fit them into the correct outline. With increasing difficulty, each level tests your logic, observation, and spatial skills. Enjoy a relaxing yet brain-teasing experience as you complete unique puzzles. No time limits&amp;amp;mdash;just pure problem-solving fun!', 'Tap on a shape piece to rotate it Adjust the pieces to fit within the given outline Complete the shape correctly to reveal the hidden object Progress through levels with increasing complexity Enjoy the challenge and relax while solving puzzles', 'https://html5.gamemonetize.com/q6lsd6q6espgn26s1ac2whbkw6r9yibk/', 'html5', 350, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"14\"]', NULL, 0, 'https://gamemonetize.video/video/q6lsd6q6espgn26s1ac2whbkw6r9yibk-1743159733.mp4'),
(5, 'gamemonetize-33592', 'stack-n-sort', 'Stack N Sort', 'https://img.gamemonetize.com/oshs50wl9x5rgupqa2sp52oy87f7xprv/512x384.jpg', '0', 3, 0, '0', 'Sort, stack, and organize colorful rings in this fun &amp;amp;amp; addictive puzzle game! Stack N Sort &amp;amp;ndash; The Ultimate Sorting Puzzle Challenge! Get ready for a super satisfying and brain-teasing puzzle experience! In Stack N Sort, your goal is to sort and stack colorful rings onto the correct poles. Sounds simple? Think again! With limited space and tricky arrangements, you&amp;amp;rsquo;ll need sharp logic and smart moves to complete each level. How to Play: Tap &amp;amp;amp; drag to move rings between poles! Stack rings of the same color together Plan your moves carefully &amp;amp;ndash; Limited', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/oshs50wl9x5rgupqa2sp52oy87f7xprv/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"3\",\"15\",\"16\"]', NULL, 0, 'https://gamemonetize.video/video/oshs50wl9x5rgupqa2sp52oy87f7xprv-1743158829.mp4'),
(6, 'gamemonetize-33591', 'whackamole3d', 'WhackAMole3D', 'https://img.gamemonetize.com/5q307jg2lld43bre7amoent0ir1czpa3/512x384.jpg', '0', 1, 0, '0', 'Whack-a-Mole WebGL is a fun and fast-paced arcade game where your reflexes are put to the test! Moles randomly pop out of their holes, and it&amp;amp;rsquo;s your job to tap them as quickly as possible. The more moles you whack, the higher your score. As the game progresses, the speed increases, making it more challenging and exciting.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/5q307jg2lld43bre7amoent0ir1czpa3/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"14\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\"]', NULL, 0, 'https://gamemonetize.video/video/5q307jg2lld43bre7amoent0ir1czpa3-1743158818.mp4'),
(7, 'gamemonetize-33590', 'alphabet-run', 'Alphabet Run', 'https://img.gamemonetize.com/n55awbyki5yltw2zabcywtzc5jv983xu/512x384.jpg', '0', 4, 0, '0', 'Welcome to Alphabet Run 3D, an amazing game! You play as Alphabet A, and your mission is to collect as many alphabets as possible to defeat the blue monster. Choose the same color as your player to multiply your alphabets. Enjoy!', 'Tap or mouse click to play', 'https://html5.gamemonetize.com/n55awbyki5yltw2zabcywtzc5jv983xu/', 'html5', 720, 1280, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"24\",\"6\",\"25\"]', NULL, 0, 'https://gamemonetize.video/video/n55awbyki5yltw2zabcywtzc5jv983xu-1743158812.mp4'),
(8, 'gamemonetize-33589', 'emoji-sort', 'Emoji Sort', 'https://img.gamemonetize.com/g3gdro0n97mr5ar67bdj01z64283fh8k/512x384.jpg', '0', 4, 0, '0', 'Emoji Sort is a pattern recognition puzzle game where players must fill in empty cells with the correct emojis. Each puzzle presents a grid with missing emojis that follow specific patterns - such as categories, sequences, or associations. Players analyze the existing emojis to identify the pattern (animals, food chains, transportation types, etc.) and select the appropriate emojis to complete the grid. The game features 30 increasingly challenging levels with various pattern types, and includes a hint system to help when players get stuck. Perfect for puzzle enthusiasts who enjoy discovering logical connections between visual elements!', 'Mouse Click or Touch', 'https://html5.gamemonetize.com/g3gdro0n97mr5ar67bdj01z64283fh8k/', 'html5', 600, 800, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"26\",\"27\",\"6\"]', NULL, 0, 'https://gamemonetize.video/video/g3gdro0n97mr5ar67bdj01z64283fh8k-1743158805.mp4'),
(9, 'gamemonetize-33588', 'word-connect-crossword-puzzle', 'Word Connect   Crossword Puzzle', 'https://img.gamemonetize.com/x9al1kr1h1mpaj5s6umdfgamd09okq4m/512x384.jpg', '0', 4, 0, '0', 'Word Connect - Crossword Puzzle Game is completely brain game with more fun &amp;amp;amp; relaxing word game in a crossword format made for brain activity and challenging word game By playing this game you will improve your spelling skills &amp;amp;amp; vocabulary. How to Play : Move your finger connecting letters to form a meaningful word You can form word horizontally &amp;amp;amp; Vertically Find as many words as possible to level completed and earn bonus rewards. Features: Get bonus coins for free hints! Fun and relaxing word search brain game! While Moving to the Next Level, You can feel more interest. 1000+ Challenging Game levels in', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/x9al1kr1h1mpaj5s6umdfgamd09okq4m/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"17\",\"3\",\"28\"]', NULL, 0, 'https://gamemonetize.video/video/x9al1kr1h1mpaj5s6umdfgamd09okq4m-1743073464.mp4'),
(10, 'gamemonetize-33587', 'funny-pull-the-beard', 'Funny Pull The Beard', 'https://img.gamemonetize.com/9755dil8btiay3oa8wa16ns8sk90g6zi/512x384.jpg', '0', 4, 0, '0', 'In Funny Beard Plucking, you will help a funny character pull his beard in various strange ways.But not all beard pulls are as simple as they seem. Your goal is to pull the beard. Look for the moment, look at the Angle and pull off each beard with precision. But the result is always unpredictable.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/9755dil8btiay3oa8wa16ns8sk90g6zi/', 'html5', 720, 1280, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"29\",\"30\",\"31\",\"7\"]', NULL, 0, 'https://gamemonetize.video/video/9755dil8btiay3oa8wa16ns8sk90g6zi-1743073471.mp4'),
(11, 'gamemonetize-33586', 'bbq-stack-run', 'Bbq Stack Run', 'https://img.gamemonetize.com/st6twsce0w84oiet97lt3b61rd4hgzb9/512x384.jpg', '0', 4, 0, '0', 'Enter a running arcade adventure filled with food and fun challenges. BBQ Stack Run takes you through the craziest BBQ-collecting parkour ever. Pick up various ingredients such as beef, chicken, sausage and more on the track as you run. Sprinkle them with barbecue seasoning and cook them through.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/st6twsce0w84oiet97lt3b61rd4hgzb9/', 'html5', 1334, 750, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"32\",\"10\",\"25\"]', NULL, 0, 'https://gamemonetize.video/video/st6twsce0w84oiet97lt3b61rd4hgzb9-1743073569.mp4'),
(12, 'gamemonetize-33585', 'cut-and-drop-puzzle', 'Cut And Drop Puzzle', 'https://img.gamemonetize.com/opmc3dkhqy9on79kt7seklf7b3t1i666/512x384.jpg', '0', 4, 0, '0', 'Cut &amp;amp;amp; Drop Puzzle is an addictive physics-based puzzle game where precision and strategy are key! Use your cutting skills to slice objects, drop balls, and guide them into the right targets. This game offers a fun and engaging experience for fans of puzzle games, slicing games, and physics challenges. Whether youre looking for a relaxing casual game or a brain-teasing challenge, Cut &amp;amp;amp; Drop Puzzle is the perfect choice!', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/opmc3dkhqy9on79kt7seklf7b3t1i666/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"6\",\"6\",\"3\"]', NULL, 0, 'https://gamemonetize.video/video/opmc3dkhqy9on79kt7seklf7b3t1i666-1743073555.mp4'),
(13, 'gamemonetize-33584', 'tox-sprunki-mod', 'Tox Sprunki Mod', 'https://img.gamemonetize.com/rhxk7km8elewnyjwsu96hf01mzsfs0qe/512x384.jpg', '0', 4, 0, '0', 'Tox Sprunki Mod is a platformer with unique mechanics, namely: the presence of poison, which does not allow you to stay in one place for a long time and return to where you have already been. So you have to think quickly and think through your steps in advance. The game has 24 levels.', 'On PC you can control the game using arrow keys or WAD keys To complete the level you need to get to the barrel', 'https://html5.gamemonetize.com/rhxk7km8elewnyjwsu96hf01mzsfs0qe/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"6\",\"33\",\"34\",\"3\"]', NULL, 0, 'https://gamemonetize.video/video/rhxk7km8elewnyjwsu96hf01mzsfs0qe-1743073562.mp4'),
(14, 'gamemonetize-33583', 'unpuzzle-master-tap-away', 'Unpuzzle Master Tap Away', 'https://img.gamemonetize.com/1yx48beozcoye96896ki6hfzwj72h9x6/512x384.jpg', '0', 4, 0, '0', 'Unpuzzle Master is a relaxing game of disassembling tiles in various directions, a puzzle game to hone accuracy in disassembling tiles. With various obstacles in the game, it makes it more interesting.', 'Touch Pad or Mouse click Mouse click or tap to play', 'https://html5.gamemonetize.com/1yx48beozcoye96896ki6hfzwj72h9x6/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"24\",\"3\",\"3\"]', NULL, 0, 'https://gamemonetize.video/video/1yx48beozcoye96896ki6hfzwj72h9x6-1743073986.mp4'),
(15, 'gamemonetize-33582', 'monsterella-fantasy-makeup', 'Monsterella Fantasy Makeup', 'https://img.gamemonetize.com/yfrcm6pzpl8vq4yu3n03rjjd9jivtboa/512x384.jpg', '0', 10, 0, '0', 'Step into the monstrous world of beauty with Monsterella Fantasy Makeup. This spookily engaging game lets you work your makeover magic on three iconic Monster High characters - Frankie Stein, Clawdeen Wolf, and Draculaura. In Frankies unit, electrify her look with eerie eyeshadows, neon lipstick, shockingly cool hairstyles, and otherworldly outfits. Next, embrace Clawdeens earthy mystique with jewel-toned makeup and howl-inducing wardrobe choices. Finally, express Draculauras vamp chic vibe with dramatic makeup and goth-glam ensembles. Immerse yourself in monstrous glamour and let your creativity run wild in this spooktacular makeup adve', 'Use your mouse to play the game on a desktop tap to play on mobile devices', 'https://html5.gamemonetize.com/yfrcm6pzpl8vq4yu3n03rjjd9jivtboa/', 'html5', 1024, 768, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"21\",\"35\",\"36\",\"37\"]', NULL, 0, 'https://gamemonetize.video/video/yfrcm6pzpl8vq4yu3n03rjjd9jivtboa-1743073547.mp4'),
(16, 'gamemonetize-33581', 'kingdom-puzzles', 'Kingdom Puzzles', 'https://img.gamemonetize.com/3ik5v7y3fvv6m7lsdzw5iohzber7ic6l/512x384.jpg', '0', 10, 0, '0', 'Kingdom Puzzle is a relaxing brain game where you see a grid with different colored regions. Your goal is to place one king in each region while following the rules. Each region can have only one king, and kings cannot be in the same row or column. They also cannot be next to each other, meaning the nearest tiles must be empty. To win the level, you must place all kings correctly. Placing a king in the wrong spot reduces your points. If your points reach zero, you can either skip the level with a 0 score or retry after watching a short ad. Enjoy the challenge!', 'Use a mouse or touchpad to play this game', 'https://html5.gamemonetize.com/3ik5v7y3fvv6m7lsdzw5iohzber7ic6l/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"38\",\"39\",\"40\",\"41\",\"33\",\"3\",\"42\"]', NULL, 0, 'https://gamemonetize.video/video/3ik5v7y3fvv6m7lsdzw5iohzber7ic6l-1743073539.mp4'),
(17, 'gamemonetize-33580', 'master-candy-dash', 'Master Candy Dash', 'https://img.gamemonetize.com/7q965wz5ev8n3oc5rmfufkb10fyrnaho/512x384.jpg', '0', 10, 0, '0', 'Master Candy Dash is an electrifying game where your mission is to match identical blocks to earn extra time. Each time you match identical blocks, you earn a precious second, but beware: if time runs out, it&amp;amp;rsquo;s game over! Challenge your reflexes and matching skills in this thrilling and addictive game, where every move counts to avoid imminent defeat.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/7q965wz5ev8n3oc5rmfufkb10fyrnaho/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"43\",\"27\",\"9\",\"30\",\"44\",\"41\",\"45\",\"45\",\"42\"]', NULL, 0, 'https://gamemonetize.video/video/7q965wz5ev8n3oc5rmfufkb10fyrnaho-1743073993.mp4'),
(18, 'gamemonetize-33579', 'hit-knock-down-2', 'Hit Knock Down 2', 'https://img.gamemonetize.com/5aanhavelssjrc0x6xbjgd6donq7nmg9/512x384.jpg', '0', 11, 0, '0', 'Hit &amp;amp;amp; Knock Down is a fun casual game where you aim to throw baseballs. Shoot as many targets as possible. Test your precision, reaction speed, and throwing skills. You aim to hit the right targets in each level. The goals at the level are very varied, such as wood, stone, etc. Each level presents different targets. You should hit with a baseball.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/5aanhavelssjrc0x6xbjgd6donq7nmg9/', 'html5', 640, 1136, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"46\",\"30\",\"47\"]', NULL, 0, 'https://gamemonetize.video/video/5aanhavelssjrc0x6xbjgd6donq7nmg9-1742977701.mp4'),
(19, 'gamemonetize-33578', 'baseball-star', 'Baseball Star', 'https://img.gamemonetize.com/lz24q5j25atdbwmkfy9r04cig938m8f9/512x384.jpg', '0', 8, 0, '0', 'Baseball Star is a fun casual sports game that lets you feel the excitement and joy of playing baseball. As a star on the field. Swing the bat and hitting the ball. Hit the ball with precision. It&amp;amp;rsquo;s easy to start. But the challenges will get harder.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/lz24q5j25atdbwmkfy9r04cig938m8f9/', 'html5', 720, 1280, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"46\",\"46\",\"48\",\"49\"]', NULL, 0, 'https://gamemonetize.video/video/lz24q5j25atdbwmkfy9r04cig938m8f9-1742975187.mp4'),
(20, 'gamemonetize-33577', 'paint-tomato', 'Paint Tomato', 'https://img.gamemonetize.com/ahwatodb2rgcue98fgl5qddklfboypcy/512x384.jpg', '0', 8, 0, '0', 'Paint Tomato is a vibrant grid puzzle game where you match tomato colors to adjacent ones. Use strategic moves to swiftly mirror neighboring tomatoes. The urgency intensifies with a ticking bomb, pushing your quick-thinking skills. Plan carefully to transform the grid within the countdown.', 'Mouse Click or Touch', 'https://html5.gamemonetize.com/ahwatodb2rgcue98fgl5qddklfboypcy/', 'html5', 600, 800, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"38\"]', NULL, 0, 'https://gamemonetize.video/video/ahwatodb2rgcue98fgl5qddklfboypcy-1742975177.mp4'),
(21, 'gamemonetize-33576', 'jump-smash-3d', 'Jump Smash 3D', 'https://img.gamemonetize.com/2r0abfblnfbdacepnn2mlivnkumcj9a5/512x384.jpg', '0', 11, 0, '0', 'Jump Smash 3D &amp;amp;ndash; The Ultimate High-Speed Jumping Challenge! Jump Smash 3D is an exciting hyper-casual game where precision, speed, and quick reflexes are the key to victory. Designed for mobile gaming, this game delivers smooth and addictive gameplay that keeps players engaged for hours. If you love casual games, hybrid casual games, and high-energy 3D challenges, then Jump Smash 3D is the perfect game for you! Fast-Paced Jumping Action &amp;amp;ndash; Control a dynamic ball as it jumps, smashes obstacles, and navigates challenging levels.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/2r0abfblnfbdacepnn2mlivnkumcj9a5/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"17\",\"6\",\"6\"]', NULL, 0, 'https://gamemonetize.video/video/2r0abfblnfbdacepnn2mlivnkumcj9a5-1742975168.mp4'),
(22, 'gamemonetize-33575', 'dice-puzzles', 'Dice puzzles!', 'https://img.gamemonetize.com/tjw00q7i8vgfw87xtmzzv1j7snkmrfu8/512x384.jpg', '0', 11, 0, '0', 'This game is more difficult than it may seem ! You have a playing field on which you need to throw puzzles and connect the same ones!', '1 At first it will be easy to connect the puzzles but over time there will be more and more of them', 'https://html5.gamemonetize.com/tjw00q7i8vgfw87xtmzzv1j7snkmrfu8/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"1\",\"46\",\"27\",\"39\",\"41\"]', NULL, 0, 'https://gamemonetize.video/video/tjw00q7i8vgfw87xtmzzv1j7snkmrfu8-1742975157.mp4'),
(23, 'gamemonetize-33574', 'virus-shoot', 'Virus Shoot', 'https://img.gamemonetize.com/grcsrtafdi46kgjzrcjts04dpljxe9hh/512x384.jpg', '0', 3, 0, '0', 'Virus Shoot&amp;amp;ndash; Is a HTML5 and mobile run game. Virus Shoot is a great game that will help you have fun while away the time. Simple, but at the same time exciting game! Try to shoot color balls with same color virus.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/grcsrtafdi46kgjzrcjts04dpljxe9hh/', 'html5', 640, 960, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"26\",\"50\",\"51\"]', NULL, 0, 'https://gamemonetize.video/video/grcsrtafdi46kgjzrcjts04dpljxe9hh-1742975141.mp4'),
(24, 'gamemonetize-33573', 'summer-rose-cone-ice-cream', 'Summer Rose Cone Ice Cream', 'https://img.gamemonetize.com/w6jkzd9gm85gcwrvqlq07stnct7n601w/512x384.jpg', '0', 10, 0, '0', 'Its a really hot summer! Want some sweet frozen food? Eating ice cream on a hot summer day is one of the best ways to beat the heat. Vanilla, chocolate, strawberry, mint.... More than ten sweet flavors to choose from. All the flavors you can mix up all sorts of different flavors with cookies, nuts and more to make the perfect ice cream: Hundreds of combinations in all. Come on! Lets get started right now! Product Feature: - A super fun food-making game. - Make sweet yummy ice-cream. Enjoy it near the beach, on the street, in the park? You decide! Even share your ice cream to friends. - Sweet and yummy ice cream flavors', '-Tons of realistic cooking tools to play oven freezer cream bag and so much more -Tons of food materials and decorations to try eggs milk salt flour cream vanilla extract butter chocolate candies and so much more - Have fun to pile ice cream a', 'https://html5.gamemonetize.com/w6jkzd9gm85gcwrvqlq07stnct7n601w/', 'html5', 640, 960, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"32\",\"52\",\"53\",\"6\"]', NULL, 0, 'https://gamemonetize.video/video/w6jkzd9gm85gcwrvqlq07stnct7n601w-1742975133.mp4'),
(25, 'gamemonetize-33572', '2player-tanks-of-war', '2Player Tanks of War', 'https://img.gamemonetize.com/etvwt8f327x14otf6ftwsj3g6zjmxfp4/512x384.jpg', '0', 3, 0, '0', 'Are you ready for a realistic tank battle? Now, get ready to fight in a tank battle with your friend on 8 different maps. Fight with your friend, and the one with the most hits lost will lose. In the game, you can also buy a galaxy costume if you want. Blow up your friend the most and you&amp;amp;rsquo;ll win the battle. The fight is really tough, so you must be very careful. Blow up your friend and victory will be yours. A two-player tank battle game.', 'Use the WASD and Arrow Keys to move Use the Q and P keys to fire the tank A never-ending tank battle game 8 different maps', 'https://html5.gamemonetize.com/etvwt8f327x14otf6ftwsj3g6zjmxfp4/', 'html5', 800, 600, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"54\",\"55\",\"26\"]', NULL, 0, 'https://gamemonetize.video/video/etvwt8f327x14otf6ftwsj3g6zjmxfp4-1742975121.mp4'),
(26, 'gamemonetize-33571', 'apocalypse-rush', 'Apocalypse Rush', 'https://img.gamemonetize.com/yp4fk09eq150ovmu0hhii0v3s1gph4zr/512x384.jpg', '0', 1, 0, '0', 'Apocalypse Rush is a fast-paced survival game where you must defend your trailer against endless waves of enemies! Arm yourself with various weapons, collect coins for upgrades, and try to survive as long as possible. The longer you last, the more challenging the game becomes! Are you ready for the chaos?', 'Controls Player 1 Move Arrow Keys Shoot K Special Attack L Player 2 Move W A S D Shoot C Special Attack V Survive the endless apocalypse and unleash powerful attacks', 'https://html5.gamemonetize.com/yp4fk09eq150ovmu0hhii0v3s1gph4zr/', 'html5', 1280, 720, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"55\",\"55\",\"26\",\"18\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"30\",\"63\"]', NULL, 0, 'https://gamemonetize.video/video/yp4fk09eq150ovmu0hhii0v3s1gph4zr-1742907870.mp4'),
(27, 'gamemonetize-33570', 'ragdoll-break-lets-destroy', 'Ragdoll Break LetS Destroy', 'https://img.gamemonetize.com/m5wcqrk4kjo1akvu7r5kbwmxlxsxnsdx/512x384.jpg', '0', 11, 0, '0', 'Come to some epic destruction in Ragdoll Break: Lets Destroy. In this fun and casual action game, you get to break, crush, and destroy ragdolls. Use all kinds of crazy weapons and tools. Such as umbrellas, cars, balls, and so on. Break ragdolls in the most satisfying way possible. Hit, crush, and smash the ragdolls into pieces.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/m5wcqrk4kjo1akvu7r5kbwmxlxsxnsdx/', 'html5', 720, 1280, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"21\",\"64\",\"65\"]', NULL, 0, 'https://gamemonetize.video/video/m5wcqrk4kjo1akvu7r5kbwmxlxsxnsdx-1742907863.mp4'),
(28, 'gamemonetize-33569', 'roblox-craft-run', 'Roblox Craft Run', 'https://img.gamemonetize.com/ff4tqw2853v969d00ybkce8p8fvs8ogm/512x384.jpg', '0', 2, 0, '0', 'Welcome to begin a 3D running adventure full of speed and creativity in Roblox Craft Run. In this pixel-craft game, youll control your character as he runs and jumps around an exciting platform track. Jump across the bridge and walk into a new level. Start your journey through the maze. Challenge your jumping skills and strategy.', 'Mouse click or tap to play', 'https://html5.gamemonetize.com/ff4tqw2853v969d00ybkce8p8fvs8ogm/', 'html5', 1280, 720, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"56\",\"66\",\"67\",\"68\"]', NULL, 0, 'https://gamemonetize.video/video/ff4tqw2853v969d00ybkce8p8fvs8ogm-1742907856.mp4'),
(29, 'gamemonetize-33568', 'bffs-luxury-loungewear', 'BFFs Luxury Loungewear', 'https://img.gamemonetize.com/znuuz7ynsabs1w8fduoh3up21yjh1odf/512x384.jpg', '0', 10, 0, '0', 'Get ready to style your way to comfort in the BFFs Luxury Loungewear game! Join the fun with Riri, Elsa, Polka, and Bonnie, each with a unique wardrobe. Choose from jersey cotton, knitted, velour, or silk sleepwear and accessories to create stylish sleepover outfits. Exercise your fashion skills and make every slumber party a plush, luxury affair. This game is perfect for budding fashionistas and dress-up game enthusiasts alike!', 'Use your mouse to play this game on a desktop tap to play on a mobile device', 'https://html5.gamemonetize.com/znuuz7ynsabs1w8fduoh3up21yjh1odf/', 'html5', 1024, 768, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"13\",\"69\",\"70\",\"71\",\"72\"]', NULL, 0, 'https://gamemonetize.video/video/znuuz7ynsabs1w8fduoh3up21yjh1odf-1742907843.mp4'),
(30, 'gamemonetize-33567', 'zombie-attack-defense', 'Zombie Attack: Defense', 'https://img.gamemonetize.com/vxnmnevojgzi3ncpdnxk6l480kbjqc4g/512x384.jpg', '0', 1, 0, '0', 'Zombie Attack: Defense is an electrifying 2D game where you face hordes of hungry zombies. Armed to the teeth, fight to survive and save humanity in this apocalyptic chaos. With each wave, the challenge intensifies, demanding strategy and quick reflexes.', 'A D key to Walk W or Spacebar to Jump Left mouse - shoot Right mouse - bomb Z - Nuke', 'https://html5.gamemonetize.com/vxnmnevojgzi3ncpdnxk6l480kbjqc4g/', 'html5', 1280, 720, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"73\",\"58\",\"74\",\"59\",\"51\",\"48\",\"75\"]', NULL, 0, 'https://gamemonetize.video/video/vxnmnevojgzi3ncpdnxk6l480kbjqc4g-1742907838.mp4'),
(31, 'gamemonetize-33566', 'lol-funny-dance', 'LOL Funny Dance', 'https://img.gamemonetize.com/jjw0zbu7uidity0wzrfkbizzk751et0w/512x384.jpg', '0', 1, 0, '0', 'LOL Funny Dance is a hilarious and free-to-play online game perfect for kids. Pick your favorite celebrity, create a funny face, and watch them dance in the silliest ways possible. Enjoy endless laughter and creativity as you bring your character to life with goofy moves. Play now and have fun!', 'Mouse to play', 'https://html5.gamemonetize.com/jjw0zbu7uidity0wzrfkbizzk751et0w/', 'html5', 480, 854, 1743267364, '1', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '[\"24\",\"76\",\"30\",\"30\",\"6\",\"77\",\"78\"]', NULL, 0, 'https://gamemonetize.video/video/jjw0zbu7uidity0wzrfkbizzk751et0w-1742907825.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `gm_links`
--

CREATE TABLE `gm_links` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_chatgpt` tinyint(1) NOT NULL,
  `language_list` varchar(100) DEFAULT 'de,es,fr,it',
  `rewrite_method` varchar(100) DEFAULT NULL,
  `google_translate_language` varchar(100) DEFAULT NULL,
  `last_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_links`
--

INSERT INTO `gm_links` (`id`, `name`, `url`, `is_active`, `is_chatgpt`, `language_list`, `rewrite_method`, `google_translate_language`, `last_id`) VALUES
(1, 'autopost', 'SkqBY8fQnb7w4xhEMLIi9aJDvXtHmr2dg3ZKpORV', 0, 0, 'de,es,fr,it', 'chatgpt', 'es', NULL),
(3, 'autopost_old_games', 'Ko2uJRCIBsDQ6d7Z4pc3PaXzevNTlAO0kxn5tWqm', 0, 0, 'de,es,fr,it', NULL, NULL, 0),
(4, 'autopost_tags', 'VYFQfo4SNL9r6Z2J7WdiDyeOTzbU3HqAmP8gnpac', 0, 0, 'de,es,fr,it', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gm_media`
--

CREATE TABLE `gm_media` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `extension` varchar(250) NOT NULL DEFAULT 'none',
  `type` varchar(250) NOT NULL DEFAULT 'none',
  `url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gm_setting`
--

CREATE TABLE `gm_setting` (
  `id` int(11) NOT NULL,
  `site_name` varchar(500) NOT NULL,
  `site_url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_theme` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_description` varchar(500) NOT NULL DEFAULT 'Best Free Online Games',
  `site_keywords` varchar(500) NOT NULL DEFAULT 'games, online, arcade, html5, gamemonetize',
  `ads_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `ad_time` int(11) NOT NULL DEFAULT 10,
  `language` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `featured_game_limit` int(11) NOT NULL,
  `mp_game_limit` int(11) NOT NULL,
  `xp_play` int(11) NOT NULL,
  `xp_report` int(11) NOT NULL,
  `xp_register` int(11) NOT NULL,
  `plays` int(255) NOT NULL,
  `custom_game_feed_url` varchar(1000) DEFAULT NULL,
  `settings_1` varchar(500) NOT NULL,
  `settings_2` varchar(500) NOT NULL,
  `settings_3` varchar(500) NOT NULL,
  `settings_4` varchar(500) NOT NULL,
  `settings_5` varchar(500) NOT NULL,
  `settings_6` varchar(500) NOT NULL,
  `settings_7` varchar(500) NOT NULL,
  `settings_8` varchar(500) NOT NULL,
  `settings_9` varchar(500) NOT NULL,
  `settings_10` varchar(500) NOT NULL,
  `recaptcha_site_key` varchar(100) DEFAULT NULL,
  `recaptcha_secret_key` varchar(100) DEFAULT NULL,
  `is_sidebar_enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_setting`
--

INSERT INTO `gm_setting` (`id`, `site_name`, `site_url`, `site_theme`, `site_description`, `site_keywords`, `ads_status`, `ad_time`, `language`, `featured_game_limit`, `mp_game_limit`, `xp_play`, `xp_report`, `xp_register`, `plays`, `custom_game_feed_url`, `settings_1`, `settings_2`, `settings_3`, `settings_4`, `settings_5`, `settings_6`, `settings_7`, `settings_8`, `settings_9`, `settings_10`, `recaptcha_site_key`, `recaptcha_secret_key`, `is_sidebar_enabled`) VALUES
(1, 'GameMonetize  - Free Arcade CMS 8.0', 'https://xcmslite.crazygamesx.com', 'crazygames-like', 'x Arcade CMS: Find the best free online games with no downloads required. Enjoy endless fun with games from various genres!', 'games, online, arcade, html5, gamemonetize x', '0', 10, 'english', 0, 0, 0, 0, 0, 8397, 'https://rss.gamemonetize.com/rssfeed.php?format=json&category=All&type=html5&popularity=newest&company=All&amount=30', '', '', '', '', '', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gm_sidebar`
--

CREATE TABLE `gm_sidebar` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category_tags_id` int(11) DEFAULT NULL,
  `custom_link` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ordering` varchar(3) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_sidebar`
--

INSERT INTO `gm_sidebar` (`id`, `name`, `type`, `category_tags_id`, `custom_link`, `icon`, `ordering`) VALUES
(2, 'New Games', 'new', 0, '', 'new_releases', '20'),
(3, 'Popular Games', 'best', 0, '', 'fa-solid fa-ranking-star', '30'),
(4, 'Search', 'search', 0, '', '', '12'),
(5, 'Played Games', 'separator', 0, '', '', '36'),
(6, 'Featured', 'featured', 0, '', 'auto_graph', '35'),
(7, 'Youtube', 'custom', 0, 'https://www.youtube.com/channel/UCNxM6ECVEYNLXJepiyWqA6A?sub_confirmation=1', 'fa-brands fa-youtube', '90'),
(8, 'Separator', 'separator', 0, '', '', '70'),
(10, 'Racing', 'category', 2, '', 'fa-solid fa-flag-checkered', '40'),
(11, 'Action', 'category', 1, '', 'local_fire_department', '43'),
(12, 'Dress Up', 'tags', 9, '', 'fa-solid fa-person-pregnant', '47'),
(13, 'Facebook', 'custom', 0, 'https://www.facebook.com/gamemonetize', 'fa-brands fa-facebook', '95'),
(14, 'Twitter', 'custom', 0, 'https://twitter.com/gamemonetize', 'fa-brands fa-twitter', '97'),
(15, 'Blog', 'blog', 0, '', 'fa-solid fa-blog', '88'),
(16, 'Adventure', 'tags', 49, '', 'explore', '49'),
(17, 'Shooting', 'tags', 74, '', 'fa-solid fa-person-military-rifle', '50'),
(22, 'Gun', 'tags', 57, '', 'fa-solid fa-gun', '59'),
(23, '1 Player', 'tags', 1, '', 'person_outline', '60'),
(25, 'Puzzle', 'category', 5, '', 'fa-solid fa-puzzle-piece', '44'),
(29, 'Clicker', 'tags', 43, '', 'fa-solid fa-arrow-pointer', '67'),
(35, 'sSEPARATOR', 'separator', 0, '', '', '200'),
(36, 'Home', 'home', 0, '', 'home', '5'),
(37, 'separTOR', 'separator', 0, '', '', '89');

-- --------------------------------------------------------

--
-- Table structure for table `gm_sliders`
--

CREATE TABLE `gm_sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category_tags_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=ROCKSDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_sliders`
--

INSERT INTO `gm_sliders` (`id`, `type`, `category_tags_id`, `ordering`) VALUES
(18, 'category', 2, 30),
(25, 'category', 3, 40),
(27, 'category', 5, 50),
(30, 'category', 10, 60),
(34, 'new', 0, 18),
(35, 'tags', 62, 70),
(36, 'category', 1, 80),
(37, 'tags', 49, 90),
(38, 'tags', 43, 100),
(39, 'tags', 128, 110),
(40, 'tags', 130, 120),
(41, 'tags', 9, 130),
(42, 'tags', 178, 140),
(43, 'tags', 166, 150),
(44, 'tags', 195, 160),
(45, 'tags', 300, 170),
(46, 'tags', 33, 180),
(47, 'tags', 239, 190),
(48, 'tags', 2, 200),
(49, 'tags', 3, 210),
(50, 'tags', 200, 220),
(51, 'tags', 143, 230),
(52, 'tags', 60, 240),
(53, 'tags', 169, 250),
(54, 'tags', 91, 260),
(55, 'tags', 252, 270),
(56, 'tags', 203, 180),
(57, 'tags', 72, 280),
(58, 'tags', 243, 290),
(59, 'tags', 259, 300),
(60, 'tags', 97, 310),
(61, 'tags', 57, 320),
(62, 'tags', 94, 330),
(63, 'tags', 260, 340),
(64, 'tags', 457, 350);

-- --------------------------------------------------------

--
-- Table structure for table `gm_tags`
--

CREATE TABLE `gm_tags` (
  `id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `footer_description` text DEFAULT '',
  `is_last_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `is_rewrited` tinyint(1) NOT NULL DEFAULT 0,
  `show_home` tinyint(1) NOT NULL DEFAULT 0,
  `total_games` int(11) DEFAULT 0
) ENGINE=ROCKSDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gm_tags`
--

INSERT INTO `gm_tags` (`id`, `url`, `name`, `footer_description`, `is_last_rewrite`, `is_rewrited`, `show_home`, `total_games`) VALUES
(1, '2048', '2048', '', 0, 0, 0, 2),
(2, 'puzzle', 'Puzzle', '', 0, 0, 0, 1),
(3, 'puzzleblock', 'puzzleblock', '', 0, 0, 0, 9),
(4, 'casual', 'Casual', '', 0, 0, 0, 1),
(5, 'cleaning', 'Cleaning', '', 0, 0, 0, 1),
(6, 'hypercasual', 'Hypercasual', '', 0, 0, 0, 10),
(7, 'relaxation', 'Relaxation', '', 0, 0, 0, 2),
(8, 'simulation', 'Simulation', '', 0, 0, 0, 1),
(9, 'candy', 'Candy', '', 0, 0, 0, 2),
(10, 'food', 'Food', '', 0, 0, 0, 2),
(11, 'ice', 'Ice', '', 0, 0, 0, 1),
(12, 'run', 'run', '', 0, 0, 0, 1),
(13, '1-player', '1 Player', '', 0, 0, 0, 8),
(14, '3d', '3D', '', 0, 0, 0, 2),
(15, 'sort', 'sort', '', 0, 0, 0, 1),
(16, 'sorting', 'sorting', '', 0, 0, 0, 1),
(17, '3d-games', '3D Games', '', 0, 0, 0, 3),
(18, 'action', 'Action', '', 0, 0, 0, 2),
(19, 'angry', 'angry', '', 0, 0, 0, 1),
(20, 'animal', 'Animal', '', 0, 0, 0, 1),
(21, 'cartoon', 'Cartoon', '', 0, 0, 0, 3),
(22, 'crazy', 'Crazy', '', 0, 0, 0, 1),
(23, 'whack', 'Whack', '', 0, 0, 0, 1),
(24, 'arcade', 'Arcade', '', 0, 0, 0, 3),
(25, 'running', 'running', '', 0, 0, 0, 2),
(26, '2d', '2D', '', 0, 0, 0, 4),
(27, 'brain', 'Brain', '', 0, 0, 0, 3),
(28, 'unity-games', 'unity games', '', 0, 0, 0, 1),
(29, 'clicker', 'Clicker', '', 0, 0, 0, 1),
(30, 'funny', 'Funny', '', 0, 0, 0, 6),
(31, 'music', 'Music', '', 0, 0, 0, 1),
(32, 'cook', 'Cook', '', 0, 0, 0, 2),
(33, 'mobile', 'Mobile', '', 0, 0, 0, 2),
(34, 'platform', 'Platform', '', 0, 0, 0, 1),
(35, 'fantasy', 'Fantasy', '', 0, 0, 0, 1),
(36, 'makeover', 'Makeover', '', 0, 0, 0, 1),
(37, 'monster', 'Monster', '', 0, 0, 0, 1),
(38, 'board', 'Board', '', 0, 0, 0, 2),
(39, 'html5-games', 'html5 games', '', 0, 0, 0, 2),
(40, 'king', 'King', '', 0, 0, 0, 1),
(41, 'logical', 'Logical', '', 0, 0, 0, 3),
(42, 'skill', 'Skill', '', 0, 0, 0, 2),
(43, 'best', 'Best', '', 0, 0, 0, 1),
(44, 'kids', 'Kids', '', 0, 0, 0, 1),
(45, 'match-3', 'Match 3', '', 0, 0, 0, 2),
(46, 'baseball', 'Baseball', '', 0, 0, 0, 4),
(47, 'shoot', 'Shoot', '', 0, 0, 0, 1),
(48, 'skills', 'Skills', '', 0, 0, 0, 2),
(49, 'sport', 'Sport', '', 0, 0, 0, 1),
(50, 'color', 'Color', '', 0, 0, 0, 1),
(51, 'shooting', 'Shooting', '', 0, 0, 0, 2),
(52, 'cooking', 'Cooking', '', 0, 0, 0, 1),
(53, 'educational', 'Educational', '', 0, 0, 0, 1),
(54, '2-player', '2 Player', '', 0, 0, 0, 1),
(55, '2-player-games', '2 Player Games', '', 0, 0, 0, 3),
(56, 'adventure', 'Adventure', '', 0, 0, 0, 2),
(57, 'apocalypse', 'apocalypse', '', 0, 0, 0, 1),
(58, 'best-games', 'Best Games', '', 0, 0, 0, 2),
(59, 'defense', 'Defense', '', 0, 0, 0, 2),
(60, 'enemies', 'Enemies', '', 0, 0, 0, 1),
(61, 'free-games-for-your-site', 'free games for your site', '', 0, 0, 0, 1),
(62, 'free-games-for-your-website', 'free games for your website', '', 0, 0, 0, 1),
(63, 'free-html5-games-for-your-website', 'free html5 games for your website', '', 0, 0, 0, 2),
(64, 'destroy', 'destroy', '', 0, 0, 0, 1),
(65, 'weapons', 'weapons', '', 0, 0, 0, 1),
(66, 'craft', 'Craft', '', 0, 0, 0, 1),
(67, 'jump', 'jump', '', 0, 0, 0, 1),
(68, 'pixel', 'Pixel', '', 0, 0, 0, 1),
(69, 'barbie', 'Barbie', '', 0, 0, 0, 1),
(70, 'dress-up', 'Dress Up', '', 0, 0, 0, 1),
(71, 'fashion', 'Fashion', '', 0, 0, 0, 1),
(72, 'princess', 'Princess', '', 0, 0, 0, 1),
(73, 'attack', 'attack', '', 0, 0, 0, 1),
(74, 'bomb', 'Bomb', '', 0, 0, 0, 1),
(75, 'zombie', 'Zombie', '', 0, 0, 0, 1),
(76, 'celebrity', 'Celebrity', '', 0, 0, 0, 1),
(77, 'mouse', 'Mouse', '', 0, 0, 0, 1),
(78, 'point-and-click', 'Point And Click', '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gm_theme`
--

CREATE TABLE `gm_theme` (
  `theme_id` int(11) NOT NULL,
  `theme_class` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=ROCKSDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_theme`
--

INSERT INTO `gm_theme` (`theme_id`, `theme_class`) VALUES
(1, 'style-1'),
(2, 'style-1-image'),
(3, 'style-2'),
(4, 'style-2-image'),
(5, 'style-3'),
(6, 'style-3-image'),
(7, 'style-4'),
(8, 'style-5'),
(9, 'style-6'),
(10, 'style-7');

-- --------------------------------------------------------

--
-- Table structure for table `gm_users`
--

CREATE TABLE `gm_users` (
  `user_id` int(11) NOT NULL,
  `gender` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gm_users`
--

INSERT INTO `gm_users` (`user_id`, `gender`, `about`) VALUES
(1, '1', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gm_account`
--
ALTER TABLE `gm_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_ads`
--
ALTER TABLE `gm_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_blogs`
--
ALTER TABLE `gm_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_categories`
--
ALTER TABLE `gm_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_chatgpt`
--
ALTER TABLE `gm_chatgpt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_footer_description`
--
ALTER TABLE `gm_footer_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_games`
--
ALTER TABLE `gm_games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `gm_links`
--
ALTER TABLE `gm_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_media`
--
ALTER TABLE `gm_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_setting`
--
ALTER TABLE `gm_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gm_sidebar`
--
ALTER TABLE `gm_sidebar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`type`,`category_tags_id`,`custom_link`);

--
-- Indexes for table `gm_sliders`
--
ALTER TABLE `gm_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`category_tags_id`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `gm_tags`
--
ALTER TABLE `gm_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `gm_theme`
--
ALTER TABLE `gm_theme`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `theme_class` (`theme_class`),
  ADD UNIQUE KEY `theme_class_3` (`theme_class`),
  ADD KEY `theme_class_2` (`theme_class`);

--
-- Indexes for table `gm_users`
--
ALTER TABLE `gm_users`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gm_account`
--
ALTER TABLE `gm_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gm_blogs`
--
ALTER TABLE `gm_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gm_categories`
--
ALTER TABLE `gm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gm_chatgpt`
--
ALTER TABLE `gm_chatgpt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gm_footer_description`
--
ALTER TABLE `gm_footer_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gm_games`
--
ALTER TABLE `gm_games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `gm_links`
--
ALTER TABLE `gm_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gm_media`
--
ALTER TABLE `gm_media`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gm_setting`
--
ALTER TABLE `gm_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gm_sidebar`
--
ALTER TABLE `gm_sidebar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `gm_sliders`
--
ALTER TABLE `gm_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `gm_tags`
--
ALTER TABLE `gm_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `gm_theme`
--
ALTER TABLE `gm_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
