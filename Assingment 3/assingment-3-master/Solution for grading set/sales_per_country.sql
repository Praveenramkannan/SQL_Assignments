/*Submission by praveen.ram.kannan@accenture.com */


/*22.sales_per_country.sql: Provide a query that shows the total sales per country.*/



select distinct(billingcountry),sum(total) from invoice group by(billingcountry)


