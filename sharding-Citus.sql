/*
Data Sharding ::

In PostgreSQL, one way to shard data is to use the built-in partitioning feature, which allows you to split a table into smaller sub-tables based on a partition key. Here is an example of how to shard a table called orders based on the order_date column:
*/

-- Create a partitioned table:

CREATE TABLE orders (
    order_id SERIAL,
    order_date DATE NOT NULL,
    customer_id INTEGER NOT NULL,
    customer_name varchar NOT NULL
)
PARTITION BY RANGE (order_date);

/*
This creates an empty partitioned table and specifies that it should be partitioned by range, using the order_date column as the partition key.

Create partitions:
*/

CREATE TABLE orders_2019 PARTITION OF orders
    FOR VALUES FROM ('2019-01-01') TO ('2020-01-01');
CREATE TABLE orders_2020 PARTITION OF orders
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
CREATE TABLE orders_2021 PARTITION OF orders
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

/*
This creates three partitions for the orders table, one for each year.

Insert data into partitions:
*/

INSERT INTO orders_2019 (order_id,order_date, customer_id,customer_name) VALUES (1,'2019-01-01', 1, 'Mac');
INSERT INTO orders_2020 (order_id,order_date, customer_id, customer_name) VALUES (2,'2020-01-01', 2, 'Zin');
INSERT INTO orders_2021 (order_id,order_date, customer_id, customer_name) VALUES (3,'2021-01-01', 3, 'Care');

/*
This inserts data into the appropriate partitions based on the order_date.

Query across partitions:
*/

SELECT * FROM orders WHERE order_date BETWEEN '2019-01-01' AND '2022-01-01';

postgres=# select * from sharding.orders;

 order_id | order_date | customer_id | customer_name
----------+------------+-------------+---------------
        1 | 2019-01-01 |           1 | Mac
        2 | 2020-01-01 |           2 | Zin
        3 | 2021-01-01 |           3 | Care
(3 rows)

/*

This query retrieves data from all three partitions and combines the results into a single result set.

Citus Extension :

Install the Citus extension:
*/

CREATE EXTENSION citus;

/*
Set up a coordinator node:
*/

SELECT citus_add_node('coordinator_node', 5432);

/*
This sets up a coordinator node that will act as the interface for your sharded database.

Set up worker nodes:
*/

SELECT citus_add_node('worker_node1', 5432);
SELECT citus_add_node('worker_node2', 5432);

/*
These commands add two worker nodes to the cluster, which will store the sharded data.

Create a distributed table:
*/

CREATE TABLE orders (
    order_id SERIAL,
    order_date DATE NOT NULL,
    customer_id INTEGER NOT NULL,
    ...
)
DISTRIBUTED BY (order_date);

/*
This creates a distributed table that will be sharded across the worker nodes based on the order_date column.

Insert data into the distributed table:
*/

INSERT INTO orders (order_date, customer_id, ...) VALUES ('2019-01-01', 1, ...);
INSERT INTO orders (order_date, customer_id, ...) VALUES ('2020-01-01', 2, ...);
INSERT INTO orders (order_date, customer_id, ...) VALUES ('2021-01-01', 3, ...);

/*
This inserts data into the distributed table, which will be automatically sharded across the worker nodes based on the order_date.

Citus for sharding provides automatic partitioning, rebalancing and query routing, which makes it a convenient and efficient solution for scaling a PostgreSQL database.
*/