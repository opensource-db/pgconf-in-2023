postgres=# CREATE TABLE cities (
  city_id bigserial NOT NULL,
  name text NOT NULL,
  population bigint
)
PARTITION BY LIST (left(lower(name), 1));
CREATE TABLE
postgres=# CREATE TABLE cities_ab PARTITION OF cities 
FOR VALUES IN ('a', 'b');
CREATE TABLE
postgres=# CREATE TABLE cities_cd PARTITION OF cities 
FOR VALUES IN ('c', 'd');
CREATE TABLE
postgres=# CREATE TABLE cities_ef PARTITION OF cities 
FOR VALUES IN ('e', 'f');
CREATE TABLE
postgres=# CREATE TABLE cities_gh PARTITION OF cities 
FOR VALUES IN ('g', 'h');
CREATE TABLE
postgres=# \d
                     List of relations
 Schema |        Name        |       Type        |  Owner   
--------+--------------------+-------------------+----------
 public | cities             | partitioned table | postgres
 public | cities_ab          | table             | postgres
 public | cities_cd          | table             | postgres
 public | cities_city_id_seq | sequence          | postgres
 public | cities_ef          | table             | postgres
 public | cities_gh          | table             | postgres
 public | employee           | table             | postgres
(7 rows)

postgres=# \d cities
                          Partitioned table "public.cities"
   Column   |  Type  | Collation | Nullable |                 Default                 
------------+--------+-----------+----------+-----------------------------------------
 city_id    | bigint |           | not null | nextval('cities_city_id_seq'::regclass)
 name       | text   |           | not null | 
 population | bigint |           |          | 
Partition key: LIST ("left"(lower(name), 1))
Number of partitions: 4 (Use \d+ to list them.)

postgres=# select * from cities;
 city_id | name | population 
---------+------+------------
(0 rows)

postgres=# insert into cities values (1, 'hyd', 1000000);
INSERT 0 1
postgres=# insert into cities values (2, 'abc', 1000000);
INSERT 0 1
postgres=# insert into cities values (3, 'bca', 2000000);
INSERT 0 1
postgres=# insert into cities values (4, 'cba', 3000000);
INSERT 0 1
postgres=# insert into cities values (5, 'boy', 3000000);
INSERT 0 1
postgres=# insert into cities values (7, 'crros', 4000000);
INSERT 0 1
postgres=# insert into cities values (8, 'drop', 4000000);
INSERT 0 1
postgres=# insert into cities values (9, 'egg', 4000000);
INSERT 0 1
postgres=# insert into cities values (10, 'forst', 5000000);
INSERT 0 1
postgres=# select * from cities_ef;
 city_id | name  | population 
---------+-------+------------
       9 | egg   |    4000000
      10 | forst |    5000000
(2 rows)

postgres=# select * from cities_ab;
 city_id | name | population 
---------+------+------------
       2 | abc  |    1000000
       3 | bca  |    2000000
       5 | boy  |    3000000
(3 rows)

postgres=# select * from cities_cd;
 city_id | name  | population 
---------+-------+------------
       4 | cba   |    3000000
       7 | crros |    4000000
       8 | drop  |    4000000
(3 rows)

postgres=# insert into cities values (10, 'abcdefgh', 6000000);
INSERT 0 1
postgres=# select * from cities_cd;
 city_id | name  | population 
---------+-------+------------
       4 | cba   |    3000000
       7 | crros |    4000000
       8 | drop  |    4000000
(3 rows)

postgres=# select * from cities_gh;
 city_id | name | population 
---------+------+------------
       1 | hyd  |    1000000
(1 row)

postgres=# select * from cities;
 city_id |   name   | population 
---------+----------+------------
       2 | abc      |    1000000
       3 | bca      |    2000000
       5 | boy      |    3000000
      10 | abcdefgh |    6000000
       4 | cba      |    3000000
       7 | crros    |    4000000
       8 | drop     |    4000000
       9 | egg      |    4000000
      10 | forst    |    5000000
       1 | hyd      |    1000000
(10 rows)

postgres=# insert into cities values (11, 'hg', 6000000);
INSERT 0 1
postgres=# select * from cities;
 city_id |   name   | population 
---------+----------+------------
       2 | abc      |    1000000
       3 | bca      |    2000000
       5 | boy      |    3000000
      10 | abcdefgh |    6000000
       4 | cba      |    3000000
       7 | crros    |    4000000
       8 | drop     |    4000000
       9 | egg      |    4000000
      10 | forst    |    5000000
       1 | hyd      |    1000000
      11 | hg       |    6000000
(11 rows)

postgres=# select * from cities_gh;
 city_id | name | population 
---------+------+------------
       1 | hyd  |    1000000
      11 | hg   |    6000000
(2 rows)

postgres=# insert into cities values (11, 'hf', 6000000);
INSERT 0 1
postgres=# select * from cities_gh;
 city_id | name | population 
---------+------+------------
       1 | hyd  |    1000000
      11 | hg   |    6000000
      11 | hf   |    6000000
(3 rows)

postgres=# select * from cities_ef;
 city_id | name  | population 
---------+-------+------------
       9 | egg   |    4000000
      10 | forst |    5000000
(2 rows)

postgres=# insert into cities values (13, 'fd', 6000000);
INSERT 0 1
postgres=# select * from cities_ef;
 city_id | name  | population 
---------+-------+------------
       9 | egg   |    4000000
      10 | forst |    5000000
      13 | fd    |    6000000
(3 rows)

postgres=# select * from cities_cd;
 city_id | name  | population 
---------+-------+------------
       4 | cba   |    3000000
       7 | crros |    4000000
       8 | drop  |    4000000
(3 rows)
