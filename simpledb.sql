drop database simpledb;

CREATE DATABASE simpledb;
USE simpledb;
SET GLOBAL time_zone = '+3:00';

CREATE TABLE user (
  id int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL
);

CREATE TABLE account (
  id int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  account int(10) DEFAULT NULL,
  userid int(10) NOT NULL,
  FOREIGN KEY (userid)  REFERENCES user (id) ON DELETE CASCADE
) ;

LOCK TABLES user WRITE;
INSERT INTO `user` VALUES (1,'John','Snow'),(2,'Arya','Stark'),(3,'Jaime','Lannister'),(4,'Sansa','Stark'),
						  (5,'Daenerys','Targaryen'),(6,'Cersei ','Lannister'),(7,'Tyrio','Lannister'),(8,'Tywin','Lannister'),
                          (9,'Robb','Stark'),(10,'Joffrey','Baratheon');
UNLOCK TABLES;

LOCK TABLES Account WRITE;
INSERT INTO Account VALUES (1,100,1),(2,200,2),(3,300,3),(4,500,4),(5,500,5),
							 (6,600,6),(7,700,7),(8,800,8),(9,900,9),(10,1000,10);
UNLOCK TABLES;

CREATE VIEW alldata AS 
SELECT user.id as userid, user.firstname, user.lastname, account.id as accountid, account.account
from user 
inner join account on  user.id=account.userid;

DELIMITER // 

CREATE PROCEDURE delete_user_accounts_by_id
	(p_id_user int)
BEGIN

delete from user 
where user.id=p_id_user;


END//
