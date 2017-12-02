
/*Submission by praveen.ram.kannan@accenture.com */


/*9.total_sales_{year}.sql: What are the respective total sales for each of those years?*/



select invoicedate,sum(total) from invoice group by(invoicedate) where invoicedate like'2009%' or invoicedate like '2011%';


