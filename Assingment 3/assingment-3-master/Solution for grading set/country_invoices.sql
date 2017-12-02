/*Submission by praveen.ram.kannan@accenture.com */


/*14.country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY*/



select distinct(Billingcountry),count(invoiceid) from invoice group by(billingcountry);


