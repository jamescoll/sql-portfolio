/*1.) Inner Join Queries

A

Explanation

This query lists actors and the movies they have starred in.

Query*/

 SELECT TBL_ACTOR.FNAME AS "First Name", TBL_ACTOR.LNAME AS "Last Name", TBL_MOVIE.TITLE_EN AS "Film" FROM TBL_ACTOR INNER JOIN TBL_ACTORMOVIE ON TBL_ACTOR.ID = TBL_ACTORMOVIE.ACTOR_ID INNER JOIN TBL_MOVIE ON TBL_ACTORMOVIE.MOVIE_ID = TBL_MOVIE.ID ORDER BY TBL_ACTOR.LNAME;


/*B

Explanation

This query lists directors, the movies they have directed and the year the movie was released.

Query*/

SELECT TBL_DIRECTOR.FNAME AS "First Name", TBL_DIRECTOR.LNAME AS "Last Name", TBL_MOVIE.TITLE_EN AS "Film", TBL_MOVIE.YEAR AS "Year" FROM TBL_MOVIE INNER JOIN TBL_DIRECTORMOVIE ON TBL_MOVIE.ID = TBL_DIRECTORMOVIE.MOVIE_ID INNER JOIN TBL_DIRECTOR ON TBL_DIRECTORMOVIE.DIRECTOR_ID = TBL_DIRECTOR.ID ORDER BY TBL_MOVIE.YEAR;


/*C

Explanation

This query lists directors, the movies they have directed, the foreign language name of the movie (if it exists) and the year the movie was released.

Query*/

SELECT TBL_DIRECTOR.FNAME AS "First Name", TBL_DIRECTOR.LNAME AS "Last Name", TBL_MOVIE.TITLE_EN AS "Film", TBL_MOVIE.TITLE_ALT AS "Foreign Title", TBL_MOVIE.YEAR AS "Year" FROM TBL_MOVIE INNER JOIN TBL_DIRECTORMOVIE ON TBL_MOVIE.ID = TBL_DIRECTORMOVIE.MOVIE_ID INNER JOIN TBL_DIRECTOR ON TBL_DIRECTORMOVIE.DIRECTOR_ID = TBL_DIRECTOR.ID ORDER BY TBL_MOVIE.YEAR;



/*D

Explanation

This query lists all the movies in the database made in Italy and when they were released..

Query*/

SELECT TBL_MOVIE.TITLE_EN AS "FILM TITLE", TBL_MOVIE.YEAR AS "YEAR", TBL_COUNTRY.NAME_EN AS "COUNTRY" FROM TBL_MOVIE INNER JOIN TBL_MOVIECOUNTRY ON TBL_MOVIE.ID = TBL_MOVIECOUNTRY.MOVIE_ID INNER JOIN TBL_COUNTRY ON TBL_MOVIECOUNTRY.COUNTRY_ID = TBL_COUNTRY.ID AND TBL_COUNTRY.ID = '106' ORDER BY TBL_MOVIE.YEAR;


/*E

Explanation

This query lists all the series in the database with the starting and finishing year as well as the country in which they were shot.

Query*/

SELECT TBL_SERIES.TITLE_EN AS "SERIES", TBL_SERIES.STARTYEAR AS "FROM", TBL_SERIES.ENDYEAR AS "TO", TBL_COUNTRY.NAME_EN AS "COUNTRY" FROM TBL_SERIES INNER JOIN TBL_COUNTRY ON TBL_SERIES.COUNTRY = TBL_COUNTRY.ID ORDER BY TBL_COUNTRY.NAME_EN;




/*2.) Full Outer Join Queries

A

Explanation

This query lists all the languages available for movies in the database and, where they exist, movies in those languages. It repeats the language name if more than one movie exists in that language.

Query*/

