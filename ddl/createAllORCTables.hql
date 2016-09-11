DROP DATABASE IF EXISTS ${hiveconf:ORCDBNAME} CASCADE;
CREATE DATABASE IF NOT EXISTS ${hiveconf:ORCDBNAME};

USE ${hiveconf:ORCDBNAME};

DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.customer
CLUSTER BY C_MKTSEGMENT
;

DROP TABLE IF EXISTS lineitem;
CREATE TABLE IF NOT EXISTS lineitem
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.lineitem 
CLUSTER BY L_SHIPDATE
;

DROP TABLE IF EXISTS nation;
CREATE TABLE IF NOT EXISTS nation
STORED AS ORC
AS SELECT DISTINCT * FROM ${hiveconf:SOURCE}.nation;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.orders
CLUSTER BY o_orderdate
;

DROP TABLE IF EXISTS part;
CREATE TABLE IF NOT EXISTS part
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.part
CLUSTER BY p_brand
;

DROP TABLE IF EXISTS partsupp;
CREATE TABLE IF NOT EXISTS partsupp
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.partsupp
CLUSTER BY PS_SUPPKEY
;

DROP TABLE IF EXISTS region;
CREATE TABLE IF NOT EXISTS region
STORED AS ORC
AS SELECT DISTINCT * FROM ${hiveconf:SOURCE}.region;

DROP TABLE IF EXISTS supplier;
CREATE TABLE IF NOT EXISTS supplier
STORED AS ORC
AS SELECT * FROM ${hiveconf:SOURCE}.supplier
CLUSTER BY s_nationkey, s_suppkey
;