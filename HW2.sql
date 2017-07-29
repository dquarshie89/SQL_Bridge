#1. Create videos table
DROP TABLE IF EXISTS videos;
CREATE TABLE videos
(
  id int PRIMARY KEY,
  title varchar(100) NOT NULL,
  length int NOT NULL,
  url varchar(100) NOT NULL
);

INSERT INTO videos(id,title,length,url) VALUES (1,'Thor: Ragnarok Official Trailer',3,'https://www.youtube.com/watch?v=ue80QwXMRHg');
INSERT INTO videos(id,title,length,url) VALUES (2,'Black Panther Teaser Trailer',2,'https://www.youtube.com/watch?v=dxWvtMOGAhw');
INSERT INTO videos(id,title,length,url) VALUES (3,'Stranger Things Season 2 Trailer',3,'https://www.youtube.com/watch?v=vgS2L7WPIO4');

DROP TABLE IF EXISTS reviews;
 
#2. Create reviews table
CREATE TABLE reviews
(
  id int PRIMARY KEY,
  video_id int NOT NULL REFERENCES videos,
  user varchar(50) NOT NULL,
  rating int,
  review varchar(100) NOT NULL
);

INSERT INTO reviews(id,video_id,user,rating,review) VALUES (1,1,'David',5,'Can''t wait!!');
INSERT INTO reviews(id,video_id,user,rating,review) VALUES (2,1,'Dawn',0,'No one needs this');
INSERT INTO reviews(id,video_id,user,rating,review) VALUES (3,2,'Lauren',5,'Finally!!');
INSERT INTO reviews(id,video_id,user,rating,review) VALUES (4,2,'Luke', 5,'YESSSSSS');
INSERT INTO reviews(id,video_id,user,rating,review) VALUES (5,3,'Brooke',1,'Not for me');
INSERT INTO reviews(id,video_id,user,rating,review) VALUES (6,3,'Blake',5,'Eleven!!');

select * from videos;
select * from reviews;

#3. Report on video reviews
# Get the video names, their reviewers, and the reviews they left for the video
SELECT v.title,
r.user,
r.review
FROM videos v
LEFT JOIN reviews r
on v.id = r.video_id;