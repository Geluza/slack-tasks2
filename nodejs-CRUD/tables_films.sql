DROP TABLE IF EXISTS films CASCADE;

CREATE TABLE films (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100));

INSERT INTO films
  (name)
VALUES
 ('Зелёная миля'),
 ('Побег из Шоушенка'),
  ('Титаник');

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
	('криминал'),
	('мелодрама'),
	('история'),
	('триллер');
	

DROP TABLE IF EXISTS genres CASCADE;
CREATE TABLE years (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  year INT
);
	INSERT INTO genres
	(year)
	VALUES
   (1994),
   (1997),
   (1999);