//List all customers who spent 25% or less than the average amount spent on all invoices. For each customer, display their name and the amount spent to 6 decimal places. Order the result by the amount spent from high to low.

SET NOCOUNT ON;

declare @a float    
set @a =(select avg(total_price) from invoice)

select a.customer_name ,avg(b.total_price) from customer a
join invoice b on a.id=b.customer_id
group by a.customer_name
having avg(b.total_price)<=@a/4
order by avg(b.total_price) desc
go