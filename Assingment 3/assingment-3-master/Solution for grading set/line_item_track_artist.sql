/*Submission by praveen.ram.kannan@accenture.com */


/*13.line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.*/



select t.name,t.composer,i.invoicelineid from track t join invoiceline i on t.trackid=i.trackid;


