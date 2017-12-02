/*Submission by praveen.ram.kannan@accenture.com */


/*19.top_2009_agent.sql: Which sales agent made the most in sales in 2009?


Hint: Use the MAX function on a subquery.*/




select s.firstname,s.lastname,max(totalsales) from (select e.firstname,e.lastname,sum(i.total) as totalsales from invoice i,customer c,employee e
where i.customerid=c.customerid and c.supportrepid=e.employeeid and i.invoicedate like'2009%'
group by c.supportrepid) s;
