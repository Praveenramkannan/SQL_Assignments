
/*Submission by praveen.ram.kannan@accenture.com */



/*25.top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.*/



select t.name,count(i.invoicelineid) as countsold 
from invoiceline i,track t
where i.trackid=t.trackid
group by t.name
order by countsold desc
limit 0,5;