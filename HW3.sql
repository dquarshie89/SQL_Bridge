  
# CREATE SCHEMA IF NOT EXISTS `org`;
# USE `org`;
  
# Create users table
DROP TABLE IF EXISTS users;
 
CREATE TABLE users
(
  id int PRIMARY KEY,
  name varchar(50) NOT NULL,
  groupid int 
);

INSERT INTO users (id, name, groupid) VALUES (1, 'Modesto', 1);
INSERT INTO users (id, name, groupid) VALUES (2, 'Ayine', 1);
INSERT INTO users (id, name, groupid) VALUES (3, 'Christopher', 2);
INSERT INTO users (id, name, groupid) VALUES (4, 'Cheng woo', 2);
INSERT INTO users (id, name, groupid) VALUES (5, 'Saulat', 3);
INSERT INTO users (id, name, groupid) VALUES (6, 'Heidy', NULL);

SELECT * FROM users;
  
# Create groups table
DROP TABLE IF EXISTS groups;
 
CREATE TABLE groups
(
 id int PRIMARY KEY,
 team varchar(50) NOT NULL

);

INSERT INTO groups (id, team) VALUES (1, 'IT');
INSERT INTO groups (id, team) VALUES (2, 'Sales');
INSERT INTO groups (id, team) VALUES (3, 'Administration');
INSERT INTO groups (id, team) VALUES (4, 'Operations');

SELECT * FROM groups;


#Create room table
DROP TABLE IF EXISTS room;
 
CREATE TABLE room
(
  id int PRIMARY KEY,
  room varchar(50) NOT NULL
);

INSERT INTO room (id, room) VALUES (1, '101');
INSERT INTO room (id, room) VALUES (2, '102');
INSERT INTO room (id, room) VALUES (3, 'Auditorium A');
INSERT INTO room (id, room) VALUES (4, 'Auditorium B');

SELECT * FROM room;

# Create access table
DROP TABLE IF EXISTS access;
 
CREATE TABLE access
(
  roomid int,
  groupid int 
);

INSERT INTO access (roomid, groupid) VALUES (1, 1);
INSERT INTO access (roomid, groupid) VALUES (2, 1);
INSERT INTO access (roomid, groupid) VALUES (2, 2);
INSERT INTO access (roomid, groupid) VALUES (3, 2);
INSERT INTO access (roomid, groupid) VALUES (NULL, 3);

SELECT * FROM access;

# All groups and the users in each group
Select
g.team,
u.name
from groups g
left join users u
on g.id = u.groupid;

# All rooms and the groups assigned to each room
Select r.room,
g.team
from room r
left join access a
on r.id = a.roomid
left join groups g
on g.id = a.groupid;

# list of users, the groups that they belong to, and the rooms to which they are assigned
select u.name,
g.team,
r.room
from users u 
left join groups g
on u.groupid = g.id
left join access a 
on a.groupid = g.id
left join room r
on r.id = a.roomid 
order by 1,2,3;