SELECT TBL_LANGUAGE.LANGUAGE_EN AS "LANGUAGE", TBL_MOVIE.TITLE_EN AS "MOVIE" FROM TBL_MOVIE INNER JOIN TBL_MOVIELANGUAGE ON TBL_MOVIE.ID = TBL_MOVIELANGUAGE.MOVIE_ID FULL OUTER JOIN TBL_LANGUAGE ON TBL_MOVIELANGUAGE.LANGUAGE_ID = TBL_LANGUAGE.ID ORDER BY TBL_LANGUAGE.LANGUAGE_EN;



/*B

Explanation

This query lists all the genres available for movies in the database and, where they exist, movies associated with those genres. It repeats the genre name if more than one movie is associated with that genre.

Query*/

SELECT TBL_GENRE.GENRE_TITLE AS "GENRE", TBL_MOVIE.TITLE_EN AS "TITLE" FROM TBL_MOVIE INNER JOIN TBL_MOVIEGENRE ON TBL_MOVIE.ID = TBL_MOVIEGENRE.MOVIE_ID FULL OUTER JOIN TBL_GENRE ON TBL_GENRE.GENRE_ID = TBL_MOVIEGENRE.GENRE_ID ORDER BY TBL_GENRE.GENRE_TITLE;



/*3.) Left Outer Join Queries

A

Explanation

This query uses a left outer join to list the series in the database stacked beside the genres associated with them. It repeats the name of the series for each genre.

Query*/

SELECT TBL_SERIES.TITLE_EN AS "SERIES", TBL_GENRE.GENRE_TITLE AS "GENRE" FROM TBL_SERIES INNER JOIN TBL_SERIESGENRE ON TBL_SERIES.ID = TBL_SERIESGENRE.SERIES_ID LEFT OUTER JOIN TBL_GENRE ON TBL_SERIESGENRE.GENRE_ID = TBL_GENRE.GENRE_ID ORDER BY TBL_SERIES.TITLE_EN;



/*B

Explanation

This query uses a left outer join to list the genres in the database for which a movie is associated with them. It repeats the genre only when more than one movie is associated with that genre.

Query*/

SELECT TBL_GENRE.GENRE_TITLE AS "GENRE", TBL_MOVIE.TITLE_EN AS "TITLE" FROM TBL_MOVIE INNER JOIN TBL_MOVIEGENRE ON TBL_MOVIE.ID = TBL_MOVIEGENRE.MOVIE_ID LEFT OUTER JOIN TBL_GENRE ON TBL_GENRE.GENRE_ID = TBL_MOVIEGENRE.GENRE_ID ORDER BY TBL_GENRE.GENRE_TITLE;



/*4.) Right Outer Join Queries

A

Explanation

This query uses a right outer join to list all of the genres in the database irrespective of whether they are associated with a series. If they are then it will list them with those series. 

Query*/

SELECT TBL_GENRE.GENRE_TITLE AS "GENRE", TBL_SERIES.TITLE_EN AS "SERIES" FROM TBL_SERIES INNER JOIN TBL_SERIESGENRE ON TBL_SERIES.ID = TBL_SERIESGENRE.SERIES_ID RIGHT OUTER JOIN TBL_GENRE ON TBL_SERIESGENRE.GENRE_ID = TBL_GENRE.GENRE_ID ORDER BY TBL_GENRE.GENRE_TITLE;



/*B

Explanation

This query uses a right outer join across a join table to list directors associated with episodes of series. It uses the DISTINCT keyword in order to avoid repetition of director names (as all directors have directed multiple episodes within the series). This query produces a compact list of directors associated with episodes of series.

Query*/

SELECT DISTINCT TBL_DIRECTOR.FNAME AS "FIRST NAME", TBL_DIRECTOR.LNAME AS "LAST NAME", TBL_SERIES.TITLE_EN AS "SERIES" FROM TBL_DIRECTOR INNER JOIN TBL_DIRECTOREPISODE ON TBL_DIRECTOR.ID = TBL_DIRECTOREPISODE.DIRECTOR_ID INNER JOIN TBL_EPISODE ON TBL_DIRECTOREPISODE.EPISODE_ID = TBL_EPISODE.ID INNER JOIN TBL_EPISODESERIES ON TBL_EPISODESERIES.EPISODE_ID = TBL_EPISODE.ID RIGHT OUTER JOIN TBL_SERIES ON TBL_SERIES.ID = TBL_EPISODESERIES.SERIES_ID ORDER BY TBL_DIRECTOR.LNAME; 



