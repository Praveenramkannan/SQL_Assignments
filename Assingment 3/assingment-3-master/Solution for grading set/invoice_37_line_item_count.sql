/*Submission by praveen.ram.kannan@accenture.com */


/*10.invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.*/



select invoiceid,count(invoicelineid) as'no.of.items' from invoiceline
 where invoiceid=37;


