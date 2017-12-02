/*Submission by praveen.ram.kannan@accenture.com */


/* 17.invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.*/



select distinct(invoiceid),count(invoicelineid) from invoiceline group by(invoiceid);