/*5.) Cube Query


Explanation

This cube query conveniently displays the number of movies in the database made in each year of the 1970s and computes the average review rating (sourced from IMDB) across each year. It also provides an overall average and a count of the movies as the first displayed row.

Query*/

SELECT YEAR AS "YEAR", ROUND(AVG(RATING_IMDB), 2) AS "AVERAGE RATING", COUNT(TITLE_EN) AS "NUMBER OF MOVIES" FROM TBL_MOVIE GROUP BY CUBE (YEAR);



/*6.) Sub-Queries

A

Explanation

This sub query generates a list of all the non-US films in the database as well as the country of origin of those films.

Query*/

SELECT TBL_MOVIE.TITLE_EN AS "TITLE", TBL_COUNTRY.NAME_EN AS "COUNTRY" FROM TBL_MOVIE JOIN TBL_MOVIECOUNTRY ON TBL_MOVIE.ID = TBL_MOVIECOUNTRY.MOVIE_ID JOIN TBL_COUNTRY ON TBL_COUNTRY.ID = TBL_MOVIECOUNTRY.COUNTRY_ID WHERE TBL_MOVIECOUNTRY.COUNTRY_ID NOT IN (227);



/*B

Explanation

This sub query generates a list of movies made after 1975 in the database and outputs the English name of the movie, the year it was made and the plot.

Query*/

SELECT TITLE_EN AS "MOVIE", YEAR AS "YEAR", PLOT AS "PLOT" FROM TBL_MOVIE WHERE ID IN (SELECT ID FROM TBL_MOVIE WHERE YEAR>1975) ORDER BY YEAR;;



/*C

Explanation

This sub query generates a list of deceased directors including their date of birth and their date of death.

Query*/
SELECT FNAME AS "FIRST NAME", LNAME AS "LAST NAME", TO_CHAR(DATEOFBIRTH, 'YYYY/MM/DD') AS "DOB", TO_CHAR(DATEOFDEATH, 'YYYY/MM/DD') AS "DIED" FROM TBL_DIRECTOR WHERE ID IN (SELECT ID FROM TBL_DIRECTOR WHERE DATEOFDEATH IS NOT NULL) ORDER BY DATEOFBIRTH;



/*D

Explanation

This sub query generates a list of living actors including their date of birth.

Query*/
SELECT FNAME AS "FIRST NAME", LNAME AS "LAST NAME", TO_CHAR(DATEOFBIRTH, 'YYYY/MM/DD') AS "DOB" FROM TBL_ACTOR  WHERE ID IN (SELECT ID FROM TBL_ACTOR  WHERE DATEOFDEATH IS NULL) ORDER BY DATEOFBIRTH;



/*E

Explanation

This sub query generates a list of movies which have a Rotten Tomatoes (movie review aggregator site) rating of over 95%.

Query*/

SELECT TBL_MOVIE.TITLE_EN AS "TITLE", TBL_MOVIE.RATING_RT AS "ROTTEN TOMATOES RATING" FROM TBL_MOVIE WHERE ID IN (SELECT ID FROM TBL_MOVIE WHERE RATING_RT > 95) ORDER BY RATING_RT DESC;



/*7.) Triggers

A

Explanation

This trigger flags the user if a movie has a very high (over 95%) rating on Rotten Tomatoes (movie review aggregator site).

Code*/

