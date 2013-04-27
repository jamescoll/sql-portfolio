/*TO DO
DDL Complete
- Check For Errors
- Start Queries
- Start Write-up
*/

CREATE TABLE tbl_user (
	id NUMBER(10) NOT NULL,
	fname VARCHAR2(60) NOT NULL,
	mname VARCHAR2(60),
	lname VARCHAR2(60) NOT NULL,
        username VARCHAR2(60) NOT NULL,
        email_address VARCHAR2(100) NOT NULL,
	dateofbirth DATE NOT NULL,
	birthcountry NUMBER(10) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE tbl_review (
	id NUMBER(10) NOT NULL,
	user_creator NUMBER(10) NOT NULL,
	review_title VARCHAR2(150),
	review_body CLOB,
      	creation_date DATE NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE tbl_password (
	password_hash   VARCHAR2(40) NOT NULL,
	user_id NUMBER(10) NOT NULL,
	PRIMARY KEY(password_hash, user_id)
);



CREATE TABLE tbl_actor (
	id NUMBER(10) NOT NULL,
	fname VARCHAR2(60) NOT NULL,
	mname VARCHAR2(60),
	lname VARCHAR2(60) NOT NULL,
	dateofbirth DATE NOT NULL,
	dateofdeath DATE,
	birthcountry NUMBER(10) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_actormovie (
	actor_id NUMBER(10) NOT NULL,
	movie_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,actor_id)
);

CREATE TABLE tbl_country (
	id NUMBER(10) NOT NULL,
	iso3 CHAR(3),
	name_en VARCHAR2(64),
	PRIMARY KEY (id)
);

CREATE TABLE tbl_director (
	id NUMBER(10) NOT NULL,
	fname VARCHAR2(60) NOT NULL,
	mname VARCHAR2(60),
	lname VARCHAR2(60) NOT NULL,
	dateofbirth DATE NOT NULL,
	dateofdeath DATE,
	birthcountry NUMBER(10) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_directormovie (
	director_id NUMBER(10) NOT NULL,
	movie_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,director_id)
);

CREATE TABLE tbl_directorepisode (
	director_id NUMBER(10) NOT NULL,
	episode_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,episode_id)
);

CREATE TABLE tbl_genre (
	genre_id NUMBER(10) NOT NULL,
	genre_title VARCHAR2(40) NOT NULL,
	PRIMARY KEY (genre_id)
);

CREATE TABLE tbl_language (
	id NUMBER(10) NOT NULL,
	iso3 VARCHAR2(3) NOT NULL,
	language_en VARCHAR2(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_lucolor (
	id NUMBER(3) NOT NULL,
	color_format VARCHAR2(25) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_lusound (
	id NUMBER(3) NOT NULL,
	sound_format VARCHAR2(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_movie (
	id NUMBER(10) NOT NULL,
	title_en VARCHAR2(150) NOT NULL,
	title_alt VARCHAR2(150),
	year NUMBER(10) NOT NULL,
	runtime NUMBER(10) NOT NULL,
	plot VARCHAR2(750),
	color NUMBER(3) NOT NULL,
	silent NUMBER(3) NOT NULL,
	rating_rt NUMBER(10),
	rating_imdb NUMBER(3,2),
	PRIMARY KEY (id)
);

CREATE TABLE tbl_series (
	id NUMBER(10) NOT NULL,
	title_en VARCHAR2(150) NOT NULL,
	title_alt VARCHAR2(150),
	startyear NUMBER(10) NOT NULL,
        endyear NUMBER(10) NOT NULL,
	plot VARCHAR2(750),
	episode_length NUMBER(10) NOT NULL,
	country NUMBER(10) NOT NULL,
	color NUMBER(3) NOT NULL,
	silent NUMBER(3) NOT NULL,
	rating_rt NUMBER(10),
	rating_imdb NUMBER(3,2),
	PRIMARY KEY (id)
);

CREATE TABLE tbl_episode (
	id NUMBER(10) NOT NULL,
	episode_title VARCHAR2(150) NOT NULL,
	series_id NUMBER(10) NOT NULL,
	season NUMBER(10) NOT NULL,
        episode_no NUMBER(10) NOT NULL,
	PRIMARY KEY (id)
);



CREATE TABLE tbl_seriesgenre (
	series_id NUMBER(10) NOT NULL,
	genre_id NUMBER(10) NOT NULL,
	PRIMARY KEY (series_id,genre_id)
);

CREATE TABLE tbl_actorseries (
	actor_id NUMBER(10) NOT NULL,
	series_id NUMBER(10) NOT NULL,
	PRIMARY KEY (series_id,actor_id)
);
CREATE TABLE tbl_moviecountry (
	movie_id NUMBER(10) NOT NULL,
	country_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,country_id)
);



CREATE TABLE tbl_moviereview (
	movie_id NUMBER(10) NOT NULL,
	review_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,review_id)
);



CREATE TABLE tbl_seriesreview (
	series_id NUMBER(10) NOT NULL,
	review_id NUMBER(10) NOT NULL,
	PRIMARY KEY (series_id,review_id)
);

CREATE TABLE tbl_moviegenre (
	movie_id NUMBER(10) NOT NULL,
	genre_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,genre_id)
);

CREATE TABLE tbl_movielanguage (
	movie_id NUMBER(10) NOT NULL,
	language_id NUMBER(10) NOT NULL,
	PRIMARY KEY (movie_id,language_id)
);

CREATE TABLE tbl_episodeseries (
	series_id NUMBER(10) NOT NULL,
	episode_id NUMBER(10) NOT NULL,
	PRIMARY KEY (series_id, episode_id)
);

CREATE TABLE tbl_directorepisode (
	director_id NUMBER(10) NOT NULL,
	episode_id NUMBER(10) NOT NULL,
	PRIMARY KEY (director_id, episode_id)
);

ALTER TABLE tbl_episodeseries 
	ADD FOREIGN KEY (series_id)
	REFERENCES tbl_series (id);

ALTER TABLE tbl_episodeseries
	ADD FOREIGN KEY (episode_id)
	REFERENCES tbl_episode(id);

ALTER TABLE tbl_user
	ADD FOREIGN KEY (id) 
	REFERENCES tbl_password (user_id);

ALTER TABLE tbl_user
	ADD FOREIGN KEY (birthcountry) 
	REFERENCES tbl_country (id);

ALTER TABLE tbl_review
	ADD FOREIGN KEY (user_creator) 
	REFERENCES tbl_user (id);

ALTER TABLE tbl_actorseries
	ADD FOREIGN KEY (actor_id) 
	REFERENCES tbl_actor (id);

ALTER TABLE tbl_actorseries
	ADD FOREIGN KEY (series_id) 
	REFERENCES tbl_series (id);


ALTER TABLE tbl_seriesgenre
	ADD FOREIGN KEY (genre_id) 
	REFERENCES tbl_genre (genre_id);

ALTER TABLE tbl_seriesgenre
	ADD FOREIGN KEY (series_id) 
	REFERENCES tbl_series (id);

ALTER TABLE tbl_actor
	ADD FOREIGN KEY (birthcountry) 
	REFERENCES tbl_country (id);


ALTER TABLE tbl_actormovie
	ADD FOREIGN KEY (actor_id) 
	REFERENCES tbl_actor (id);

ALTER TABLE tbl_actormovie
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);

ALTER TABLE tbl_episode
	ADD FOREIGN KEY (series_id) 
	REFERENCES tbl_series (id);

ALTER TABLE tbl_director
	ADD FOREIGN KEY (birthcountry) 
	REFERENCES tbl_country (id);

ALTER TABLE tbl_moviereview
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);

ALTER TABLE tbl_moviereview
	ADD FOREIGN KEY (review_id) 
	REFERENCES tbl_review (id);

ALTER TABLE tbl_seriesreview
	ADD FOREIGN KEY (series_id) 
	REFERENCES tbl_series (id);

ALTER TABLE tbl_seriesreview
	ADD FOREIGN KEY (review_id) 
	REFERENCES tbl_review (id);

ALTER TABLE tbl_directormovie
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);

