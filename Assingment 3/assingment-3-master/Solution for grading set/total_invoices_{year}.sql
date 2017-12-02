/*Submission by praveen.ram.kannan@accenture.com */


/*8.total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?*/



select * from invoice where invoicedate like'2009%' or invoicedate like '2011%';


