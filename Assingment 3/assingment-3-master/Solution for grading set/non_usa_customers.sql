/*Submission by praveen.ram.kannan@accenture.com */




/* non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/

 

select firstname,lastname,customerid,country from customer where country not like 'USA';

