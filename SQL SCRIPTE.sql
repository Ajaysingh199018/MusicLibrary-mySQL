#  TO Create A Data Base
CREATE DATABASE Music_Liberary;
# TO USE DATABASE
USE MUSIC_LIBERARY;
# TO CREATE TABLE WITH COLUMNS
CREATE TABLE MUSIC(M_ID INT PRIMARY KEY, M_NAME VARCHAR(20) NOT NULL, SINGER_NAME VARCHAR(25), R_DATE DATE NOT NULL);
# TO DESCRIBE TABLE
DESC MUSIC;
# TO SELECT TABLE
SELECT*FROM MUSIC;
# INSERT VALUE IN COLUMNS
INSERT MUSIC VALUES (1,'SANAM RE','ARJIT SINGH','2020-02-10'),
(2,'Khamoshiya','Sonu nigam','2021-05-20'),
(3,'Desi boys','Mika Singh','2018-03-30'),
(4,'Tum hi ho','Arijit Singh','2022-08-15'),
(5,'Uad ja kale kawa','Udit Narayan','2010-12-28');
 
 # TO ADD COLUMN IN TABLE
 ALTER TABLE MUSIC
 ADD COLUMN MOVIE_NAME VARCHAR(25)
 
 
SELECT*FROM MUSIC;
UPDATE MUSIC
 SET MOVIE_NAME='SHOLEY'
 WHERE M_ID=1;
 
UPDATE MUSIC
 SET MOVIE_NAME='SANAM RE'
 WHERE M_ID=2;
 
 UPDATE MUSIC
 SET MOVIE_NAME='AGNIPATH'
 WHERE M_ID=3;
 
 UPDATE MUSIC
 SET MOVIE_NAME='JANNAT'
 WHERE M_ID=4;
 
 UPDATE MUSIC
 SET MOVIE_NAME='GADAR'
 WHERE M_ID=5;
  # TO ADD COLUMN IN TABLE

 SELECT * FROM MUSIC;
 USE MUSIC_LIBERARY;
 ALTER TABLE music
 ADD COLUMN SINGER_PAYMENT FLOAT NOT NULL;
 SET SQL_SAFE_UPDATES=0;

 UPDATE music
 SET SINGER_PAYMENT=200000
 WHERE M_ID= 1; 
 
  UPDATE music
 SET SINGER_PAYMENT=254252
 WHERE M_ID= 2; 
  UPDATE music
 SET SINGER_PAYMENT=365245
 WHERE M_ID= 3; 
 
  UPDATE music
 SET SINGER_PAYMENT=142544
 WHERE M_ID= 4; 
 
  UPDATE music
 SET SINGER_PAYMENT=524154
 WHERE M_ID= 5; 
 SELECT*FROM MUSIC;
 
 SET SQL_SAFE_UPDATES=0; 
 SELECT*FROM MUSIC;
 # AIRTHMATIC OPERATOR
 SELECT M_ID,SINGER_PAYMENT+100000 AS 'NEW PAYMENT' FROM MUSIC;
  SELECT SINGER_NAME ,SINGER_PAYMENT  - 100000 AS 'NEW PAYMENT' FROM MUSIC;
  
 # RELATIONAL OPERATOR
 SELECT *FROM MUSIC
 WHERE SINGER_PAYMENT >=230000;
 
 SELECT *FROM MUSIC
 WHERE SINGER_PAYMENT <=230000; 
 #BETWEEN AND IN
  SELECT *FROM MUSIC
 WHERE SINGER_PAYMENT BETWEEN 120000 AND 400000;
 
SELECT* FROM Music
WHERE Singer_NAME  in('Arijit Singh', 'Mika Singh', 'Udit Narayan');
 
 # LIKE OPERATOR
 SELECT* FROM music
 WHERE M_NAME LIKE  '%A';
 
SELECT * FROM Music;
WHERE M_Name LIKE '_____%A';


#Logical Operator AND OR NOT
SELECT *FROM music
WHERE SINGER_NAME ='ARIJIT SINGH'AND MOVIE_NAME='JANNAT';

SELECT *FROM music
WHERE SINGER_NAME ='ARIJIT SINGH'OR MOVIE_NAME='JANNAT';

SELECT*FROM MUSIC 
WHERE NOT SINGER_NAME ='SONU NIGAM';


#Aggeregate Functions

SELECT COUNT(M_Id) AS 'Total ID' FROM Music ;
SELECT MIN(Singer_Payment)  FROM Music ;
SELECT MAX(Singer_Payment)  FROM Music;
SELECT SUM(Singer_Payment)  FROM Music ;
SELECT AVG(Singer_Payment)  FROM Music;

#single row function

SELECT UPPER (SINGER_NAME)FROM MUSIC;
SELECT LOWER(SINGER_NAME)FROM MUSIC;
SELECT CONCAT(SINGER_NAME)FROM MUSIC;
SELECT SINGER_NAME,REPLACE('ARIJIT SINGH','A','T') AS 'REPLACED NAME'FROM MUSIC WHERE M_ID=1;
SELECT SINGER_NAME ,SUBSTR('MIKA SINGH',1,3)FROM MUSIC WHERE M_ID=3;

SELECT sqrt(Singer_Payment) from Music;
SELECT ROUND(Singer_Payment) from Music;
SELECT MOD(10,422);
select current_timestamp();
select current_time();
select current_date();
select current_user();

#Group by Clouse
SELECT Singer_NAME, MAX(Singer_Payment)
FROM Music
GROUP BY M_Id
Having MAX(Singer_Payment)>=123000;

#SUB QUERY
select * from Music
where Singer_Payment=
(
select max(Singer_Payment)  from Music
);

select * from Music
where Singer_Payment=
(
select MIN(Singer_Payment)  from Music
);


select * from Music
order by Singer_Payment desc
limit 1
offset 2;

SELECT * FROM MUSIC;


 CREATE TABLE Music_review
(
S_Id int PRIMARY KEY ,
M_lOCATION VARCHAR(20) NOT NULL,
Views int NOT NULL,
R_platform VARCHAR(20) NOT NULL,
M_Id int,
Foreign key (M_Id) references Music(M_Id)
);
DESC Music_review;
SET SQL_SAFE_UPDATES=0; 
INSERT Music_review VALUES(1,'Shimla',2000000,'Youtube',1),
(2,'Manali',2000000,'Spotify',2),
(3,'Delhi',350000,'wynk',3),
(4,'Mumbai',535423,'jio savan',4),
(5,'Dehradun',124525,'Youtube',5);

SELECT * FROM Music_review;

SELECT * FROM Music,Music_review
where Music.M_Id=Music_review.M_Id;

SELECT * FROM Music
JOIN Music_review
ON Music.M_Id=Music_review.M_Id;


#inner Join
SELECT * FROM music INNER JOIN Music_review
ON Music.M_Id=Music_review.M_Id;


#Left Join
SELECT * FROM Music LEFT OUTER JOIN Music_review
ON Music.M_Id = Music_review.M_Id;

#Right Join
SELECT * FROM Music RIGHT OUTER JOIN Music_review
ON Music.M_Id = Music_review.M_Id;
