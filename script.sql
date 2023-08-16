-- Active: 1692175748769@@127.0.0.1@5433@scheduletest@public

-- PRODUCT --
CREATE TABLE product(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255)
);

insert into product (create_time, name) values (current_timestamp, 'product1'), (current_timestamp, 'product2'),(current_timestamp, 'product3');


select * from product;

-- CONSUMER --
CREATE TABLE consumer(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255)
);

insert into consumer (create_time, name) values (current_timestamp, 'name1'), (current_timestamp, 'name2'),(current_timestamp, 'name3');

select * from consumer;

-- ORDERS --

CREATE TABLE orders(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    consumerId int,
    productId int,
    create_time DATE
);


insert into orders (consumerId, productId, create_time) 
    values 
    (1, 1, current_timestamp),
    (1, 2, current_timestamp),
    (1, 3, current_timestamp),
    (2, 1, current_timestamp),
    (2, 2, current_timestamp),
    (3, 1, current_timestamp);

select * from orders;

-- MATERIALIZED VIEW --
SELECT orders.create_time as order_time, consumer.name as consumer, product.name as product 
    FROM orders
    JOIN consumer on orders.consumerId = consumer.id
    JOIN product on orders.productId = product.id;


CREATE MATERIALIZED VIEW order_report AS 
    SELECT orders.create_time as order_time, consumer.name as consumer, product.name as product 
    FROM orders
    JOIN consumer on orders.consumerId = consumer.id
    JOIN product on orders.productId = product.id;

select * from order_report;

insert into orders (consumerId, productId, create_time) values  (3, 3, current_timestamp);

REFRESH MATERIALIZED VIEW order_report;

-- JOB --
CREATE EXTENSION pg_cron;
select * from cron.job_run_details order by start_time;
select * from cron.job;
SELECT cron.schedule('update-order-view', '30 seconds', 'REFRESH MATERIALIZED VIEW order_report'); 
select cron.unschedule(1);
DELETE FROM cron.job_run_details;



-- --
SHOW config_file;