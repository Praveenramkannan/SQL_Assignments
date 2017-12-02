/*Submission by praveen.ram.kannan@accenture.com */


/*15.playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.*/



select distinct(p.playlistid),t.name,count(tr.trackid) from playlisttrack p
join playlist t on t.playlistid=p.playlistid
join track tr on tr.trackid=p.trackid
group by(p.playlistid);


