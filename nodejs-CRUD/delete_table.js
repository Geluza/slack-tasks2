const { Client } = require('pg'); 
 
 const client = new Client({ 
 user: 'postgres', 
 host: 'localhost', 
 database: 'tables_films', 
 password: 'power', 
 port: 5432, 
 }); 
 
 client.connect(); 


 //удаляем строку с жанром фэнтези из таблицы film_genres 
 const query = `DELETE FROM film_genres WHERE genre_id = 2`; 

 
client.query(query, (err, res) => { 
    if (err) { 
    console.error(err); 
     return; 
     } 
     console.log('Данные таблицы успещно удалены'); 
     client.end(); 
    });