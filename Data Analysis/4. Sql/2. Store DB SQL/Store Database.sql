CREATE DATABASE RedCarpet;
USE RedCarpet;

CREATE TABLE transactions(
id int NOT NULL,
buyer_id int NOT NULL,
purchase_time datetime NOT NULL,
refund_time datetime,
item_id varchar(255) NOT NULL,
store_id varchar(255) NOT NULL,
gross_transaction_value INT NOT NULL,
PRIMARY KEY(id),
foreign key(id) REFERENCES items(id)
);
CREATE TABLE items(
id int NOT NULL,
item_id varchar(255) NOT NULL,
store_id varchar(255) NOT NULL,
item_category varchar(255),
item_name varchar(255),
primary key(id)
);

DROP table Transactions;
drop table items ;

Insert into items
      values(1,'a', 'a1', 'pants', 'demipants'),
	  (2,'a', 'a2','tops', 'blouse'),
        (3,'f', 'f1', 'table', 'coffee table'),
        (4,'f', 'f5', 'chair', 'lounge chair'),
        (5,'f', 'f6', 'chair', 'armchair'),
        (6,'d', 'd2', 'jewellery', 'bracelet'),
        (7,'b', 'b4', 'earphone', 'airpods');
SELECT * FROM items;
	
DESCRIBE transactions;

insert into transactions(id,buyer_id, purchase_time,store_id,item_id, gross_transaction_value)
values(1, 3, '2019-09-29 21:19:06.544', 'a', 'a1', 58),
	  (4, 2, '2020-04-30 21:19:06.544', 'd', 'd3', 250),
      (5, 1, '2020-10-22 22:20:06.531', 'f', 'f2', 91),
      (6, 8, '2020-04-16 12:10:22.214', 'e', 'e7', 24);
insert into transactions
values(2, 12, '2019-12-10 20:10:14.324','2019-12-15 23:19:06.544', 'a', 'b2', 475),     
	  (3, 3, '2020-09-01 23:59:46.531','2020-09-02 23:59:46.53', 'f', '19', 33),
      (7, 5, '2019-9-23 12:09:35.542', '2019-09-27 02:55:02.114', 'g', 'g6', 61);
SELECT * from transactions;

SELECT item_id, COUNT(item_id) count, MONTH(purchase_time) month
FROM transactions
GROUP BY MONTH(purchase_time);

SELECT COUNT(purchase_time) , item_id
 FROM transactions where monthname(purchase_time)='October';
 
select buyer_id, COUNT(item_id) FROM transactions
GROUP  BY item_id LIMIT 3;

SELECT  *
FROM    transactions
WHERE   purchase_time >= refund_time - INTERVAL 3 DAY;

SELECT id, COUNT(buyer_id) all_orders FROM transactions
GROUP by buyer_id having count(buyer_id) = 2;

SELECT id, COUNT(buyer_id), purchase_time FROM transactions 
GROUP by buyer_id HAVING COUNT(buyer_id)=2;