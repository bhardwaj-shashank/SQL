
-- Q1. Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’,
-- ‘amount’,‘customer_id’

     CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    amount FLOAT,
	customer_id VARCHAR
    )

	
--Q2. Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column


      SELECT * FROM Orders INNER JOIN Customer ON Orders.customer_id = Customer.customer_id


--Q3. Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column


      SELECT * FROM customer LEFT JOIN Orders ON customer.customer_id = Orders.customer_id
      SELECT * FROM customer RIGHT JOIN Orders ON customer.customer_id = Orders.customer_id


--Q4. Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3


      UPDATE Orders SET amount = 100 WHERE customer_id = 3

	  
