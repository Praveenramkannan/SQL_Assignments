/* ProblemSet No.2, November 13 2017
*/
/* Submission by praveen.ram.kannan@accenture.com
 

/* 1.  Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden 
*/


select sum(weight) from picked where plantFK=2;


/* 2. For some reason Erin has change his location for picking the tomato to North. Write the corresponding query. */


update picked set locationFK=1 where gardenerFK=3;


/* 3. Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores  Experience of the of person. How will you modify this to varchar2(30). */



alter table gardener add exper number(30);
alter table gardener modify exper varchar2(30);



/* 4. Write a query to find the plant name which required seeds less than 20 which plant on 14-APR */


select p.name from plant p inner join planted pt on p.plantid=pt.plantfk where seeds<20 and date1= '14-APR-2012';




/*5. List the amount of sunlight and water to all plants with names that start with letter  'c' or letter 'r'. 
*/


select sum(sunlight),sum(water) from plant where name like 'C%' or name like 'R%';


/* 6. Write a valid SQL statement that displays the plant name and  the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name. */


select p.name, pt.seeds from plant p inner join planted pt on p.plantid=pt.plantfk order by p.name desc;



/* 7. Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average number of items = total amount picked / total seeds planted.) */


select p.name,(pc.amount/pt.seeds)as "Avg. no. of Items" 
from plant p inner join planted pt on p.plantid=pt.plantfk 
inner join picked pc on pt.plantfk=pc.plantfk; 



/* 8. Write a valid SQL statement that would produce a result set like the following: 

        name |  name  |    date    | amount 
       ------+--------+------------+-------- 
        Tim  | Radish | 2012-07-16 |     23 
        Tim  | Carrot | 2012-08-18 |     28 */


select g.name,p.name,pc.date1,pc.amount from gardener g inner join picked pc on g.gardenerid=pc.gardenerfk inner join plant p on p.plantid=pc.plantfk 
where (g.name='Tim' and (p.name='Carrot' or p.name='Radish')) order by pc.amount;





/* 9. Find out persons who picked from the same location as he/she planted. 
*/


select distinct(name) from gardener g inner join planted pt on g.gardenerid=pt.gardenerfk inner join picked pc on g.gardenerid=pc.gardenerfk 
where pc.locationfk=pt.locationfk; 


/* 10. Create a view that lists all the plant names picked from all locations except ’West’ in the month of August. 
*/


CREATE VIEW [Plant_List] AS
SELECT p.name 
FROM plant p inner join picked pc on p.plantid=pc.plantfk
Where locationfk <> 2 and location =(select Extract month from pc.date1=8);