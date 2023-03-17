const { Client } = require('pg'); 
 
 const client = new Client({ 
 user: 'postgres', 
 host: 'localhost', 
 database: 'tables_films', 
 password: 'power', 
 port: 5432, 
 }); 
 
 client.connect(); 

 //выводим таблицу с фильмами и их жанрами в консоль в виде объекта 
 const query = `SELECT
 f.name AS film_name ,
  g.name AS genre_name 
 FROM films f
LEFT JOIN film_genres fg ON fg.film_id = f.id
LEFT JOIN genres g ON g.id = fg.genre_id`;

  client.query(query, (err, res) => { 
   if (err) { 
   console.error(err); 
   return; 
   } 
   for (let row of res.rows) { 
    console.log(row); 
    } 
    client.end(); 
    }); 

//до update
//{ film_name: 'Зелёная миля', genre_name: 'драма' }
//{ film_name: 'Зелёная миля', genre_name: 'фэнтези' }        
//{ film_name: 'Зелёная миля', genre_name: 'криминал' }       
//{ film_name: 'Побег из Шоушенка', genre_name: 'драма' }     
//{ film_name: 'Титаник', genre_name: 'мелодрама' }
//{ film_name: 'Титаник', genre_name: 'история' }
//{ film_name: 'Титаник', genre_name: 'триллер' }

//после update
//{ film_name: 'Зелёная миля', genre_name: 'драма' }
//{ film_name: 'Зелёная миля', genre_name: 'криминал' }
//{ film_name: 'Побег из Шоушенка', genre_name: 'драма' }
//{ film_name: 'Титаник', genre_name: 'романтичная мелодрама' }
//{ film_name: 'Титаник', genre_name: 'история' }
//{ film_name: 'Титаник', genre_name: 'триллер' }