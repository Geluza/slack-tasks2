DROP TABLE IF EXISTS films CASCADE;

CREATE TABLE films (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
	slogan VARCHAR(1000),
	time_min INT,
	budget_$ INT,
	marketing_$ INT,
	fees_in_USA$ INT,
	fees_in_world$ INT,
	premier_in_Russia VARCHAR(300),
	premier_in_world VARCHAR(300)
);


INSERT INTO films
    (name, slogan, 
	 time_min, budget_$,
	marketing_$, fees_in_USA$,
	fees_in_world$, premier_in_Russia,
	premier_in_world)
VALUES
    ('Зелёная миля', 'слоган зеленой мили',
	189, 60000000, 30000000, 136801374,
	286801374,
'18 апреля 2000 West', '6 декабря 1999' ),

 ('Побег из Шоушенка', 'Страх - это кандалы. Надежда - это свобода',
 142, 25000000, null, 28341469, 28418687, 
'24 октября 2019, «Иноекино»', '10 сентября 1994');

SELECT * FROM films;


DROP TABLE IF EXISTS years CASCADE;

CREATE TABLE years (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    year INT
);
	INSERT INTO years
	(year)
	VALUES
	(1999),
	(1994);
	

DROP TABLE IF EXISTS persons CASCADE;

CREATE TABLE persons (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);
	INSERT INTO persons
	(name)
	VALUES
	('Фрэнк Дарабонт'),
	('Дэид Тэттерсолл'),
	('Томас Ньюман'),
	('Теренс Марш'),
	('Ричард Фрэнсис-Брюс'),
	('Лиз Глоцер'),
	('Роджер Дикинс');
	
	SELECT * from persons;

DROP TABLE IF EXISTS film_persons CASCADE;
CREATE TABLE film_persons (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);
	INSERT INTO film_persons
	(name)
	VALUES
	('Том Хэнкс'),
	('Дэвид Морс'),
	('Бонни Хант'),
	('Тим Роббинс'),
	('Морган Фриман'),
	('Боб Гантон'),
	('Всеволод Кузнецов'),
	('Владимир Антоник'),
	('Любовь Германова'),
	('Иван Литвиненко'),
	('Диомид Виноградов'),
	('Александр Носков');
	
	SELECT * from film_persons;

DROP TABLE IF EXISTS genres CASCADE;
CREATE TABLE genres (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);
	INSERT INTO genres
	(name)
	VALUES
	('драма'),
	('фэнтези'),
	('криминал');
	
	SELECT * from genres;
	
DROP TABLE IF EXISTS countries CASCADE;
CREATE TABLE countries (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);
	INSERT INTO countries
	(name)
	VALUES
	('США'),
	('ИСПАНИЯ'),
	('Германия'),
    ('Италия'),
    ('Норвегия');
	
	SELECT * from countries;

DROP TABLE IF EXISTS age_limit CASCADE;
CREATE TABLE age_limit (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    age VARCHAR(100)
);
	INSERT INTO age_limit
	(age)
	VALUES
	('0+'),
	('6+'),
	('12+'),
	('16+'),
	('18+');
	
	SELECT * from age_limit;
	
DROP TABLE IF EXISTS ratings_MPAA CASCADE;
CREATE TABLE ratings_MPAA (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    rating VARCHAR(10)
);
	INSERT INTO ratings_MPAA
	(rating)
	VALUES
	('G'),
	('PG'),
	('PG-13'),
	('R'),
	('NC-17');
	
	SELECT * from ratings_MPAA;

DROP TABLE IF EXISTS awards CASCADE;
CREATE TABLE awards (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    award VARCHAR(100)
);
	INSERT INTO awards
	(award)
	VALUES
	('ОСКАР'),
	('Золотой Глобус'),
	('Сатурн'),
	('Премия гильдии актеров'),
	('Золотая пальмовая ветвь');
	
	SELECT * from awards;

DROP TABLE IF EXISTS nominations CASCADE;
CREATE TABLE nominations (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nomination VARCHAR(300)
);
	INSERT INTO nominations
	(nomination)
	VALUES
	('Лучший фильм'),
	('Лучшая мужская роль второго плана'),
	('Лучший адаптированный сценарий'),
	('Лучший звук'),
	('Лучшая актриса второго плана'),
	('Лучший режиссёр'),
	('Лучший актёрский состав'),
	('Лучший адаптированный сценарий'),
	('Лучший монтаж'),
	('Лучший оригинальный саундтрек');
	
	SELECT * from nominations;

DROP TABLE IF EXISTS film_year CASCADE;

CREATE TABLE film_year (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	year_id INTEGER NOT NULL REFERENCES years,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_years
        FOREIGN KEY(year_id)
        REFERENCES years(id)
);

INSERT INTO film_year
    (film_id, year_id)