--this trigger lets the user know if the rating on RT is above a certain amount
CREATE OR REPLACE TRIGGER movieinsert_trig
AFTER INSERT ON TBL_MOVIE
FOR EACH ROW
BEGIN
IF :new.RATING_RT>95 THEN
	DBMS_OUTPUT.PUT_LINE('Movie: '|| :new.TITLE_EN || ' has Rotten Tomatoes rating ' || :new.RATING_RT);
END IF;

END;

/*B

Explanation

This trigger flags the user if the director they are entering has already died.

Code*/



--this trigger lets the user know if the given director is dead on entry
CREATE OR REPLACE TRIGGER directorinsert_trig
AFTER INSERT ON TBL_DIRECTOR
FOR EACH ROW
BEGIN
IF :new.DATEOFDEATH IS NOT NULL THEN
	DBMS_OUTPUT.PUT_LINE(:new.FNAME || ' ' || :new.LNAME || ' is dead.');
END IF;

END;

/*C

Explanation

This trigger flags the user if the movie they are trying to enter was made before 1970 (existing movies in database are all between 1970 and 1979).

Code*/



--this trigger lets the user know if the given movie was made before 1970
CREATE OR REPLACE TRIGGER moviedate_trig
BEFORE INSERT ON TBL_MOVIE
FOR EACH ROW
BEGIN
IF :new.YEAR < 1970 THEN
	DBMS_OUTPUT.PUT_LINE(:new.TITLE_EN || ' was made before 1970');
END IF;

END;

/*8.) Function


Explanation

This function uses COUNT in order to count the number of databases in the movie.

Code*/

CREATE OR REPLACE FUNCTION NumberofMovies
RETURN NUMBER
IS
numMovies NUMBER;
BEGIN
	SELECT COUNT(ID) INTO numMovies FROM TBL_MOVIE;
	RETURN numMovies;
	
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;

DECLARE
numMovies NUMBER;
BEGIN
numMovies:=NumberofMovies;
DBMS_OUTPUT.PUT_LINE('The number of movies in the database is ' || numMovies);
END;





/*8.) Procedures

A

Explanation

This procedure shows the age of the actors in the database.

Code*/

CREATE OR REPLACE PROCEDURE ShowActorAge
IS
CURSOR actcur IS SELECT FNAME, LNAME, DATEOFBIRTH, DATEOFDEATH FROM TBL_ACTOR;
v_actor_row actcur%ROWTYPE;
age NUMBER;
dob DATE;
BEGIN
	OPEN actcur;
	FETCH actcur INTO v_actor_row;
	WHILE actcur%FOUND LOOP
	--don't show dead actors
	IF v_actor_row.DATEOFDEATH IS NULL THEN
	dob := v_actor_row.DATEOFBIRTH;
	age := round(MONTHS_BETWEEN(sysdate, dob)/12);
	DBMS_OUTPUT.PUT_LINE('Name: ' ||v_actor_row.FNAME||' '||v_actor_row.LNAME|| ' Age: '||age);
	END IF;
	FETCH actcur INTO v_actor_row;
	END LOOP;
	CLOSE actcur;
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
/

/*B

Explanation

This procedure shows the nationality of directors in the database.



Code*/

CREATE OR REPLACE PROCEDURE ShowDirectorNationality
IS
CURSOR dirtcur IS SELECT TBL_DIRECTOR.FNAME, TBL_DIRECTOR.LNAME, TBL_COUNTRY.NAME_EN FROM TBL_DIRECTOR JOIN TBL_COUNTRY ON TBL_DIRECTOR.BIRTHCOUNTRY = TBL_COUNTRY.ID;
v_directorcountry_row dirtcur%ROWTYPE;
BEGIN
	OPEN dirtcur;
	FETCH dirtcur INTO v_directorcountry_row;
	WHILE dirtcur%FOUND LOOP

	DBMS_OUTPUT.PUT_LINE('Name: ' ||v_directorcountry_row.FNAME||' '||v_directorcountry_row.LNAME|| ' Country: '||v_directorcountry_row.NAME_EN);

	FETCH dirtcur INTO v_directorcountry_row;
	END LOOP;
	CLOSE dirtcur;
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;


