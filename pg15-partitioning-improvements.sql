--Example #1
--Assume we want to update the "pay_rate" column for all employees. Here is an example query:

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    pay_rate NUMERIC NOT NULL,
    hours_worked NUMERIC NOT NULL,
    salary NUMERIC GENERATED ALWAYS AS (pay_rate * hours_worked) STORED
) PARTITION BY RANGE (id);

CREATE TABLE full_time_employee PARTITION OF employee FOR VALUES FROM (0) TO (100);

CREATE TABLE part_time_employee PARTITION OF employee FOR VALUES FROM (100) TO (MAXVALUE);


UPDATE employee SET pay_rate = pay_rate * 1.05;

--Example #2
--Improve planning time for queries referencing partitioned tables this change helps when only a few of many partitions are relevant.

-- Create a partitioned table
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE,
    amount NUMERIC
)
PARTITION BY RANGE (sale_date);

-- Create some partitions

CREATE TABLE sales_2023_01 PARTITION OF sales FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');
CREATE TABLE sales_2023_02 PARTITION OF sales FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
CREATE TABLE sales_2023_03 PARTITION OF sales FOR VALUES FROM ('2023-03-01') TO ('2023-04-01');


-- Create an index on the sale_date column

CREATE INDEX sales_date_index ON sales (sale_date);

-- Query the table for sales in January 2023

EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM sales WHERE sale_date >= '2023-01-01' AND sale_date <= '2023-01-31';

--Example #3
--Fix ALTER TRIGGER RENAME on partitioned tables to properly rename triggers on all partitions

-- Create a partitioned table

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE,
    amount NUMERIC
)
PARTITION BY RANGE (sale_date);

-- Create a trigger on the partitioned table

CREATE TRIGGER sales_trigger
BEFORE INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION sales_function();

-- Rename the trigger on the partitioned table

ALTER TRIGGER sales_trigger RENAME TO new_sales_trigger;

-- Check that the trigger was renamed on all partitions

SELECT trigger_name, event_object_table
FROM information_schema.triggers
WHERE event_object_table = 'sales';

--Example #4
-- CLUSTER partition feature

CREATE TABLE city (
  id int4 NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  state varchar(20),
  population int4 
)
PARTITION BY RANGE (id);

CREATE TABLE city_id1 PARTITION OF city
FOR VALUES FROM (MINVALUE) TO (10);

CREATE TABLE city_id2 PARTITION OF city
FOR VALUES FROM (10) TO (20);

CREATE TABLE city_id3 PARTITION OF city
FOR VALUES FROM (20) TO (30);

CREATE TABLE city_id4 PARTITION OF city 
FOR VALUES FROM (30) TO (MAXVALUE);

postgres=# \d+ city
                                              Partitioned table "public.city"
   Column   |         Type          | Collation | Nullable | Default | Storage  | Compression | Stats target | Description 
------------+-----------------------+-----------+----------+---------+----------+-------------+--------------+-------------
 id         | integer               |           | not null |         | plain    |             |              | 
 name       | character varying(30) |           | not null |         | extended |             |              | 
 state      | character varying(20) |           |          |         | extended |             |              | 
 population | integer               |           |          |         | plain    |             |              | 
Partition key: RANGE (id)
Indexes:
    "city_pkey" PRIMARY KEY, btree (id)
    "idx_city" btree (id)
Partitions: city_id1 FOR VALUES FROM (MINVALUE) TO (10),
            city_id2 FOR VALUES FROM (10) TO (20),
            city_id3 FOR VALUES FROM (20) TO (30),
            city_id4 FOR VALUES FROM (30) TO (MAXVALUE)


INSERT INTO city values (1,'a','ts',100000);
INSERT INTO city values (3,'b','mh',400000);
INSERT INTO city values (5,'c','kl',300000);
INSERT INTO city values (2,'d','gt',500000);
INSERT INTO city values (14,'e','ah',120000);
INSERT INTO city values (29,'f','tn',540000);
INSERT INTO city values (32,'j','dl',430000);

create index idx_city on city (id);

SELECT * from city;
CLUSTER idx_city on city;

postgres=# SELECT * from city;
 id | name | state | population 
----+------+-------+------------
  1 | a    | ts    |     100000
  2 | d    | gt    |     500000
  3 | b    | mh    |     400000
  5 | c    | kl    |     300000
 14 | e    | ah    |     120000
 29 | f    | tn    |     540000
 32 | j    | dl    |     430000
(7 rows)


SELECT * from city_id1;
SELECT * from city_id2;
SELECT * from city_id3;
SELECT * from city_id4;