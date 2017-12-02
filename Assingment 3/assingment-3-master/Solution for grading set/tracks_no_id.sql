/*Submission by praveen.ram.kannan@accenture.com */


/* 16.tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.*/




select t.name,a.title,m.name,g.name from track t join album a on t.albumid=a.albumid join mediatype m on m.mediatypeid=t.mediatypeid join genre g on g.genreid=t.genreid;


