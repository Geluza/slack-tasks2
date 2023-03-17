const { Client } = require('pg'); 
 
 const client = new Client({ 
 user: 'postgres', 
 host: 'localhost', 
 database: 'tables_films', 
 password: 'power', 
 port: 5432, 
 }); 
 
 client.connect(); 

//изменим в названиях жанров 'мелодраму' на "романтичную мелодраму"
 const query = `UPDATE genres SET name = 'романтичная мелодрама' WHERE name = 'мелодрама'`;

 client.query(query, (err, res) => { 
    if (err) { 
    console.error(err); 
     return; 
     } 
    console.log('Данные успешно изменены'); 
     client.end(); 
     }); 
