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
       total_price decimal(12,2) not null,
       house_no varchar(50) not null, 
       address_line1 varchar(50) not null,
       address_line2 varchar(50) null,
       town_city varchar(30) not null,
       postcode varchar(10) not null 
     )AUTO_INCREMENT=3000001;

      create table order_line
      (order_no integer not null references customer_order,
       product_id integer not null references product,
       item_price decimal (12,2) not null,
       quantity_ordered integer not null,
       total_price decimal (12,2) not null,
       primary key (order_no, product_id)
       );
       
       
       
       
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Adam','Morrison', 'Mr', 'adam.morrison@sky.uk', '$2a$10$gpHTQlrd4GIssPPXkTFV3upgkhhv.Vsl4899ofcmhPPfTckyrdV3y', 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); -- passwd Apricot5
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('John','Bloggs', 'Mr', 'john.bloggs@sky.uk', '$2a$10$gkrY9A6F02LlYLdjeOWZfOyTEvFamkZKM.QudDKboaDtv3llF3V2u', 103, 'what way erith', 'london', 'SE3 9HY'); -- passwd Car666
     
     insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
     values ('Jeff','Joans', 'Mr', 'jeff.joans@sky.uk', '$2a$10$W/dpQ4PgWFDczuqD7sk27uNYY8zmaW4g9EU/o9tvdoorsoCGyrPDC', 83, 'long street', 'wrotham', 'TN15 9HY'); -- passwd Orange78
     
--      insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
--      values ('Jess','Joans', 'Miss', 'jess.joans@sky.uk', 'lemon88', 22, 'short street', 'woolwich', 'se18 9UV');
--      
--      insert into customer(first_name, last_name, title, email, user_password, house_no, address_line1, town_city, postcode)
--      values ('April','Bennett', 'Mrs', 'april.bennett@sky.uk', 'Apple98', 32, 'round street', 'Greenwich', 'se16 9UV');
     
       
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('James Bond Top Trumps', 10, 5, 3, 'The names Bond, James Bond. This pack needs no introduction, its simply the Best of Bond. Villains, Henchman all the Bonds and a few glamorous women thrown in for good measure, it\'s the greatest adventure ever, so pay attention 007. Suitable for ages 3 years + Safety Information: Warning. Not suitable for Children under 3 years.', 4.9, 10, 2.99, 'toys');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Shrek Mug', 6, 3, 16, 'The perfect gift for Shrek fans, your chance to show your love for the film and its sequels! High quality ceramic photo coffee mug, dimensions approx. 4x3 inches, dishwasher and microwave safe.', 4.9, 8, 3.99, 'household');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Despicable Me Minion Bag', 8, 4, 8, 'If your little one can\'t get enough of the Minions, they\'ll adore this fun backpack featuring their favourite characters. With a colourful blue and yellow Minions design, this backpack has one large zip pocket for storage with adjustable shoulder straps for comfort!', 4.9, 8, 15.99, 'clothing');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Ghostbusters Hat', 3, 3, 4, 'A hat perfect for fans of the iconic Ghostbusters movie. Based on the highly popular film it features a high quality embroidered logo and text design. The cap also features an adjustable fastener and is made using high quality materials ensuring it is comfortable. Ideal for fans of the popular movies.', 2.9, 6, 15.99, 'clothing');
     
     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Game of Thrones Pin', 6, 8, 9, 'Become part of the Game Of Thrones story with this awesome Hand of the King pin! Beautifully crafted this Hand of The King Pin is a replica of the one seen within the hit HBO series Game of Thrones. An ideal gift for any fan this Game of thrones Hand Of The king pin measures 3-inches long x 1.1.4 inches wide.', 6.3, 4, 5.99, 'toys');

	   insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Game of Thrones Babygrow', 4, 4, 5, 'This funny and unique Game of Thrones baby grow would make the perfect gift. It has an envelope neck opening with narrow self-bound neck and sleeve ends. the Game of Thrones print is on high quality cotton, the quirky design makes for an funny, adorable little baby outfit.', 6.7, 7, 22.99, 'clothing'); 

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Team Sky Jersey and Shorts', 7, 8, 2, 'Accept no compromises when supporting your favourite team. A jersey that proudly sports the 2016 colours of Team Sky, made from a breathable and wicking fabric.', 8.7, 1, 69.99, 'clothing');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Sky Remote', 12, 7, 10, 'If you’re a Sky+HD box and TV customer, this popular Sky remote control will put stunning high definition back at your fingertips.', 7.5, 8, 19.99, 'electronics');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Ghostbusters Phonecase', 6, 5, 6, 'Pefect for all ghostbusters fans! This original case gives you the perfect way to protect your mobile device as it is both flexible and impact-resistant..', 6.5, 3, 9.99, 'electronics');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Shrek Ogre Ears Headband', 10, 3, 7, 'Ideal fancy dress accessory for the characters Shrek and Princess Fiona.', 6.8, 4, 3.99, 'clothing');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Despicable Me Minion Bowling Set', 5, 3, 1, 'The Minions in this Despicable Me Bowling Set were made to be knocked over! Set up the six pins and go head-to-head with friends to see who`s got the strongest bowling arm. Each pin features a quirky Minion face so wind up and aim for a strike! This sporty set is ideal for indoor or outdoors play and any number of players. A great gift for three years and up.', 8.6, 6, 14.99, 'toys');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Game of Thrones Monopoly', 6, 3, 15, 'Game of Thrones meets monopoly with this number 1 property board game based on the hit TV series. Play with your favourite characters from the show, trade and invest in the locations, collect your monopoly money and take your place on the Iron Throne. Contents include: Game board, 6 x collectable tokens, 28 x title deed cards, 16 x Valar Morghulis cards, 16 x Iron Throne cards, 2 x dice, 32 x villages, 12 x keeps, 1 x pack of custom GOT money and rules.', 7.6, 7, 23.99, 'toys');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Despicable Me Minions Watch', 9, 3, 12, 'Fun minions LCD watch with Minions graphics on straps.', 9.2, 6, 24.99, 'media');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Disney Frozen Digital Camera', 8, 7, 14, 'Capture every fun moment and relive great memories with this Frozen Digital Camera. Compact size means you can take it anywhere - parties, days out, or hanging out with friends. ', 8.1, 4, 29.99, 'electronics');

     insert into product(product_name, stock_level, stock_reorder_level, warehouse_location, product_description, product_rating, rating_count, product_price, product_category)
     values('Disney Frozen Backpack', 9, 3, 13, 'Our Frozen light up backpack adds sparkle and fun to any adventure! This gorgeous design includes a PVC panel over a blue glitter background with character artwork and twinkling lights.', 7.3, 2, 19.99, 'clothing');

     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000001', '2016-06-02 12:25:24', 'standard', 'ordered', 14.33, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000002', '2016-06-03 13:27:34', 'next_day', 'dispatched', 15.33, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000003', '2016-07-04 09:28:24', 'standard', 'ordered', 14.33, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000002', '2016-07-17 08:18:54', 'next_day', 'processing', 11.83, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000003', '2016-06-22 13:35:24', 'standard', 'ordered', 52.33, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
     insert into customer_order(customer_id, order_date, delivery_type, order_status, total_price, house_no, address_line1, town_city, postcode)
     values ('1000001', '2016-06-02 16:25:24', 'next_day', 'delivered', 35.93, 5, 'brimpsfield close abbeywood', 'london', 'SE2 9LR'); 
     
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

