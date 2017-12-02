
/*Submission by praveen.ram.kannan@accenture.com */

/*20.top_agent.sql: Which sales agent made the most in sales over all?*/




select s.firstname,s.lastname,max(s.totalsales) from(select e.firstname,e.lastname,sum(i.total) as totalsales from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid
group by c.supportrepid) s;