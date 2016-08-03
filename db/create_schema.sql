DROP TABLE customer;
DROP TABLE product;
DROP TABLE customer_order;
DROP TABLE order_line;

      create table customer
     ( customer_id integer unsigned not null auto_increment primary key,
       first_name varchar(20) not null,
       last_name varchar(20) not null,
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
       product_rating integer not null,
       product_price decimal(4,2) not null,
       Product_category ENUM('household', 'media', 'electronics', 'clothing', 'toys') -- will need to be updated
     )AUTO_INCREMENT=2000001;
     
     create table customer_order
     ( order_no integer unsigned not null auto_increment primary key,
       order_date datetime not null,
       delivery_type ENUM('standard', 'next day'),
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
       
       
       
       
     
     insert into customer(first_name, last_name, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Adam','Morrison', 'adam.morrison@sky.uk', 'Apricot', 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR');
     
     insert into customer(first_name, last_name, email, user_password, house_no, address_line1, town_city, postcode)
     values ('jeff','Morrison', 'adammorrison@hotmail.com', 'Apricot', '5', 'brimpsfield close abbeywood', 'london', 'SE2 9LR');
       
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, product_price, product_category)
     values('Shrek Mug', 10, 5, 'Aisle 16', 'This is a Shrek mug', 4.9 , 4.99, 'household');

     insert into customer_order(order_date, delivery_type, order_status, total_price)
     values ('2016-06-02 12:25:24', 'standard', 'ordered', '14.33'); 
     
     insert into customer_order(order_date, delivery_type, order_status, total_price)
     values ('2016-06-02 12:25:24', 'standard', 'ordered', '14.33'); 
     
     insert into order_line ( order_no, product_id, item_price, quantity_ordered, total_price)
      values ('1', '1', '2.50' , '4', '10.0');

