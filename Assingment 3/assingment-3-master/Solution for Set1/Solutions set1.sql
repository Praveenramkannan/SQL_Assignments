/*ProblemSet No.1, November 13 2017
*/

Submission by praveen.ram.kannan@accenture.com */




/*1. List full details of all hotels. */


select * from hotel;

/* 2. List full details of all hotels in New York.*/



select * from hotel where city='New York';





/* 3. List the names and cities of all guests, ordered according to their cities.
 */




select name,city from guest order by city;




/* 4. List all details for non-smoking rooms in ascending order of price.*/



select * from room where type='N' order by price;



/* 5. List the number of hotels there are. */

select count(hotel_no) as "No.Of.Hotels" from hotel;

/* 
6. List the cities in which guests live. Each city should be listed only once.
 */
select distinct(city) from guest;


/* 7. List the average price of a room. */


select avg(price) as "Average price of a room" from room;



/* 8. List hotel names, their room numbers, and the type of that room.
 */


select h.name,r.room_no,type from hotel h inner join room r on h.hotel_no=r.hotel_no; 


/* 9. List the hotel names, booking dates, and room numbers for all hotels in New York.
 */
select h.name,b.room_no,b.date_from as "Booking Date" from hotel h inner join booking b on h.hotel_no=b.hotel_no where h.city='New York'; 


/* 10.  What is the number of bookings that started in the month of September?
 */


SELECT COUNT(Guest_no) "No. of bookings in Sep" FROM booking where  EXTRACT(month FROM date_from)=9;


/* 11.  List the names and cities of guests who began a stay in New York in August.
 */



select g.name,g.city,h.name from guest g  join booking b on g.guest_no=b.guest_no inner join hotel h on
h.hotel_no=b.hotel_no where h.city='New York' and EXTRACT(month FROM b.date_from)=8;


/* 12.  List the hotel names and room numbers of any hotel rooms that have not been booked.
 */


select h.name,r.room_no from hotel h inner join room r on h.hotel_no=r.hotel_no where h.hotel_no not in (select hotel_no from booking); 


/* 13.  List the hotel name and city of the hotel with the highest priced room. */


select name,city from hotel join room on hotel.hotel_no=room.Hotel_no where price=(select MAX(price) from room);


/* 14.  List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel. */


select h.name,h.city,r.room_no,r.price from hotel h inner join room r on h.hotel_no=r.hotel_no
where r.price<
(select MIN(r.price) from room r inner join hotel h on h.hotel_no=r.hotel_no where h.city='Boston');


/* 15.  List the average price of a room grouped by city. */

select h.city, avg(r.price) as "average price" from hotel h inner join room r on h.hotel_no=r.hotel_no group by(h.city);