ALTER TABLE tbl_directormovie
	ADD FOREIGN KEY (director_id) 
	REFERENCES tbl_director (id);

ALTER TABLE tbl_password
	ADD FOREIGN KEY (user_id) 
	REFERENCES tbl_user (id);

ALTER TABLE tbl_movie
	ADD FOREIGN KEY (silent) 
	REFERENCES tbl_lusound (id);

ALTER TABLE tbl_movie
	ADD FOREIGN KEY (color) 
	REFERENCES tbl_lucolor (id);

ALTER TABLE tbl_series
	ADD FOREIGN KEY (silent) 
	REFERENCES tbl_lusound (id);

ALTER TABLE tbl_series
	ADD FOREIGN KEY (color) 
	REFERENCES tbl_lucolor (id);

ALTER TABLE tbl_series
	ADD FOREIGN KEY (country) 
	REFERENCES tbl_country (id);


ALTER TABLE tbl_moviecountry
	ADD FOREIGN KEY (country_id) 
	REFERENCES tbl_country (id);

ALTER TABLE tbl_moviecountry
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);



ALTER TABLE tbl_series
	ADD FOREIGN KEY (country)
	REFERENCES tbl_country (id);


ALTER TABLE tbl_moviegenre
	ADD FOREIGN KEY (genre_id) 
	REFERENCES tbl_genre (genre_id);

ALTER TABLE tbl_moviegenre
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);


ALTER TABLE tbl_movielanguage
	ADD FOREIGN KEY (language_id) 
	REFERENCES tbl_language (id);

ALTER TABLE tbl_movielanguage
	ADD FOREIGN KEY (movie_id) 
	REFERENCES tbl_movie (id);

ALTER TABLE tbl_directorepisode
	ADD FOREIGN KEY (director_id) 
	REFERENCES tbl_director (id);

ALTER TABLE tbl_directorepisode
	ADD FOREIGN KEY (episode_id) 
	REFERENCES tbl_episode(id);


INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (1, 'Marlon', '', 'Brando', to_date('04/03/1924', 'MM/DD/YYYY'), to_date('07/01/2007', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (2, 'Alfredo', 'James', 'Pacino', to_date('04/25/1940', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (3, 'James', 'Edmund', 'Caan', to_date('03/26/1940', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (4, 'Jean-Louis', '', 'Trintignant', to_date('12/11/1930', 'MM/DD/YYYY'), '', 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (5, 'Stefania', '', 'Sandrelli', to_date('06/05/1946', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (6, 'Gastone', '', 'Moschin', to_date('06/08/1929', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (7, 'Robert', '', 'De Niro', to_date('08/17/1943', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (8, 'Robert', 'Selden', 'Duvall', to_date('01/05/1931', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (9, 'Estelle', 'Louise', 'Fletcher', to_date('07/22/1934', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (10, 'Jack', '', 'Nicholson', to_date('04/22/1937', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (11, 'Martin', '', 'Sheen', to_date('08/03/1940', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (12, 'Faye', '', 'Dunaway', to_date('01/14/1941', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (13, 'John', 'Marcellus', 'Huston', to_date('08/05/1906', 'MM/DD/YYYY'), to_date('08/28/1987', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (14, 'Malcolm', '', 'McDowell', to_date('06/13/1943', 'MM/DD/YYYY'), '', 84);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (15, 'Mark', 'Richard', 'Hamill', to_date('09/25/1951', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (16, 'Harrison', '', 'Ford', to_date('07/13/1942', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (17, 'Carrie', 'Frances', 'Fisher', to_date('10/21/1956', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (18, 'Roy', 'Richard', 'Scheider', to_date('11/10/1932', 'MM/DD/YYYY'), to_date('02/10/2008', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (19, 'Richard', 'Stephen', 'Dreyfuss', to_date('10/29/1947', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (20, 'Robert', 'Archibald', 'Shaw', to_date('08/09/1927', 'MM/DD/YYYY'), to_date('08/28/1978', 'MM/DD/YYYY'), 84);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (21, 'Harvey', '', 'Keitel', to_date('05/13/1939', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (22, 'Jodie', '', 'Foster', to_date('11/19/1962', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (23, 'Christopher', '', 'Walken', to_date('03/31/1943', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (24, 'John', 'Holland', 'Cazale', to_date('08/12/1935', 'MM/DD/YYYY'), to_date('03/12/1978', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (25, 'Jaqueline', '', 'Bisset', to_date('09/13/1944', 'MM/DD/YYYY'), '', 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (26, 'Valentina', '', 'Cortese', to_date('01/01/1923', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (27, 'Jean-Pierre', '', 'Aumont', to_date('01/05/1911', 'MM/DD/YYYY'), to_date('01/30/2001', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (28, 'Erland', '', 'Josephson', to_date('06/15/1923', 'MM/DD/YYYY'), to_date('02/25/2012', 'MM/DD/YYYY'), 206);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (29, 'Liv', 'Johanne', 'Ullmann', to_date('12/16/1938', 'MM/DD/YYYY'), '', 206);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (30, 'Harriet', '', 'Andersson', to_date('02/14/1932', 'MM/DD/YYYY'), '', 206);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (31, 'Johnny', '', 'Dorelli', to_date('02/20/1937', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (32, 'Anna', '', 'Karina', to_date('09/22/1940', 'MM/DD/YYYY'), '', 59);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (33, 'Lino', '', 'Capolicchio', to_date('08/21/1943', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (34, 'Dominique', '', 'Sanda', to_date('03/11/1951', 'MM/DD/YYYY'), '', 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (35, 'Helmut', '', 'Berger', to_date('05/29/1944', 'MM/DD/YYYY'), '', 15);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (36, 'Fernando', 'Casado', 'Arambillet', to_date('08/20/1917', 'MM/DD/YYYY'), to_date('03/09/1994', 'MM/DD/YYYY'), 200);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (37, 'Paul', '', 'Frankeur', to_date('06/29/1905', 'MM/DD/YYYY'), to_date('10/27/1974', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (38, 'Delphine', 'Claire Beltiane', 'Seyrig', to_date('04/10/1932', 'MM/DD/YYYY'), to_date('11/15/1990', 'MM/DD/YYYY'), 119);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (39, 'Monique', '', 'van de Ven', to_date('07/28/1952', 'MM/DD/YYYY'), '', 151);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (40, 'Rutger', 'Oelsen', 'Hauer', to_date('01/23/1944', 'MM/DD/YYYY'), '', 151);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (41, 'Alexander', '', 'Kaidanovsky', to_date('07/23/1946', 'MM/DD/YYYY'), to_date('12/03/1995', 'MM/DD/YYYY'), 178);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (42, 'Anatoly', '', 'Solonitsyn', to_date('08/30/1934', 'MM/DD/YYYY'), to_date('06/11/1982', 'MM/DD/YYYY'), 178);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (43, 'Nikolai', 'Grigoryevich', 'Grinko', to_date('05/22/1920', 'MM/DD/YYYY'), to_date('04/10/1989', 'MM/DD/YYYY'), 178);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (44, 'Maxim', 'Monguzhukovich', 'Munzuk', to_date('09/15/1912', 'MM/DD/YYYY'), to_date('07/28/1999', 'MM/DD/YYYY'), 178);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (45, 'Yury', 'Mefodievich', 'Solomin', to_date('06/18/1935', 'MM/DD/YYYY'), '', 178);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (46, 'Bruce', '', 'Lee', to_date('11/27/1940', 'MM/DD/YYYY'), to_date('07/20/1973', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (47, 'Jim', '', 'Kelly', to_date('05/05/1946', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (48, 'John', '', 'Saxon', to_date('08/05/1935', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (49, 'Helmut', '', 'Kohl', to_date('08/05/1935', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (1, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (1, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (1, 5);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (2, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (2, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (3, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (3, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (4, 2);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (5, 2);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (6, 2);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (7, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (7, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (7, 9);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (7, 10);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (8, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (8, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (8, 5);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (9, 4);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (10, 4);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (10, 11);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (11, 5);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (12, 11);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (13, 11);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (14, 6);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (15, 7);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (16, 7);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (17, 7);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (18, 8);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (19, 8);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (20, 8);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (21, 9);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (22, 9);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (23, 10);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (24, 1);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (24, 3);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (24, 10);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (25, 12);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (26, 12);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (27, 12);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (28, 13);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (29, 13);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (30, 13);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (31, 14);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (32, 14);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (33, 15);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (34, 15);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (35, 15);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (36, 16);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (37, 16);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (38, 16);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (39, 17);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (40, 17);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (41, 18);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (42, 18);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (43, 18);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (44, 19);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (45, 19);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (46, 20);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (47, 20);
INSERT INTO tbl_actormovie(actor_id, movie_id) VALUES (48, 20);
INSERT INTO tbl_country(id, iso3, name_en) VALUES (1, 'AFG', 'Afghanistan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (2, 'ALA', 'Åland Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (3, 'ALB', 'Albania');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (4, 'DZA', 'Algeria (El Djazaïr)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (5, 'ASM', 'American Samoa');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (6, 'AND', 'Andorra');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (7, 'AGO', 'Angola');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (8, 'AIA', 'Anguilla');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (9, 'ATA', 'Antarctica');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (10, 'ATG', 'Antigua and Barbuda');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (11, 'ARG', 'Argentina');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (12, 'ARM', 'Armenia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (13, 'ABW', 'Aruba');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (14, 'AUS', 'Australia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (15, 'AUT', 'Austria');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (16, 'AZE', 'Azerbaijan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (17, 'BHS', 'Bahamas');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (18, 'BHR', 'Bahrain');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (19, 'BGD', 'Bangladesh');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (20, 'BRB', 'Barbados');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (21, 'BLR', 'Belarus');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (22, 'BEL', 'Belgium');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (23, 'BLZ', 'Belize');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (24, 'BEN', 'Benin');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (25, 'BMU', 'Bermuda');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (26, 'BTN', 'Bhutan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (27, 'BOL', 'Bolivia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (28, 'BIH', 'Bosnia and Herzegovina');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (29, 'BWA', 'Botswana');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (30, 'BVT', 'Bouvet Island');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (31, 'BRA', 'Brazil');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (32, 'IOT', 'British Indian Ocean Territory');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (33, 'BRN', 'Brunei Darussalam');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (34, 'BGR', 'Bulgaria');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (35, 'BFA', 'Burkina Faso');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (36, 'BDI', 'Burundi');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (37, 'KHM', 'Cambodia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (38, 'CMR', 'Cameroon');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (39, 'CAN', 'Canada');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (40, 'CPV', 'Cape Verde');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (41, 'CYM', 'Cayman Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (42, 'CAF', 'Central African Republic');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (43, 'TCD', 'Chad (T''Chad)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (44, 'CHL', 'Chile');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (45, 'CHN', 'China');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (46, 'CXR', 'Christmas Island');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (47, 'CCK', 'Cocos (Keeling) Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (48, 'COL', 'Colombia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (49, 'COM', 'Comoros');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (50, 'COG', 'Congo, Republic Of');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (51, 'COD', 'Congo, The Democratic Republic of the (formerly Zaire)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (52, 'COK', 'Cook Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (53, 'CRI', 'Costa Rica');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (54, 'CIV', 'CÔte D''Ivoire (Ivory Coast)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (55, 'HRV', 'Croatia (hrvatska)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (56, 'CUB', 'Cuba');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (57, 'CYP', 'Cyprus');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (58, 'CZE', 'Czech Republic');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (59, 'DNK', 'Denmark');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (60, 'DJI', 'Djibouti');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (61, 'DMA', 'Dominica');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (62, 'DOM', 'Dominican Republic');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (63, 'ECU', 'Ecuador');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (64, 'EGY', 'Egypt');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (65, 'SLV', 'El Salvador');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (66, 'GNQ', 'Equatorial Guinea');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (67, 'ERI', 'Eritrea');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (68, 'EST', 'Estonia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (69, 'ETH', 'Ethiopia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (70, 'FRO', 'Faeroe Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (71, 'FLK', 'Falkland Islands (Malvinas)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (72, 'FJI', 'Fiji');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (73, 'FIN', 'Finland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (74, 'FRA', 'France');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (75, 'GUF', 'French Guiana');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (76, 'PYF', 'French Polynesia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (77, 'ATF', 'French Southern Territories');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (78, 'GAB', 'Gabon');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (79, 'GMB', 'Gambia, The');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (80, 'GEO', 'Georgia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (81, 'DEU', 'Germany (Deutschland)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (82, 'GHA', 'Ghana');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (83, 'GIB', 'Gibraltar');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (84, 'GBR', 'Great Britain');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (85, 'GRC', 'Greece');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (86, 'GRL', 'Greenland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (87, 'GRD', 'Grenada');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (88, 'GLP', 'Guadeloupe');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (89, 'GUM', 'Guam');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (90, 'GTM', 'Guatemala');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (91, 'GIN', 'Guinea');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (92, 'GNB', 'Guinea-bissau');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (93, 'GUY', 'Guyana');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (94, 'HTI', 'Haiti');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (95, 'HMD', 'Heard Island and Mcdonald Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (96, 'HND', 'Honduras');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (97, 'HKG', 'Hong Kong (Special Administrative Region of China)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (98, 'HUN', 'Hungary');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (99, 'ISL', 'Iceland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (100, 'IND', 'India');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (101, 'IDN', 'Indonesia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (102, 'IRN', 'Iran (Islamic Republic of Iran)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (103, 'IRQ', 'Iraq');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (104, 'IRL', 'Ireland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (105, 'ISR', 'Israel');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (106, 'ITA', 'Italy');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (107, 'JAM', 'Jamaica');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (108, 'JPN', 'Japan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (109, 'JOR', 'Jordan (Hashemite Kingdom of Jordan)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (110, 'KAZ', 'Kazakhstan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (111, 'KEN', 'Kenya');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (112, 'KIR', 'Kiribati');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (113, 'PRK', 'Korea (Democratic Peoples Republic pf [North] Korea)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (114, 'KOR', 'Korea (Republic of [South] Korea)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (115, 'KWT', 'Kuwait');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (116, 'KGZ', 'Kyrgyzstan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (117, 'LAO', 'Lao People''s Democratic Republic');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (118, 'LVA', 'Latvia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (119, 'LBN', 'Lebanon');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (120, 'LSO', 'Lesotho');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (121, 'LBR', 'Liberia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (122, 'LBY', 'Libya (Libyan Arab Jamahirya)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (123, 'LIE', 'Liechtenstein (Fürstentum Liechtenstein)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (124, 'LTU', 'Lithuania');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (125, 'LUX', 'Luxembourg');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (126, 'MAC', 'Macao (Special Administrative Region of China)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (127, 'MKD', 'Macedonia (Former Yugoslav Republic of Macedonia)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (128, 'MDG', 'Madagascar');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (129, 'MWI', 'Malawi');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (130, 'MYS', 'Malaysia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (131, 'MDV', 'Maldives');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (132, 'MLI', 'Mali');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (133, 'MLT', 'Malta');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (134, 'MHL', 'Marshall Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (135, 'MTQ', 'Martinique');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (136, 'MRT', 'Mauritania');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (137, 'MUS', 'Mauritius');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (138, 'MYT', 'Mayotte');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (139, 'MEX', 'Mexico');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (140, 'FSM', 'Micronesia (Federated States of Micronesia)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (141, 'MDA', 'Moldova');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (142, 'MCO', 'Monaco');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (143, 'MNG', 'Mongolia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (144, 'MSR', 'Montserrat');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (145, 'MAR', 'Morocco');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (146, 'MOZ', 'Mozambique (Moçambique)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (147, 'MMR', 'Myanmar (formerly Burma)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (148, 'NAM', 'Namibia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (149, 'NRU', 'Nauru');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (150, 'NPL', 'Nepal');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (151, 'NLD', 'Netherlands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (152, 'ANT', 'Netherlands Antilles');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (153, 'NCL', 'New Caledonia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (154, 'NZL', 'New Zealand');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (155, 'NIC', 'Nicaragua');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (156, 'NER', 'Niger');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (157, 'NGA', 'Nigeria');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (158, 'NIU', 'Niue');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (159, 'NFK', 'Norfolk Island');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (160, 'MNP', 'Northern Mariana Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (161, 'NOR', 'Norway');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (162, 'OMN', 'Oman');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (163, 'PAK', 'Pakistan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (164, 'PLW', 'Palau');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (165, 'PSE', 'Palestinian Territories');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (166, 'PAN', 'Panama');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (167, 'PNG', 'Papua New Guinea');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (168, 'PRY', 'Paraguay');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (169, 'PER', 'Peru');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (170, 'PHL', 'Philippines');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (171, 'PCN', 'Pitcairn');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (172, 'POL', 'Poland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (173, 'PRT', 'Portugal');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (174, 'PRI', 'Puerto Rico');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (175, 'QAT', 'Qatar');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (176, 'REU', 'RÉunion');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (177, 'ROU', 'Romania');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (178, 'RUS', 'Russian Federation');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (179, 'RWA', 'Rwanda');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (180, 'SHN', 'Saint Helena');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (181, 'KNA', 'Saint Kitts and Nevis');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (182, 'LCA', 'Saint Lucia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (183, 'SPM', 'Saint Pierre and Miquelon');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (184, 'VCT', 'Saint Vincent and the Grenadines');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (185, 'WSM', 'Samoa (formerly Western Samoa)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (186, 'SMR', 'San Marino (Republic of)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (187, 'STP', 'Sao Tome and Principe');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (188, 'SAU', 'Saudi Arabia (Kingdom of Saudi Arabia)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (189, 'SEN', 'Senegal');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (190, 'SCG', 'Serbia and Montenegro (formerly Yugoslavia)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (191, 'SYC', 'Seychelles');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (192, 'SLE', 'Sierra Leone');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (193, 'SGP', 'Singapore');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (194, 'SVK', 'Slovakia (Slovak Republic)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (195, 'SVN', 'Slovenia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (196, 'SLB', 'Solomon Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (197, 'SOM', 'Somalia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (198, 'ZAF', 'South Africa (zuid Afrika)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (199, 'SGS', 'South Georgia and the South Sandwich Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (200, 'ESP', 'Spain (españa)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (201, 'LKA', 'Sri Lanka');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (202, 'SDN', 'Sudan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (203, 'SUR', 'Suriname');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (204, 'SJM', 'Svalbard and Jan Mayen');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (205, 'SWZ', 'Swaziland');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (206, 'SWE', 'Sweden');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (207, 'CHE', 'Switzerland (Confederation of Helvetia)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (208, 'SYR', 'Syrian Arab Republic');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (209, 'TWN', 'Taiwan ("Chinese Taipei" for IOC)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (210, 'TJK', 'Tajikistan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (211, 'TZA', 'Tanzania');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (212, 'THA', 'Thailand');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (213, 'TLS', 'Timor-Leste (formerly East Timor)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (214, 'TGO', 'Togo');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (215, 'TKL', 'Tokelau');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (216, 'TON', 'Tonga');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (217, 'TTO', 'Trinidad and Tobago');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (218, 'TUN', 'Tunisia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (219, 'TUR', 'Turkey');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (220, 'TKM', 'Turkmenistan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (221, 'TCA', 'Turks and Caicos Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (222, 'TUV', 'Tuvalu');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (223, 'UGA', 'Uganda');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (224, 'UKR', 'Ukraine');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (225, 'ARE', 'United Arab Emirates');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (226, 'GBR', 'United Kingdom (Great Britain)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (227, 'USA', 'United States');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (228, 'UMI', 'United States Minor Outlying Islands');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (229, 'URY', 'Uruguay');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (230, 'UZB', 'Uzbekistan');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (231, 'VUT', 'Vanuatu');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (232, 'VAT', 'Vatican City (Holy See)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (233, 'VEN', 'Venezuela');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (234, 'VNM', 'Viet Nam');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (235, 'VGB', 'Virgin Islands, British');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (236, 'VIR', 'Virgin Islands, U.S.');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (237, 'WLF', 'Wallis and Futuna');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (238, 'ESH', 'Western Sahara (formerly Spanish Sahara)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (239, 'YEM', 'Yemen (Arab Republic)');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (240, 'ZMB', 'Zambia');
INSERT INTO tbl_country(id, iso3, name_en) VALUES (241, 'ZWE', 'Zimbabwe');
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (1, 'Francis', 'Ford', 'Coppola', to_date('04/07/1939', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (2, 'Bernardo', '', 'Bertolucci', to_date('03/16/1940', 'MM/DD/YYYY'), '', 106);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (3, 'Milos', '', 'Forman', to_date('02/08/1932', 'MM/DD/YYYY'), '', 58);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (4, 'Roman', '', 'Polanski', to_date('08/18/1933', 'MM/DD/YYYY'), '', 74);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (5, 'Stanley', '', 'Kubrick', to_date('07/26/1928', 'MM/DD/YYYY'), to_date('03/07/1999', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (6, 'George', '', 'Lucas', to_date('05/14/1944', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (7, 'Stephen', 'Allan', 'Spielberg', to_date('12/18/1946', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (8, 'Martin', 'Charles', 'Scorcese', to_date('11/17/1942', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (9, 'Michael', '', 'Cimino', to_date('02/03/1939', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (10, 'Francois', 'Roland', 'Truffaut', to_date('02/06/1932', 'MM/DD/YYYY'), to_date('10/21/1984', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (11, 'Ingmar', '', 'Bergman', to_date('07/14/1918', 'MM/DD/YYYY'), to_date('07/30/2007', 'MM/DD/YYYY'), 206);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (12, 'Franco', '', 'Brusati', to_date('08/04/1922', 'MM/DD/YYYY'), to_date('02/28/1993', 'MM/DD/YYYY'), 106);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (13, 'Vittorio', '', 'De Sica', to_date('07/07/1901', 'MM/DD/YYYY'), to_date('11/13/1974', 'MM/DD/YYYY'), 106);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (14, 'Luis', '', ' Buñuel', to_date('02/22/1900', 'MM/DD/YYYY'), to_date('07/29/1983', 'MM/DD/YYYY'), 200);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (15, 'Paul', '', 'Verhoeven', to_date('07/18/1938', 'MM/DD/YYYY'), '', 151);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (16, 'Andrei', '', 'Tarkovsky', to_date('04/04/1932', 'MM/DD/YYYY'), to_date('12/29/1986', 'MM/DD/YYYY'), 178);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (17, 'Akira', '', 'Kurosawa', to_date('03/23/1910', 'MM/DD/YYYY'), to_date('09/06/1998', 'MM/DD/YYYY'), 108);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (18, 'Robert', '', 'Clouse', to_date('03/06/1928', 'MM/DD/YYYY'), to_date('02/04/1997', 'MM/DD/YYYY'), 227);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (1, 1);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (1, 3);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (1, 5);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (2, 2);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (3, 4);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (4, 11);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (5, 6);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (6, 7);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (7, 8);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (8, 9);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (9, 10);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (10, 12);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (11, 13);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (12, 14);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (13, 15);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (14, 16);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (15, 17);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (16, 18);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (17, 19);
INSERT INTO tbl_directormovie(director_id, movie_id) VALUES (18, 20);
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (1, 'Action');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (8, 'Adventure');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (15, 'Animation');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (21, 'Biography');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (2, 'Comedy');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (9, 'Crime');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (16, 'Documentary');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (22, 'Drama');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (3, 'Family');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (10, 'Fantasy');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (17, 'Film-Noir');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (23, 'Game-Show');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (4, 'History');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (11, 'Horror');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (18, 'Music');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (24, 'Musical');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (5, 'Mystery');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (12, 'News');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (19, 'Reality-TV');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (25, 'Romance');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (6, 'Sci-Fi');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (13, 'Sport');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (20, 'Talk-Show');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (26, 'Thriller');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (7, 'War');
INSERT INTO tbl_genre(genre_id, genre_title) VALUES (14, 'Western');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (1, 'eng', 'English');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (2, 'fre', 'French');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (3, 'ger', 'German');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (4, 'rus', 'Russian');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (5, 'chi', 'Chinese');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (6, 'esp', 'Spanish');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (7, 'ita', 'Italian');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (8, 'jpn', 'Japanese');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (9, 'swe', 'Swedish');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (10, 'por', 'Portuguese');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (11, 'vie', 'Vietnamese');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (12, 'khm', 'Central Khmer');
INSERT INTO tbl_language(id, iso3, language_en) VALUES (13, 'dut', 'Dutch');
INSERT INTO tbl_lucolor(id, color_format) VALUES (1, 'Black And White');
INSERT INTO tbl_lucolor(id, color_format) VALUES (2, 'Color/Black And White');
INSERT INTO tbl_lucolor(id, color_format) VALUES (3, 'Color');
INSERT INTO tbl_lusound(id, sound_format) VALUES (1, 'Silent');
INSERT INTO tbl_lusound(id, sound_format) VALUES (2, 'Spoken');
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (1, 'The Godfather', null, 1972, 178, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 3, 2, 100, 9.20);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (2, 'The Conformist', 'Conformista', 1970, 111, 'A weak-willed Italian man becomes a fascist flunky who goes abroad to arrange the assassination of his old teacher, now a political dissident.', 3, 2, 100, 8.00);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (3, 'The Godfather Part 2', null, 1974, 200, 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.', 3, 2, 98, 9.10);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (4, 'One Flew Over The Cuckoo''s Nest', null, 1975, 133, 'Upon arriving at a mental institution, a brash rebel rallies the patients to take on the oppressive Nurse Ratched, a woman more dictator than nurse.', 3, 2, 96, 8.80);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (5, 'Apocalypse Now', null, 1979, 153, 'During the U.S. Vietnam War, Captain Willard is sent on a dangerous mission into Cambodia to assassinate a renegade colonel who has set himself up as a god among a local tribe.', 3, 2, 99, 8.60);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (6, 'A Clockwork Orange', null, 1974, 136, 'In future Britain, charismatic delinquent Alex DeLarge is jailed and volunteers for an experimental aversion therapy developed by the government in an effort to solve society''s crime problem... but not all goes to plan.', 3, 2, 89, 8.50);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (7, 'Star Wars - Episode IV - A New Hope', null, 1977, 125, 'Luke Skywalker, a spirited farm boy, joins rebel forces to save Princess Leia from the evil Darth Vader, and the galaxy from the Empire''s planet-destroying Death Star.', 3, 2, 93, 8.80);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (8, 'Jaws', null, 1975, 124, 'When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and grizzled fisherman set out to stop it.', 3, 2, 100, 8.20);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (9, 'Taxi Driver', null, 1976, 113, 'A mentally unstable Vietnam war veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge to violently lash out, attempting to save a teenage prostitute in the process.', 3, 2, 98, 8.50);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (10, 'The Deer Hunter', null, 1978, 182, 'An in-depth examination of the way that the Vietnam war affects the lives of people in a small industrial town in the USA.', 3, 2, 92, 8.20);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (11, 'Chinatown', null, 1974, 130, 'A private detective investigating an adultery case stumbles on to a scheme of murder that has something to do with water.', 3, 2, 98, 8.40);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (12, 'Day For Night', 'La Nuit Americane', 1973, 115, 'A committed film director struggles to complete his movie while coping with a myriad of crises, personal and professional, among the cast and crew.', 3, 2, 100, 8.00);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (13, 'Cries and Whispers', 'Viskningar och rop', 1972, 91, 'When a woman dying of cancer in turn-of-the century Sweden is visited by her two sisters, long repressed feelings between the siblings rise to the surface.', 3, 2, 89, 8.00);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (14, 'Bread and Chocolate', 'Pane e cioccolata', 1974, 111, 'Italian immigrant tries to become a member of Swiss society but fails as a waiter and even as a chicken plucker. He then becomes involved with shady wealthy character and tries to hide his Italian identity. He refuses to give up no matter how awful his situation.', 3, 2, 72, 7.20);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (15, 'The Garden Of Finzi-Continis', 'Il giardano de Finzi-Continis', 1971, 94, 'In the late 1930s, in Ferrara, Italy, the Finzi-Contini are one of the leading families, wealthy, aristocratic, urbane; they are also Jewish. Their adult children, Micol and Alberto, gather a circle of friends for constant rounds of tennis and parties at their villa with its lovely grounds, keeping the rest of the world at bay. Into the circle steps Giorgio, a Jew from the middle class who falls in love with Micol. She seems to toy with him, and even makes love to one of his friends while she knows Giorgio is watching. While his love cannot seem to break through to her to draw her out of her garden idyll, the forces of politics close in.', 3, 2, 100, 7.40);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (16, 'The Discreet Charm of the Bourgeoisie ', 'Le Charme Discrete de la Bourgeoise', 1972, 102, 'A surreal, virtually plotless series of dreams centered around six middle-class people and their consistently interrupted attempts to have a meal together.', 3, 2, 98, 7.90);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (17, 'Turkish Delight', 'Turks Fruit', 1973, 112, 'Sort of a cross between "Love Story" and an earthy Rembrandt painting, this movie stars Rutger Hauer as a gifted Dutch sculptor who has a stormy, erotic, and star-crossed romance with a beautiful young girl. The story follows the arc of their relationship and his interaction with her family.', 3, 2, 78, 7.10);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (18, 'Stalker', '', 1979, 163, 'A guide leads two men through an area known as the Zone to find a room that grants wishes.', 2, 2, 100, 8.10);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (19, 'Dersu Uzala', '', 1975, 141, 'The Russian army sends an explorer on an expedition to the snowy Siberian wilderness where he makes friends with a seasoned local hunter.', 3, 2, 75, 8.20);
INSERT INTO tbl_movie(id, title_en, title_alt, year, runtime, plot, color, silent, rating_rt, rating_imdb) VALUES (20, 'Enter The Dragon', null, 1973, 98, 'A martial artist agrees to spy on a reclusive crime lord using his invitation to a tournament there as cover.', 3, 2, 95, 7.60);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (1, 106);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (1, 227);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (2, 106);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (3, 106);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (3, 227);
INSERT INTO tbl_moviecountry(movie_id, country_id) VALUES (4, 227);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (1, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (1, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (2, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (3, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (3, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (4, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (5, 7);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (5, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (6, 6);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (6, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (6, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (7, 1);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (7, 8);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (7, 10);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (8, 8);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (8, 11);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (8, 26);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (9, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (9, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (10, 7);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (10, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (11, 5);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (11, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (11, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (12, 2);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (12, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (12, 25);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (13, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (13, 25);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (14, 2);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (14, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (15, 4);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (15, 7);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (15, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (16, 2);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (16, 10);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (16, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (17, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (17, 25);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (18, 8);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (18, 10);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (18, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (19, 8);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (19, 21);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (19, 22);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (20, 1);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (20, 9);
INSERT INTO tbl_moviegenre(movie_id, genre_id) VALUES (20, 22);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (1, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (1, 7);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (2, 7);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (3, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (3, 7);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (4, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (5, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (5, 2);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (5, 11);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (5, 12);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (6, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (7, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (8, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (9, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (9, 6);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (10, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (10, 2);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (10, 4);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (10, 11);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (11, 1);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (12, 2);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (13, 9);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (14, 7);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (15, 3);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (15, 7);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (16, 2);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (16, 6);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (17, 13);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (18, 4);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (19, 4);
INSERT INTO tbl_movielanguage(movie_id, language_id) VALUES (20, 1);


INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000001, 'Frank', 'James', 'Paulson', 'moviebuff', 'frank@muppet.com', to_date('09/15/1982', 'MM/DD/YYYY'), 106);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000002, 'Arnold', 'Michael', 'Leary', 'filmlover', 'arnie@hotmail.com', to_date('03/11/1991', 'MM/DD/YYYY'), 100);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000003, 'Howard', 'Peter', 'Michelson', 'moviemunnki', 'howie@apple.com', to_date('09/07/1971', 'MM/DD/YYYY'), 57);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000004, 'Sarah', 'Michelle', 'Heinrich', 'filmcritic', 'smh@gmail.com', to_date('01/05/1967', 'MM/DD/YYYY'), 170);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000005, 'Karl', 'Leftchard', 'Marks', 'KMarks', 'kmarx@lefties.com', to_date('11/29/1976', 'MM/DD/YYYY'), 180);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000006, 'Federica', 'Giaccomo', 'Martino', 'FedeFilm', 'fede@mitalia.com', to_date('05/21/1979', 'MM/DD/YYYY'), 111);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000007, 'Zele', 'Manimbo', 'Matutu', 'ZeleMat', 'zele@mabimba.com', to_date('05/21/1981', 'MM/DD/YYYY'), 67);
INSERT INTO tbl_user(id, fname, mname, lname, username, email_address, dateofbirth, birthcountry) VALUES (000008, 'Xinxin', 'Xiaolu', 'Lee', 'HaHamov', 'xi@baidu.com', to_date('04/16/1972', 'MM/DD/YYYY'), 79);

INSERT INTO tbl_password (password_hash, user_id) VALUES ('A45TH234H', 000001);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('b35yJ99BA', 000002);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('TT89234h9', 000003);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('23434Hh78', 000004);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('234iJ3434', 000005);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('b35y5699B', 000006);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('19345345g', 000007);
INSERT INTO tbl_password (password_hash, user_id) VALUES ('jJi345FF9', 000008); 


INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (100, 000001, 'The Greatest Movie', 'The Godfather is, and remains, the benchmark by which all other movies will be judged. Perfectly scored and conceived, it represented both the perfection of the original gangster genre and at the same time allowed for the conception of a whole new set of possibilities within that genre. What seems like an all-star ensemble now in fact featured many new arrivals to the scene, in particular Pacino who established himself as a talent to be reckoned with. Viewing this film is an experience which constantly rewards the watcher and allows them to engage with an important artefact of the history of film.', to_date('04/27/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (101, 000002, 'Masterpiece of form', 'What is most amazing about The Conformist is its cinematography and angles. Director Bertolucci and Cinematographer Storraro have created a masterpiece of form by using light, camera angles, and character positioning. The architecture dwarfs the characters as they try to make sense of their existence during Italys fascist period (1930s). They are placed theatrically at times creating a balance of space. The Conformist is the most stunning film visually I have ever seen. Every scene is immaculate, kind of surreal, almost to rich for the senses to take in one viewing.The story is somewhat difficult on the first viewing but one can figure the basic plot line. It is a story about repression and oppression, about nationality, political beliefs during a paradigm shift. It is about acceptance and avoidance. It is about playing it safe in a time of tension. The final scene suggests what the main character might have become had he chose the truth. It is left up to us to judge him and realize that it is sort of a catch 22; either way, he would have ended up in that dark place where a fascist country would mentally place same sex love. See this film to see the potential of the beauty of film.Conform or not to Conform? That is the Question.', to_date('04/26/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (102, 000003, 'The nature of madness', 'What sadness this film makes us feel as the overly high-spirted central character finds fate in his rebellion. Nurse Ratchet becomes a character never to be forgotten – a stern virginal schoolteacher whose assertion of power leads to the stripping of the humanity of the protagonist brilliantly sketched by Nicholson. Perfectly cast, he evokes perfectly the human spirt of restless and undirected rebellion – imperfect and irrational – dirty and unadorned – a movie which brings us back to our youth and our memories of indulging our deepest feelings – a classic', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (103, 000004, 'Conrad Realized', 'A dark filming process and an exceptionally dark film. Conrads post-colonial novel transformed perfectly for the screen. The problems in filming are famous – spawning an excellent documentary – Hearts of Darkness – in its own right. Brando brings a gravitas to a role he owns completely. Coppola opens up his own realms of darkness... and it is all captured by the cameras. Wonderful. Awesome. Dark. Unendingly dark.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (104, 000005, 'Alienation', 'Stanely Kubricks A Clockwork Orange is one of the first movies that proved that cinema can be the most enlightening and amazing art form around. Movies have always been a true love for me, but it wasnt until this film challenged me that I fell deeply in love. The first viewing left me speechless, unable to describe how weird and terrible I felt. I thought it was the film that left me in this mood, so of course that was the easy target to blame. It was just a bad movie, overrated and stupid and a waste of time. But upon further thought, I realised the film did exactly what it was supposed to. It showed how the world can be a weird and horrible place, and how this young man who goes around torturing people and being a wicked person ultimately doesnt have to pay for what he does. And its funny too. So this film brilliantly satirises this world, showcasing pure evil and people who ordinarily do not perform such evil are forced to laugh and observe what we all hate to admit is the truth. Its sick, but at the same time brilliant. And when one gets down to the core, you cant really explain it. It just is what it is. Its real. No one really sees it very often, but it is out there and everyone knows. And no one does anything about it. In essence, A Clockwork Orange is the ultimate satire, and one of the ultimate film experiences. Its art, its life, and in a funky way, its entertaining.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (105, 000006, 'A New Hope', 'I can never pick a favorite movie because different movies have different effects. Goodfellas is my favorite drama. Face/Off is my favorite actioner. But when it comes to pure amazement, nothing beats Star Wars. We are introduced to a whole other universe with different creatures, different lifestyles, and different history. We are dropped in the middle of an intergalactic war between an empire and a rebellion that has raged for years and left the universe in ruin. It was the most fascinating thing to see when i was eleven, but to this day i am still a Star Wars nerd.
The cast of characters includes some of the coolest, funniest, and most tragic in film, and the actors who play them fit seamlessly into this new universe. Alec Guiness is flawless as Obi-Wan Kenobi, a Jedi on the run from the evil Empire. Harrison Ford is awesome as Han Solo, a smuggler and thief who helps the gang rescue the princess. But my favorite character of all time is Darth Vader. Not only is he the coolest bad guy, but we learn in later films why he is evil and start to feel sympathetic for him. Not to mention that badass booming voice that can make ordering a pizza sound threatening. This was not only the beginning of the best movie series ever, but it was the beginning of my love for movies. George Lucas is a genius for being able to come up with a great story and an incredible backdrop for what was supposed to be a flop, but turned into one of the best films ever.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (106, 000007, 'Horror in the water', 'Jaws is the movie I grew up with, its like the first real horror film I ever watched. What a great one to start with, right? This movie not only scared me out of the water, I was afraid to go to the bathroom! I thought Jaws was going to pop up out of the toilet and bite my butt! I know it was silly, but that was how much Jaws effected me. I know also that it has not lost its effect to this day. Im questioning, because it seems like all the terrific horror films came out of the 70s. Jaws is based on the best seller book by Peter Benchley. Steven Spielberg, before he was STEVEN Spielberg turned this horrifying book and made it into a reason to hate sharks. He brilliantly took what could have been a cheesy movie and turned it into a classic that will never be forgotten. To this day, I still need a friend to hold onto, its that score! Duh na... duh na.... dun dun dun dun.... Oh, my gosh, that music just scares the heck out of me! On such a low budget, Jaws not only turned into one of the greatest horror movies of all time, it turned into one of the greatest movies, period.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (107, 000008, 'Alienation', 'The script of Taxi Driver is built like a diary, the diary of a very ordinary guy who gets hired as a night taxi driver back from Vietnam, because he cant sleep at night. A very ordinary guy who tries to break his isolation, but cant, while violence accumulates inside him. One of those unnoticed people with dark things on their mind, one of those who break up the news one day with some extraordinary outburst of rage, to fall back immediately into anonymity. The gradual transformation of man into beast in this movie is chilling. Its still funny and pathetic when the hero threatens himself in front of the mirror (you talking to me), but when he comes out with a mohawk hairdo and dark glasses, it is obvious that nasty stuff is going to take place. As in A Clockwork Orange, violence is recuperated by society depending on what purpose it is used for. Whereas he was about to murder the candidate for presidency, gods lonely man fails and instead kills a vicious pimp who exploits teenage prostitutes. The potential criminal becomes a hero for a day.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (108, 000009 'The Horror of War', 'I cannot fathom the absolute horror that war brings to a persons life, but never has a film depicted it more harrowingly than The Deerhunter. At 182 minutes, it seemed to fly by, leaving me wanting more and wishing this would not end. all facets are explored, all peoples emotions are laid bare, not just the combatants. If we obviously did not know better, one would have to say this was a British film, as it has all the best elements that British movie making displays. i can eulogise for hundreds of lines, but this really is the ONLY American movie i can think of (others? apart from taxi driver) that is RAW. A strange word i know but the movie oozes a raw edge to it. Immense performances from all concerned, and if i had to say, i believe i have not seen Christopher Walken in a better role. One of the very few films i deservedly give 10/10. A must for any collection and a stunning example of every aspect of film making coming together, albeit for a sombre depiction of life.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (1,100);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (2,101);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (3,102);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (4,103);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (5,104);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (6,105);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (7,106);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (8,107);
INSERT INTO tbl_moviereview (movie_id, review_id) VALUES (9, 108);








INSERT INTO tbl_series (id, title_en, title_alt, startyear, endyear, plot, episode_length, country, color, silent, rating_rt, rating_imdb) VALUES (01, 'The Vampires', 'Les Vampires', 1915, 1916, 'Les Vampires is a 1915-1916 silent crime serial film written and directed by Louis Feuillade. Set in Paris, it stars Edouard Mathe, Musidora and Marcel Levesque and follows a journalist and his friend who become involved in trying to uncover and stop a bizarre underground Apache gang.', 40, 74, 1, 1, 100, 7.1);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (01, 'The Severed Head', 01, 01);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (02, 'The Ring That Kills', 01, 02);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (03, 'The Red Codebook', 01, 03);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (04, 'The Spectre', 01, 04);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (05, 'Dead Mans Escape', 01, 05);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (06, 'Hypnotic Eyes', 01, 06);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (07, 'Satanas', 01, 07);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (08, 'The Thunder Master', 01, 08);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (09, 'The Poisoner', 01, 09);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (10, 'The Terrible Wedding', 01, 10);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 01); 
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 02);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 03);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 04);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 05);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 06);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 07);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 08);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 09);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (20, 10);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 01);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 02);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 03);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 04);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 05);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 06);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 07);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 08);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 09);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (01, 10);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (01, 9);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (01, 22);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (20, 'Louis', '', 'Feuillade', to_date('02/19/1873', 'MM/DD/YYYY'), to_date('02/25/1925', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (50, 'Edouard', '', 'Mathe', to_date('01/07/1886', 'MM/DD/YYYY'), to_date('02/25/1934', 'MM/DD/YYYY'), 14);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (51, 'Jeanne', 'Musidora', 'Roques', to_date('02/19/1889', 'MM/DD/YYYY'), to_date('02/11/1957', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (52, 'Marcel', '', 'Levesque', to_date('02/19/1877', 'MM/DD/YYYY'), to_date('02/25/1962', 'MM/DD/YYYY'), 74);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (50, 01);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (51, 01);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (52, 01);


INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (109, 000003 'The Original Series', 'Feuillade managed to create a cliffhanger in each episode and brought people flocking in. Imagine this series played out in an old cinema hall, the newness of the technology, a piano clinking behind in the background - the sighs of the audience. So old and yet, so new.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_seriesreview (series_id, review_id) VALUES (01, 109);	

INSERT INTO tbl_series (id, title_en, title_alt, startyear, endyear, plot, episode_length, country, color, silent, rating_rt, rating_imdb) VALUES (02, 'The Kingdom', 'Riget', 1994, 1997, 'The series is set in the neurosurgical ward of Copenhagens Rigshospitalet, the city and countrys main hospital, nicknamed "Riget". "Riget" means "the realm" or "the kingdom" and leads one to think of "dodsriget", the realm of the dead.', 72, 59, 3, 3, 91, 8.4);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (11, 'The Unheavenly Host', 01, 01);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (12, 'Thy Kingdom Come', 01, 02);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (13, 'A Foreign Body', 01, 03);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (14, 'The Living Dead', 01, 04);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (15, 'Death On The Operation', 02, 01);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (16, 'Birds of Passage', 02, 02);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (17, 'Gargantua', 02, 03);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (18, 'Pandaemonium', 02, 04);
 
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 11); 
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 12);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 13);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 14);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 15);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 16);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 17);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (21, 18);

INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 11);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 12);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 13);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 14);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 15);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 16);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 17);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (02, 18);

INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (02, 2);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (02, 22);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (02, 10);

INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (21, 'Lars', '', 'von Trier', to_date('04/30/1956', 'MM/DD/YYYY'), '', 59);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (53, 'Ernst-Hugo', 'Alfred', 'Jaregard', to_date('12/12/1928', 'MM/DD/YYYY'), to_date('09/06/1998', 'MM/DD/YYYY'), 208);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (54, 'Kirsten', '', 'Rolffes', to_date('09/20/1928', 'MM/DD/YYYY'), to_date('04/10/2000', 'MM/DD/YYYY'), 59);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (55, 'Holger', 'Juul', 'Hansen', to_date('08/14/1924', 'MM/DD/YYYY'), to_date('03/19/2013', 'MM/DD/YYYY'), 59);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (53, 02);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (54, 02);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (55, 02);


INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (110, 000005, 'By deliberately blurring the distinction between highbrow and trash movies, the director mocks his own inclinations toward a Wellesian grandiosity. The strategy allows him to flaunt a liberated cinematic imagination with nose-thumbing glee.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_seriesreview (series_id, review_id) VALUES (02, 110);

INSERT INTO tbl_series (id, title_en, title_alt, startyear, endyear, plot, episode_length, country, color, silent, rating_rt, rating_imdb) VALUES (03, 'The Sopranos', '', 1999, 2007, 'The series revolves around the New Jersey-based Italian-American mobster Tony Soprano (James Gandolfini) and the difficulties he faces as he tries to balance the conflicting requirements of his home life and the criminal organization he heads.', 50, 59, 3, 3, 100, 9.2);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (19, 'The Sopranos', 01, 01);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (20, '46 Long', 01, 02);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (21, 'Denial - Anger - Acceptance', 01, 03);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (22, 'Meadowlands', 01, 04);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (23, 'College', 01, 05);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (24, 'Pax Soprana', 01, 06);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (25, 'Down Neck', 01, 07);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (26, 'The Legend of Tennessee Moltisanti', 01, 08);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (27, 'Boca', 01, 09);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (28, 'A Hit Is a Hit', 01, 10);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (29, 'Nobody Knows Anything', 01, 11);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (30, 'Isabella', 01, 12); 
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (31, 'I Dream of Jeannie Cusamano', 01, 13);

INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (22, 19); 
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (23, 20);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (24, 21);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (22, 22);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (23, 23);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (24, 24);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (22, 25);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (23, 26);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (24, 27);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (22, 28);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (23, 29);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (24, 30);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (22, 31);

INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 19);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 20);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 21);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 22);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 23);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 24);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 25);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 26);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 27);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 28);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 29);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 30);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (03, 31);

INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (03, 9);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (03, 22);


INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (22, 'David', '', 'Chase', to_date('08/22/1945', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (23, 'Daniel', '', 'Attias', to_date('12/04/1951', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (24, 'Nick', '', 'Gomez', to_date('04/13/1963', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (56, 'James', 'Joseph', 'Gandolfini', to_date('09/18/1961', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (57, 'Edith', '', 'Falco', to_date('07/05/1963', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (58, 'James', 'Michael', 'Imperioli', to_date('03/26/1966', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (56, 03);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (57, 03);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (58, 03);


INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (111, 000002, 'There have been many classic works of entertainment from Star Wars to Christopher Nolans stunning The Dark Knight. Each one bends the viewers mind and breaks the viewers heart. However, no work of entertainment or fiction has ever done what The Sopranos has. The TV Show truly is art mimicking life, and it leaves the viewer stunned. Beyond the amazing acting, directing, and characters stands a story that is truly epic as it follows a mafioso trying to do good, but failing miserably. ', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_seriesreview (series_id, review_id) VALUES (03, 111);


INSERT INTO tbl_series (id, title_en, title_alt, startyear, endyear, plot, episode_length, country, color, silent, rating_rt, rating_imdb) VALUES (04, 'Love/Hate', '', 2010, 2013, 'The show depicts fictional characters in Dublins criminal underworld, John Boy Power played by Aidan Gillen and Darren Treacy played by Robert Sheehan', 50, 104, 3, 3, 74, 7.7);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (32, 'Episode 1', 01, 01);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (33, 'Episode 2', 01, 02);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (34, 'Episode 3', 01, 03);
INSERT INTO tbl_episode (id, episode_title, season, episode_no) VALUES (35, 'Episode 4', 01, 04);


INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (25, 32); 
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (25, 33);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (25, 34);
INSERT INTO tbl_directorepisode (director_id, episode_id) VALUES (25, 35);

INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (04, 32);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (04, 33);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (04, 34);
INSERT INTO TABLE tbl_episodeseries (series_id, episode_id) VALUES (04, 35);

INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (04, 9);
INSERT INTO tbl_seriesgenre (series_id, genre_id) VALUES (04, 22);


INSERT INTO tbl_director(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (25, 'Stuart', '', 'Carolan', to_date('08/22/1969', 'MM/DD/YYYY'), '', 104);

INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (59, 'Aidan', '', 'Gillen', to_date('04/24/1968', 'MM/DD/YYYY'), '', 104);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (60, 'Ruth', '', 'Negga', to_date('07/05/1982', 'MM/DD/YYYY'), '', 69);
INSERT INTO tbl_actor(id, fname, mname, lname, dateofbirth, dateofdeath, birthcountry) VALUES (61, 'Jimmy', '', 'Smallhorne', to_date('03/26/1960', 'MM/DD/YYYY'), '', 227);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (59, 04);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (60, 04);
INSERT INTO tbl_actorseries (actor_id, series_id) VALUES (61, 04);


INSERT INTO tbl_review (id, user_creator, review_title, review_body, creation_date) VALUES (112, 000003, 'This has to be one of the best crime drama serious to come out of RTE in a long time, the acting is superb the drama is edge of the seat and story line never leaves the watcher in any confusion about what is going on its a bit like being part of the story you get so engrossed and the action never leaves you wanting, I would love to see a full length film from the writer Stuart Carolan and i will be looking out for any thing else he may have done.', to_date('04/28/2013', 'MM/DD/YYYY'));

INSERT INTO tbl_seriesreview (series_id, review_id) VALUES (04, 112);

