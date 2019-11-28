##this help use the schema movie
use Movie; 


#question 1
# write a query in Sql to find the name and year of a movie
#.
#.
# this query movie selects movie title and movie year from movie_movie table
select movie_title, mov_year
from Movie_Movie;


#question2
#write a query in sql to find the year when the movie america beauty was released;
#.
#.
# this query selects movie year from movie table where movie title is American Beauty
select mov_year
from Movie_Movie
where movie_title = 'AMERICAN BEAUTY';

#question 3
#WRITE A QUERY IN SQL TO FIND THE MOVIE THAT WAS RELEASED IN 1999
#.
#.
#this query selects movie title froom movie_movie table where movie year is 1999
select movie_title
from Movie_Movie
where mov_year = '1999';


#question 4
#write a query in sql to find movies that was released before 1998
#.
#.
#this query selects movie_title from movie table where movie year is 1998.
select movie_title
from Movie_Movie
where mov_year < 1998;



#question5
#write a query in sql to return the name of all the reviewer and name of movies together in a single list
#.
#.
#this query implicitly joins two table which are independent of each other creating a cartesian product.
select rev_name,movie_title
from Movie_Movie, reviewer;



#question6
#write a query in sql to find the name of all the reviewer who have rated 7 or more stars in thier ratings
#.
#.
#this query selects reveiewer's name by joining two table with refrences where rev stars is to or greater than 7
select rev_name
from reviewer
where rev_id IN
				(select rev_id 
				from rating
				where rev_stars >= 7);




#question 7
#write a query in sql to find all the movie that have no ratings
#.
#.
#this query selects reveiewer's name by joining two tables with refrences where number of stars is 0
select movie_title
from Movie_Movie
where mov_id IN 
				(select mov_id 
				from rating
				where num_o_stars = 0);


##question 8
##WRITE A QUERY IN SQL THAT SHOW NAMES OF ALL REVIEWER WHO HAVE RATED THIER RATINGS WITH A NULL VALUE
#.
#.
#this query selects reveiewer's name from by joining two table with refrences where number of stars is null
select rev_name
from reviewer
where rev_id IN 
				(Select rev_id
				from rating
				where num_o_stars = NULL);




###question 9
##write a query in SQL to find the name of moviee and director (first and last names) who directed a movie that casted a role for "Eyes wide shut".
#.
#.
#this query renames dir_fname and dir_lname to first name and last name respectively by joining two tables to view the director of the movie eyes wide shut.
select dir_frame as firstName, dir_iname as lastname
from movie_direction, director, movie_movie
where Movie_Movie.mov_id = movie_direction.mov_id
and director.dir_id = movie_direction.dir_id
and movie_movie.movie_title = 'Eyes wide Shut';
