-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2025 at 11:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1_2_1_Youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id_channel` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(800) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id_channel`, `user_id`, `name`, `description`, `creation_date`) VALUES
(1, 11, 'Rodri’s garden', 'Welcome to Rodri\'s Garden, where passion meets nature in every bloom. Join me for gardening tutorials, plant care tips, and the journey of turning spaces into serene oases.', '2025-04-01'),
(2, 12, 'Leire and the fantastical', 'Step into a world of wonder where imagination knows no bounds. Join Leire on magical adventures through fantasy stories, creative crafts, and enchanted DIY projects.', '2025-02-14'),
(3, 13, 'John’s corner', 'Pull up a chair and join the conversation at John\'s Corner, where everyday life meets interesting perspectives. From personal stories to thoughtful discussions, there\'s always room for one more.', '2020-03-11'),
(4, 14, 'Cooking with patience', 'Discover the joy of mindful cooking with carefully crafted recipes and techniques that transform ordinary ingredients into extraordinary meals. Where patience meets passion in the kitchen.', '2022-09-30'),
(5, 15, 'Lulu plays', 'Join Lulu\'s playful adventures through games, challenges, and fun activities designed to bring smiles and spark imagination in young minds.', '2016-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `text` varchar(1600) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_comment`, `user_id`, `video_id`, `text`, `date_time`) VALUES
(1, 13, 3, 'I can\'t believe it! This video has opened my eyes. I\'ll never look at frogs the same way again... #believer', '2025-04-06 10:20:10'),
(2, 14, 3, 'this is bullshit', '2025-04-08 10:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `comment_like_dislike`
--

CREATE TABLE `comment_like_dislike` (
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `opinion` enum('like','dislike') NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_like_dislike`
--

INSERT INTO `comment_like_dislike` (`user_id`, `video_id`, `comment_id`, `opinion`, `date_time`) VALUES
(13, 4, 1, 'like', '2025-04-08 10:23:31'),
(15, 3, 2, 'dislike', '2025-04-08 10:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `creation_date` date NOT NULL,
  `visibility` enum('public','private') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id_playlist`, `user_id`, `name`, `creation_date`, `visibility`) VALUES
(1, 13, 'best videos haha!', '2024-04-01', 'public'),
(2, 12, 'for sad moments', '2025-04-01', 'private');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_video`
--

CREATE TABLE `playlist_video` (
  `playlist_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist_video`
--

INSERT INTO `playlist_video` (`playlist_id`, `video_id`) VALUES
(2, 3),
(2, 1),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`user_id`, `channel_id`) VALUES
(15, 4),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female','other','') NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `username`, `birthdate`, `gender`, `country`, `postal_code`) VALUES
(11, 'rodrigo@mail.com', '123456', 'elRodri', '2025-04-01', 'male', 'Spain', 8012),
(12, 'leire@mail.com', 'password', 'LeiLei', '2024-11-16', 'female', 'Spain', 8950),
(13, 'john@mail.com', 'p4ssw0rd', 'JohnnyJ', '2018-01-10', 'male', 'UK', 14501),
(14, 'kay@mail.com', '123789', 'kay1993', '2021-05-01', 'other', 'France', 78701),
(15, 'lu@mail.com', 'xjasPPdj**1asd02_', 'lucia_Lp02', '2014-01-01', 'female', 'Italy', 324051);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `description` varchar(800) NOT NULL,
  `size` int(11) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `length` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL COMMENT 'The thumbnails will be stored in the cloud. This VARCHAR is the path to each image',
  `views` int(11) NOT NULL,
  `likes_total` int(11) NOT NULL,
  `dislikes_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id_video`, `title`, `channel_id`, `description`, `size`, `filename`, `length`, `thumbnail`, `views`, `likes_total`, `dislikes_total`) VALUES
(1, 'Top 10 garden flowers', 1, 'In this video we’ll see the top 10 flowers for your garden! Wait till the end to discover number 10, it’ll surprise you!', 1000, 'gardenflwesrs_v1_final_FINAL.mp4', 1353, 'www.cloud.com/flowers', 9000, 4014, 154),
(2, 'You won’t believe this gardening hack D:', 1, 'placeholder', 1250, 'clickbait_title_asdd.mp4.mp4', 1748, 'www.cloud.com/flowers', 141500, 47011, 200),
(3, 'Frogs, are they what we think they are? Let’s find out', 3, 'In a world where nothing is as it seems, ordinary people reveal their hidden, extraordinary abilities, turning the mundane into the magical. Secrets unravel as friends and family discover that their loved ones are far more than they appear, blurring the lines between reality and the surreal.', 2004, 'frogsomg.mov', 2700, 'www.cloud.com/frogs', 541015, 78009, 60142),
(4, 'I bet you’ve never heard of this game before. Let’s play together!', 5, 'Today I’ll bring to you a hidden gem that I bet none of you’ve ever played before. An indie game called Fortnite :D', 800, 'Fortinefortine_32.mp4', 1240, 'www.cloud.com/fortnite', 104, 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `video_like_dislike`
--

CREATE TABLE `video_like_dislike` (
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `opinion` enum('like','dislike') NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_like_dislike`
--

INSERT INTO `video_like_dislike` (`user_id`, `video_id`, `opinion`, `date_time`) VALUES
(13, 3, 'like', '2025-04-01 10:16:53'),
(12, 1, 'dislike', '2025-04-08 10:17:05'),
(11, 1, 'like', '2025-04-03 10:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `video_tag`
--

CREATE TABLE `video_tag` (
  `id_video_tag` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_tag`
--

INSERT INTO `video_tag` (`id_video_tag`, `video_id`, `name`) VALUES
(1, 3, 'frogs'),
(2, 3, 'wake_up'),
(3, 4, 'fortnite'),
(4, 4, 'gaming'),
(5, 1, 'gardening'),
(6, 2, 'hack');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id_channel`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `comment_like_dislike`
--
ALTER TABLE `comment_like_dislike`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `playlist_video`
--
ALTER TABLE `playlist_video`
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `video_like_dislike`
--
ALTER TABLE `video_like_dislike`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `video_tag`
--
ALTER TABLE `video_tag`
  ADD PRIMARY KEY (`id_video_tag`),
  ADD KEY `video_id` (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id_channel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id_playlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `video_tag`
--
ALTER TABLE `video_tag`
  MODIFY `id_video_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `channel`
--
ALTER TABLE `channel`
  ADD CONSTRAINT `channel_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `comment_like_dislike`
--
ALTER TABLE `comment_like_dislike`
  ADD CONSTRAINT `comment_like_dislike_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `comment_like_dislike_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `comment_like_dislike_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id_comment`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `playlist_video`
--
ALTER TABLE `playlist_video`
  ADD CONSTRAINT `playlist_video_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `playlist_video_ibfk_3` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id_playlist`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id_channel`),
  ADD CONSTRAINT `subscription_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id_channel`);

--
-- Constraints for table `video_like_dislike`
--
ALTER TABLE `video_like_dislike`
  ADD CONSTRAINT `video_like_dislike_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`),
  ADD CONSTRAINT `video_like_dislike_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `video_tag`
--
ALTER TABLE `video_tag`
  ADD CONSTRAINT `video_tag_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
