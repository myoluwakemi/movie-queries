Create Table Actor (

act_id		integer		not null,
act_frame	Char(20)	not null,
act_Iname	Char(20)	not null,
act_gender	Char(1)		not null,
CONSTRAINT		Actor_PK		PRIMARY KEY(act_id)

);

create table Movie_Movie (
mov_id			integer			not null,
movie_title		char(50)		not null,
mov_year		integer			not null,
mov_time		integer			not null,
mov_lang		char(50)		not null,
mov_dt_rel		date			null,
mov_rel_country	char(5)			not null,
constraint		movie_movie_pk	PRIMARY KEY(mov_id)

);




Create Table Movie_cast (

act_id		integer			not null,
mov_id		integer			not null,
movie_role		char(30)		null,
CONSTRAINT		Movie_cast_PK		PRIMARY KEY(act_id,mov_id),
CONSTRAINT		Movie_cast_FK		FOREIGN KEY(act_id)
								REFERENCES Actor(act_id),
CONSTRAINT 		Movie_c_FK	FOREIGN KEY (mov_id)
							REFERENCES 	Movie_Movie (mov_id)
								
);
create Table director (
dir_id			integer			not null,
dir_frame		char(20)		null,
dir_iname		char(20)		not null,
constraint		director_PK		PRIMARY KEY(dir_id)

);

create table movie_direction (
dir_id		integer			not null,
mov_id		integer			not null,
constraint	movie_direction_pk	primary key(dir_id,mov_id),
constraint  movie_direction_fk	foreign key(dir_id)
								references director(dir_id),
constraint	movie_direct_fk		foreign key(mov_id)
								references movie_movie(mov_id)
);

create table reviewer (
rev_id		integer			not null,
rev_name	char(30)		not null,
constraint	reviewer_pk		primary key(rev_id)

);

create table genres (
gen_id		integer			not null,
gen_title	char(20)		not null,
constraint	genre_pk		primary key(gen_id)
);

create	table movie_genre (
mov_id		integer			not null,
gen_id		integer			not null,
constraint	movie_genre_pk	primary key(mov_id, gen_id),
constraint  movie_genre_fk	foreign key(mov_id)
								references movie_movie(mov_id),
constraint	movie_gen_fk		foreign key(gen_id)
								references genres(gen_id)
);



create table rating (
mov_id			integer			not null,
rev_id			integer			not null,
rev_stars		integer			not null,
num_o_stars		integer			not null,
constraint		rating_mov_fk	foreign key(mov_id) references Movie_Movie(mov_id),
constraint		rating_rev_fk	foreign key(rev_id) references reviewer(rev_id)
);