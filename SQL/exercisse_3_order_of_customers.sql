/*
Question 1: Total Orders Per Customer

Write a query to display the total number of orders placed by each customer, 
along with their name and the date they joined. Sort the results by the total number of orders in descending order.
*/

SELECT 
    customer_name,
    join_date,
    Count(Orders.customer_id)
FROM customers
JOIN Orders ON Customers.customer_id=Orders.customer_id
Group BY
    customer_name,join_date
ORDER BY
    Count(Orders.customer_id)

/*
Question 2: Rank Customers by Spending

For each customer, calculate their total spending (sum of the total amounts from the `Orders` table) 
and rank them by total spending within their respective country. 
Use a **window function** to rank the customers.
*/

SELECT
    Customers.customer_name,
    customers.country,
    RANK() Over (Partition By customers.country ORDER BY SUM(OrderItems.price*OrderItems.quantity))
FROM 
    customers
JOIN 
    Orders ON customers.customer_id=Orders.customer_id
Join 
    OrderItems ON Orders.order_id=OrderItems.order_id
Group BY 
    customers.customer_name,
    customers.country