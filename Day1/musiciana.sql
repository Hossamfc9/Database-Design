CREATE TABLE `musician` (
  `ID` int PRIMARY KEY,
  `name` varchar(25),
  `city` varchar(25),
  `street` varchar(25),
  `phone` varchar(25)
);

CREATE TABLE `song` (
  `title` varchar(25) PRIMARY KEY,
  `author` varchar(25)
);

CREATE TABLE `song_musician` (
  `song_title` varchar(25),
  `musician_id` int,
  PRIMARY KEY (`song_title`, `musician_id`)
);

CREATE TABLE `instrument` (
  `name` varchar(25) PRIMARY KEY,
  `instrument_key` varchar(25)
);

CREATE TABLE `album` (
  `album_id` int PRIMARY KEY,
  `producer_id` int,
  `album_date` date,
  `title` varchar(25),
  PRIMARY KEY (`producer_id`)
);

CREATE TABLE `musician_instrument` (
  `musician_id` int,
  `instrument_name` varchar(25),
  PRIMARY KEY (`instrument_name`, `musician_id`)
);

CREATE TABLE `album_song` (
  `song_title` varchar(25) PRIMARY KEY,
  `album_id` int
);

ALTER TABLE `song_musician` ADD FOREIGN KEY (`song_title`) REFERENCES `song` (`title`);

ALTER TABLE `song_musician` ADD FOREIGN KEY (`musician_id`) REFERENCES `musician` (`ID`);

ALTER TABLE `album` ADD FOREIGN KEY (`producer_id`) REFERENCES `musician` (`ID`);

ALTER TABLE `musician_instrument` ADD FOREIGN KEY (`musician_id`) REFERENCES `musician` (`ID`);

ALTER TABLE `musician_instrument` ADD FOREIGN KEY (`instrument_name`) REFERENCES `instrument` (`name`);

ALTER TABLE `album_song` ADD FOREIGN KEY (`song_title`) REFERENCES `song` (`title`);

ALTER TABLE `album_song` ADD FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`);
