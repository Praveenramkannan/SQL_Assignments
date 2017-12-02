/*Submission by praveen.ram.kannan@accenture.com */


/*12.line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.*/



select t.name,i.invoicelineid from track t join invoiceline i on i.trackid=t.trackid;


