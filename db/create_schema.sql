DROP TABLE customer;
DROP TABLE product;
DROP TABLE customer_order;
DROP TABLE order_line;

      create table customer
     ( customer_id integer unsigned not null auto_increment primary key,
       first_name varchar(20) not null,
       last_name varchar(20) not null,
       title ENUM('mr', 'miss', 'mrs', 'ms'),
       email varchar(50) not null UNIQUE,
       user_password varchar(200) not null,   
       house_no varchar(50) not null, 
       address_line1 varchar(50) not null,
       address_line2 varchar(50) null,
       town_city varchar(30) not null,
       postcode varchar(10) not null 
     ) AUTO_INCREMENT=1000001;
     
      create table product
     ( product_id integer unsigned not null auto_increment primary key,
       product_name char(50) not null,
       stock_level integer not null,
       stock_reorder_level integer not null,
       warehouse_location char(40) not null,
       product_description varchar(500) not null,
       product_rating Double,
       rating_count integer not null,
       product_price decimal(6,2) not null,
       product_category ENUM('household', 'media', 'electronics', 'clothing', 'toys') -- will need to be updated
     )AUTO_INCREMENT=2000001;
     
     create table customer_order
     ( order_no integer unsigned not null auto_increment primary key,
       customer_id integer unsigned not null references customer,
       order_date datetime not null,
       delivery_type ENUM('standard', 'next_day'),
       order_status ENUM('ordered', 'processing', 'dispatched', 'delivered'),
       total_price decimal(4,2) not null
     )AUTO_INCREMENT=3000001;

      create table order_line
      (order_no integer not null references customer_order,
       product_id integer not null references product,
       item_price decimal (4,2) not null,
       quantity_ordered integer not null,
       total_price decimal (4,2) not null,
       primary key (order_no, product_id)
       );
       
       
       
       
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Adam','Morrison', 'Mr', 'adam.morrison@sky.uk', 'Apricot', 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR');
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('John','Bloggs', 'Mr', 'john.bloggs@sky.uk', 'Car66', 103, 'what way erith', 'london', 'SE3 9HY');
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Jeff','Joans', 'Mr', 'jeff.joans@sky.uk', 'orange78', 83, 'long street', 'wrotham', 'TN15 9HY');
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Jess','Joans', 'Miss', 'jess.joans@sky.uk', 'lemon88', 22, 'short street', 'woolwich', 'se18 9UV');
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('April','Bennett', 'Mrs', 'april.bennett@sky.uk', 'Apple98', 32, 'round street', 'Greenwich', 'se16 9UV');
     
       
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Shrek Mug', 10, 5, 3, 'This is a Shrek mug', 4.9, 10, 99.99, 'household');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Shrek DVD', 6, 3, 16, 'This is a shrek DVD', 4.9, 8, 3.99, 'media');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Game of Thrones hat', 8, 4, 8, 'This is a GoT hat.', 4.9, 8, 9.99, 'clothing');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Minions radio', 3, 3, 4, 'This is a minions radio clock', 2.9, 6, 1129.99, 'electronics');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('simpsons teddy', 6, 8, 9, 'This is a bart teddy', 7.9, 9, 19.99, 'toys');

     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000001', '2016-06-02 12:25:24', 'standard', 'ordered', 14.33); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000002', '2016-06-03 13:27:34', 'next_day', 'dispatched', 15.33); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000003', '2016-07-04 09:28:24', 'standard', 'ordered', 14.33); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000004', '2016-07-17 08:18:54', 'next_day', 'processing', 11.83); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000005', '2016-06-22 13:35:24', 'standard', 'ordered', 52.33); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price)
     values ('1000001', '2016-06-02 16:25:24', 'next_day', 'delivered', 35.93); 
     
     insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('3000001', '2000001', 4.99 , 4, 19.96);
      
       insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('3000002', '2000002', 3.99 , 1, 3.99);
      
       insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('3000003', '2000003', 9.99 , 2, 19.98);
      
       insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('3000004', '2000004', 29.99 , 1, 29.99);
      
       insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('3000005', '2000005', 19.99 , 1, 19.99);

