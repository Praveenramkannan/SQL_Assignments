/*Submission by praveen.ram.kannan@accenture.com */


/*23.top_country.sql: Which country's customers spent the most?*/



select billingcountry from invoice where total=(select max(total) from invoice);



