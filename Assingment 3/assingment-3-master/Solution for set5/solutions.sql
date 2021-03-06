/* ProblemSet No.5, November 30 2017
*/
/* Submission by praveen.ram.kannan@accenture.com*/



/*1.Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997. (1 point possible)*/
select m.m_name 
from concert c,musician m
where c.concert_organiser =m.m_no and c.concert_venue like 'assembly rooms' and c.con_date>1997-02-01;

/*2.Find all the performers who played guitar or violin and were born in England. (1 point possible)*/
select m.m_name 
from musician m,place p,performer pr
where m.m_no=pr.perf_is and m.born_in=p.place_no and pr.instrument in('guitar','violin') and p.place_country like 'england';

/*3.List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts. (1 point possible)*/
select m.m_name,p.place_town,p.place_country,c.con_date
from musician m,concert c,place p
where c.concert_organiser=m.m_no and c.concert_in=p.place_no and p.place_country like 'USA';

4.How many concerts have featured at least one composition by Andy Jones? List concert date, venue and the composition's title. (1 point possible)

/*5.List the different instruments played by the musicians and avg number of musicians who play the instrument. (1 point possible)*/
select instrument,count(perf_is) 
from performer  
 group by instrument;

/*6.List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays. (1 point possible)*/
select m.m_name,m.born,p.instrument
from musician m,performer p
where m.m_no=p.perf_is and m.died is null
and p.instrument in(select instrument from performer where perf_is =(select m.m_no from musician m where m_name like '%theo%') );

/*7.List the name and the number of players for the band whose number of players is greater than the average number of players in each band. (1 point possible)*/
select p.band_id,b.band_name,count(p.player) as playercount
from band b join plays_in p ON b.band_no=p.band_id
group by p.band_id 
having  playercount > (select sum(count) /count(band_id) from (select band_id,count(player) as count from plays_in group by band_id));

/*8.List the names of musicians who both conduct and compose and live in Britain. (1 point possible)*/
select m1.m_name from musician m1 join has_composed h on h.cmpr_no=m1.m_no  where cmpno in
(select c1.cmpno  from has_composed  c1 join composition c2 on c1.cmpno=c2.c_no
where c1.cmpr_no   in (select distinct(m.m_no) from musician m join concert c on c.concert_organiser=m.m_no 
where living_in in(select place_no from place where place_country like'england'))
and c2.c_in in (select place_no from place where place_country like'england'));
select m.m_no from musician m where living_in in(select place_no from place where place_country like'england')

/*9.Show the least commonly played instrument and the number of musicians who play it. (1 point possible)*/
select * from
(select p.instrument,m.m_name,count(p.perf_is) as count
from musician m join performer p
on m.m_no=p.perf_is
group by p.instrument) a where a.count in (select min(count) from (select p.instrument,m.m_name,count(p.perf_is) as count
from musician m join performer p
on m.m_no=p.perf_is
group by p.instrument));


10.List the bands that have played music composed by Sue Little; Give the titles of the composition in each case. (1 point possible)

/*11.List the name and town of birth of any performer born in the same city as James First.(1 point possible)*/
select a.m_name,p.place_town 
from place p ,(select m_name,born_in from musician  where born_in in(select born_in from musician where m_name like'james first')) a
where a.born_in=p.place_no;

/*12.Create a list showing for EVERY musician born in Britain the number of compositions and the number of instruments played. (1 point possible)*/
select a.m_no,a.m_name,a.countof_instruments,count(b.cmpno) as countof_composition from   
(select m.m_no,m.m_name,count(instrument) as countof_instruments  from (select m_no,m_name from musician 
where born_in in(select place_no from place where place_country like 'england')) m  left join performer p
on m.m_no=p.perf_is group by p.m.m_no) a  left join has_composed b on a.m_no=b.cmpr_no
group by a.m_no;

13.Give the band name, conductor and contact of the bands performing at the most recent concert in the Royal Albert Hall. (1 point possible)
14.Give a list of musicians associated with Glasgow. Include the name of the musician and the nature of the association - one or more of 'LIVES_IN', 'BORN_IN', 'PERFORMED_IN' AND 'IN_BAND_IN'. (1 point possible)
15.Jeff Dawn plays in a band with someone who plays in a band with Sue Little. Who is it and what are the bands? (1 point possible)
