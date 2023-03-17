const { Client } = require('pg'); 
 
 const client = new Client({ 
 user: 'postgres', 
 host: 'localhost', 
 database: 'tables_films', 
 password: 'power', 
 port: 5432, 
 }); 
 
 client.connect(); 


 //создаем таблицу film_genres
 let query = `
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
)`;

client.query(query, (err, res) => { 
   if (err) { 
   console.error(err); 
    return; 
    } 
    console.log('Таблица успешно создана'); 
    client.end(); 
   }); 



  //заполняем таблицу данными: присваиваем фильмам жанр(ы),
  //у одного фильма может быть несколько жанров

 query = `INSERT INTO film_genres (film_id, genre_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (3, 4), (3, 5), (3,6)`;

client.query(query, (err, res) => { 
 if (err) { 
 console.error(err); 
  return; 
  } 
 console.log('Данные успешно добавлены в таблицу'); 
  client.end(); 
  }); 

 