VALUES
    (1, 1),
	(2, 2);
SELECT * from film_year;

SELECT
    f.name AS film_name ,
 	y.year AS  year
	FROM films f
LEFT JOIN film_year fy ON fy.film_id = f.id
LEFT JOIN years y ON y.id = fy.year_id;


DROP TABLE IF EXISTS film_country CASCADE;

CREATE TABLE film_country (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	country_id INTEGER NOT NULL REFERENCES countries,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_countries
        FOREIGN KEY(country_id)
        REFERENCES countries(id)
);

INSERT INTO film_country
    (film_id, country_id)
VALUES
    (1, 1),
	(2, 1);
SELECT * from film_country;

SELECT
    f.name AS film_name ,
 	c.name AS country_name 
	FROM films f
LEFT JOIN film_country fc ON fc.film_id = f.id
LEFT JOIN countries c ON c.id = fc.country_id;



DROP TABLE IF EXISTS film_genres CASCADE;

CREATE TABLE film_genres (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	genre_id INTEGER NOT NULL REFERENCES genres,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_genres
        FOREIGN KEY(genre_id)
        REFERENCES genres(id)
);

INSERT INTO film_genres
    (film_id, genre_id)
VALUES
    (1, 1),
	(1, 2),
	(1, 3),
	(2, 1);
SELECT * from film_genres;

SELECT
    f.name AS film_name ,
 	g.name AS genre_name 
	FROM films f
LEFT JOIN film_genres fg ON fg.film_id = f.id
LEFT JOIN genres g ON g.id = fg.genre_id;


DROP TABLE IF EXISTS film_director CASCADE;

