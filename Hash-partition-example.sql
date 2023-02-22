 CREATE TABLE orders (
  order_id bigint NOT NULL,
  cust_id bigint NOT NULL,
  status text
)
PARTITION BY HASH (order_id);

---CREATE THE PARTITONS

CREATE TABLE orders_p1 PARTITION OF orders
FOR VALUES WITH (MODULUS 4, REMAINDER 0);

CREATE TABLE orders_p2 PARTITION OF orders
FOR VALUES WITH (MODULUS 4, REMAINDER 1);

CREATE TABLE orders_p3 PARTITION OF orders
FOR VALUES WITH (MODULUS 4, REMAINDER 2);

CREATE TABLE orders_p4 PARTITION OF orders
FOR VALUES WITH (MODULUS 4, REMAINDER 3);

--insert into the data in table
                                         ^
 insert into orders values (1, 1, 'modulus');

 insert into orders values (2, 2, 'modulus');

 insert into orders values (3, 3, 'modulus');

 insert into orders values (1, 2, 'remainder');

 insert into orders values (2, 2, 'remainder');

 insert into orders values (2, 3, 'remainder');

 insert into orders values (3, 3, 'remainder')

 insert into orders values (3, 4, 'remainder');

 insert into orders values (4, 4, 'remainder');

 insert into orders values (4, 4, 'modulus');

 insert into orders values (3, 4, 'modulus');

 insert into orders values (1, 4, 'modulus');