/*C

Explanation

This procedure shows user details for the database by automating a join to get birth country details.



Code*/

CREATE OR REPLACE PROCEDURE ShowUserDetails
IS
CURSOR usercur IS SELECT TBL_USER.FNAME, TBL_USER.LNAME, TBL_USER.EMAIL_ADDRESS, TBL_USER.DATEOFBIRTH, TBL_COUNTRY.NAME_EN FROM TBL_USER JOIN TBL_COUNTRY ON TBL_USER.BIRTHCOUNTRY = TBL_COUNTRY.ID;
v_user_row usercur%ROWTYPE;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Current User Details');
	OPEN usercur;
	FETCH usercur INTO v_user_row;
	WHILE usercur%FOUND LOOP
	DBMS_OUTPUT.PUT_LINE('Name: ' ||v_user_row.FNAME||' '||v_user_row.LNAME|| ' Email: '|| v_user_row.EMAIL_ADDRESS ||' Nationality: '||v_user_row.NAME_EN);
	FETCH usercur INTO v_user_row;
	END LOOP;
	CLOSE usercur;
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
/





/*D

Explanation

This procedure shows movie details for the database providing some formatting for easier reading.


Code*/

CREATE OR REPLACE PROCEDURE ShowMovieDetails
IS
CURSOR moviecur IS SELECT TBL_MOVIE.TITLE_EN, TBL_MOVIE.YEAR, TBL_MOVIE.RUNTIME, TBL_MOVIE.PLOT FROM TBL_MOVIE;
v_movie_row moviecur%ROWTYPE;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Movie Details');
	DBMS_OUTPUT.PUT_LINE(' ');
	OPEN moviecur;
	FETCH moviecur INTO v_movie_row;
	WHILE moviecur%FOUND LOOP
	DBMS_OUTPUT.PUT_LINE(' ');	
	DBMS_OUTPUT.PUT_LINE('Title: ' || v_movie_row.TITLE_EN || ' Year: ' || v_movie_row.YEAR || ' Runtime: ' || v_movie_row.RUNTIME);
	DBMS_OUTPUT.PUT_LINE(' ');
	DBMS_OUTPUT.PUT_LINE('Plot');	
	DBMS_OUTPUT.PUT_LINE(v_movie_row.PLOT);
	DBMS_OUTPUT.PUT_LINE(' ');
	FETCH moviecur INTO v_movie_row;
	END LOOP;
	CLOSE moviecur;
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;
/


/*E

Explanation

This procedure outputs a stacked list of actors and movies they have starred in.






Code*/

CREATE OR REPLACE PROCEDURE ShowActorandMovieDetails
IS
CURSOR actormcur IS SELECT TBL_ACTOR.FNAME, TBL_ACTOR.LNAME, TBL_MOVIE.TITLE_EN FROM TBL_ACTOR JOIN TBL_ACTORMOVIE ON TBL_ACTOR.ID = TBL_ACTORMOVIE.ACTOR_ID JOIN TBL_MOVIE ON TBL_MOVIE.ID = TBL_ACTORMOVIE.MOVIE_ID; 
v_actorm_row actormcur%ROWTYPE;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Actor and Movie Details');
	DBMS_OUTPUT.PUT_LINE(' ');
	OPEN actormcur;
	FETCH actormcur INTO v_actorm_row;
	WHILE actormcur%FOUND LOOP
	DBMS_OUTPUT.PUT_LINE(' Name: ' || v_actorm_row.FNAME || ' ' || v_actorm_row.LNAME);	
	DBMS_OUTPUT.PUT_LINE(' Movie: ' || v_actorm_row.TITLE_EN);
	FETCH actormcur INTO v_actorm_row;
	END LOOP;
	CLOSE actormcur;
EXCEPTION
WHEN OTHERS THEN
	raise_application_error(-20001, 'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);	
END;