CREATE TABLE film_director (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_director
    (film_id, person_id)
VALUES
    (1, 1),
	(2, 1);
SELECT * from film_director;

SELECT
    f.name AS film_name ,
 	p.name AS director_name 
	FROM films f
LEFT JOIN film_director fd ON fd.film_id = f.id
LEFT JOIN persons p ON p.id = fd.person_id;


DROP TABLE IF EXISTS film_writer CASCADE;

CREATE TABLE film_writer (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_writer
    (film_id, person_id)
VALUES
    (1, 1),
	(2, 1);
SELECT * from film_writer;

SELECT
    f.name AS film_name ,
 	p.name AS writer_name 
	FROM films f
LEFT JOIN film_writer fw ON fw.film_id = f.id
LEFT JOIN persons p ON p.id = fw.person_id;


DROP TABLE IF EXISTS film_producer CASCADE;

CREATE TABLE film_producer (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_producer
    (film_id, person_id)
VALUES
    (1, 1),
	(2, 6);
SELECT * from film_producer;

SELECT
    f.name AS film_name ,
 	p.name AS producer_name 
	FROM films f
LEFT JOIN film_producer fd ON fd.film_id = f.id
LEFT JOIN persons p ON p.id = fd.person_id;



DROP TABLE IF EXISTS film_operator CASCADE;

CREATE TABLE film_operator (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_operator
    (film_id, person_id)
VALUES
    (1, 2),
	(2, 7);
SELECT * from film_operator;

SELECT
    f.name AS film_name ,
 	p.name AS operator_name 
	FROM films f
LEFT JOIN film_operator fo ON fo.film_id = f.id
LEFT JOIN persons p ON p.id = fo.person_id;



DROP TABLE IF EXISTS film_composer CASCADE;

CREATE TABLE film_composer (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_composer
    (film_id, person_id)
VALUES
    (1, 3),
	(2, 3);
SELECT * from film_composer;

SELECT
    f.name AS film_name ,
 	p.name AS composer_name 
	FROM films f
LEFT JOIN film_composer fc ON fc.film_id = f.id
LEFT JOIN persons p ON p.id = fc.person_id;



DROP TABLE IF EXISTS film_montage CASCADE;

CREATE TABLE film_montage (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	person_id INTEGER NOT NULL REFERENCES persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_persons
        FOREIGN KEY(person_id)
        REFERENCES persons(id)
);

INSERT INTO film_montage
    (film_id, person_id)
VALUES
    (1, 5),
	(2, 5);
SELECT * from film_montage;

SELECT
    f.name AS film_name ,
 	p.name AS montage_name 
	FROM films f
LEFT JOIN film_montage fm ON fm.film_id = f.id
LEFT JOIN persons p ON p.id = fm.person_id;


DROP TABLE IF EXISTS film_limit CASCADE;

CREATE TABLE film_limit (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	age_id INTEGER NOT NULL REFERENCES age_limit,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_age_limit
        FOREIGN KEY(age_id)
        REFERENCES age_limit(id)
);

INSERT INTO film_limit
    (film_id, age_id)
VALUES
    (1, 4),
	(2, 4);
SELECT * from film_limit;

SELECT
    f.name AS film_name ,
 	al.age AS age_limit
	FROM films f
LEFT JOIN film_limit fl ON fl.film_id = f.id
LEFT JOIN age_limit al ON al.id = fl.age_id;


DROP TABLE IF EXISTS film_rating CASCADE;

CREATE TABLE film_rating (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	rating_id INTEGER NOT NULL REFERENCES ratings_MPAA,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_ratings_MPAA
        FOREIGN KEY(rating_id)
        REFERENCES ratings_MPAA(id)
);

INSERT INTO film_rating
    (film_id, rating_id)
VALUES
    (1, 4),
	(2, 4);
SELECT * from film_rating;

SELECT
    f.name AS film_name ,
 	rm.rating AS rating
	FROM films f
LEFT JOIN film_rating fr ON fr.film_id = f.id
LEFT JOIN ratings_MPAA rm ON rm.id = fr.rating_id;



DROP TABLE IF EXISTS film_actors CASCADE;

CREATE TABLE film_actors (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	name_id INTEGER NOT NULL REFERENCES film_persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_film_persons
        FOREIGN KEY(name_id)
        REFERENCES film_persons(id)
);

INSERT INTO film_actors
    (film_id, name_id)
VALUES
    (1, 1),
	(1, 2),
	(1, 3),
	(2, 4),
	(2, 5),
	(2, 6);
SELECT * from film_actors;

SELECT
    f.name AS film_name ,
 	fp.name AS actor
	FROM films f
LEFT JOIN film_actors fa ON fa.film_id = f.id
LEFT JOIN film_persons fp ON fp.id = fa.name_id;



DROP TABLE IF EXISTS film_duplicated CASCADE;

CREATE TABLE film_duplicated (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	name_id INTEGER NOT NULL REFERENCES film_persons,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_film_persons
        FOREIGN KEY(name_id)
        REFERENCES film_persons(id)
);

INSERT INTO film_duplicated
    (film_id, name_id)
VALUES
    (1, 7),
	(1, 8),
	(1, 9),
	(2, 10),
	(2, 11),
	(2, 12);
SELECT * from film_duplicated;

SELECT
    f.name AS film_name ,
 	fp.name AS duplicated
	FROM films f
LEFT JOIN film_duplicated fd ON fd.film_id = f.id
LEFT JOIN film_persons fp ON fp.id = fd.name_id;


DROP TABLE IF EXISTS film_awards CASCADE;

CREATE TABLE film_nominations (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	award_id INTEGER,
	nomination_id INTEGER,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_awards
        FOREIGN KEY(award_id)
        REFERENCES awards(id),
	CONSTRAINT fk_nominations
        FOREIGN KEY(nomination_id)
        REFERENCES nominations(id)
);

INSERT INTO film_nominations
    (film_id, award_id, nomination_id)
VALUES
    (1, 1, 1),
	(1, 1, 2),
	(1, 1, 3),
	(1, 1, 4),
	(1, 2, 2),
	(1, 3, 4),
	(1, 3, 6),
	(1, 4, 2),
	(1, 4, 7),
	(2, 1, 1),
	(2, 1, 4),
	(2, 1, 9),
	(2, 1, 10);
SELECT * from film_nominations;

SELECT
    f.name AS film_name ,
 	a.award AS award,
	n.nomination AS nomination
	FROM films f
LEFT JOIN film_nominations fn ON fn.film_id = f.id
LEFT JOIN awards a ON a.id = fn.award_id
LEFT JOIN nominations n ON n.id = fn.nomination_id;


DROP TABLE IF EXISTS film_viewers CASCADE;

CREATE TABLE film_viewers (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    film_id INTEGER NOT NULL REFERENCES films,
	name_id INTEGER,
	date_release VARCHAR(300),
	count_viewers INTEGER,
	CONSTRAINT fk_films
        FOREIGN KEY(film_id)
        REFERENCES films(id),
	CONSTRAINT fk_cointries
        FOREIGN KEY(name_id)
        REFERENCES countries(id)
);

INSERT INTO film_viewers
    (film_id, name_id, date_release, count_viewers)
VALUES
    (1, 1, '10 декабря 1999', 26000000),
	(1, 3, '10 февраля 2000', 2107877),
	(1, 4, '10 марта 2000', 1742730),
	(1, 2, '18 февраля 2000', 692555),
	(2, 1, '14 октября 1994', 6660100),
	(2, 2, '24 февраля 1995', 1245604),
	(2, 3, '9 марта 1995', 427231);
SELECT * from film_viewers;

SELECT
    f.name AS film_name ,
 	c.name AS country,
	fv.date_release AS date_release,
	fv.count_viewers AS count_viewers
	FROM films f
LEFT JOIN film_viewers fv ON fv.film_id = f.id
 JOIN countries c ON c.id = fv.name_id;
 
 
 

 


