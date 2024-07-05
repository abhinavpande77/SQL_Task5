
select * from sales
select * from customer

-- Joins
--Inner Join
select order_id,customer_id,order_date,profit from sales

select customer_id,customer_name from customer

-- All the columns of the tables
select * from sales
inner join customer 
on sales.customer_id = customer.customer_id


-- For specific columns 

select order_id , customer_id,order_date, product_id , profit from sales

select customer_id , customer_name from customer

select sales.order_id , sales.customer_id,sales.order_date, sales.product_id , sales.profit , customer.customer_id,customer.customer_name from sales
inner join customer 
on sales.customer_id = customer.customer_id
limit 20

-- Specific column using 'as' 
select order_id , customer_id,order_date, product_id , profit from sales

select customer_id , customer_name from customer

select s.order_id as "sales order_id" , s.customer_id as "customer_id",s.order_date as "sales order date", s.product_id as "sales product id", s.profit as "sales profit" , c.customer_name as "customer names" from sales as s
inner join customer as c
on s.customer_id = c.customer_id
limit 9

	
-- Left join 
select * from sales
left join customer 
on sales.customer_id = customer.customer_id
offset 9


-- right join
select * from sales
select * from product
	
select * from sales
right join product
on sales.product_id = product.product_id


-- Full join
select * from sales
full join product
on sales.product_id = product.product_id
limit 9


-- Advance Joins
select order_line , customer_id , product_id , order_date , sales from sales
select customer_id , customer_name,city from customer
	
select s.order_line , s.customer_id , s.product_id , s.order_date , s.sales , c.customer_id , c.customer_name, c.city from sales as s
inner join customer as c
on s.customer_id = c.customer_id

 
select sum(sales) , product_id from sales 
group by product_id

select sum(s.sales) ,p.product_name from sales as s
inner join product as p 
on s.product_id = p.product_id
group by p.product_name

-- Multiple inner join
select sum(s.sales) ,s.order_date, p.product_id , p.product_name, c.customer_name from sales as s
inner join product as p
on s.product_id = p.product_id
inner join customer as c
on s.customer_id = c.customer_id
group by s.order_date , p.product_id ,p.product_name , c.customer_name	


-- Using sum , avg , having , limit and group by
select product_id , order_id , sales , quantity from sales
select product_name , product_id from product

select sum(s.sales) , s.product_id , s.order_id , avg(s.quantity),p.product_name,p.product_id from sales as s
inner join product p 
on s.product_id = p.product_id
group by s.product_id , s.order_id , p.product_name , p.product_id
having sum(s.sales) > 500
order by sum(s.sales) ASC
limit 20


