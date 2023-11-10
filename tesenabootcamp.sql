
create table orders (  
    ord_no number,  
    purch_amt number,  
    ord_date date,  
    customer_id number,  
    salesman_id number  
);

create table salesman (  
    salesman_id number,  
    name varchar2(30),  
    city varchar2(30),  
    commission number  
);

create table customer (  
    customer_id number,  
    cust_name varchar2(30),  
    city varchar2(30),  
    grade number,  
    salesman_id number  
);

insert into orders values (7001, 150.5, (TO_DATE('2012-10-05', 'YYYY-MM-DD')), 3005, 5002) ;

insert into orders values (7009, 270.65, (TO_DATE('2012-09-10', 'YYYY-MM-DD')), 3002, 5005) ;

insert into orders values (7002, 65.26, (TO_DATE('2012-10-05', 'YYYY-MM-DD')), 3002, 5001) ;

insert into orders values (7004, 110.5, (TO_DATE('2012-08-17', 'YYYY-MM-DD')), 3009, 5003) ;

insert into orders values (7007, 948.5, (TO_DATE('2012-09-10', 'YYYY-MM-DD')), 3005, 5002) ;

insert into orders values (7005, 2400.6, (TO_DATE('2012-07-27', 'YYYY-MM-DD')), 3007, 5001) ;

insert into orders values (7008, 5760, (TO_DATE('2012-09-10', 'YYYY-MM-DD')), 3002, 5001) ;

insert into orders values (7010, 1983.43, (TO_DATE('2012-10-10', 'YYYY-MM-DD')), 3004, 5006) ;

insert into orders values (7003, 2480.4, (TO_DATE('2012-10-10', 'YYYY-MM-DD')), 3009, 5003) ;

insert into orders values (7012, 250.45, (TO_DATE('2012-06-27', 'YYYY-MM-DD')), 3008, 5002) ;

insert into orders values (7011, 75.29, (TO_DATE('2012-08-17', 'YYYY-MM-DD')), 3003, 5007) ;

insert into orders values (7013, 3045.6, (TO_DATE('2012-04-25', 'YYYY-MM-DD')), 3002, 5001) ;

insert into salesman values (5001, 'James Hoog', 'New York', 0.15) ;

insert into salesman values (5002, 'Neil Knite', 'Paris', 0.13);

insert into salesman values (5005, 'Pit Alex', 'London', 0.11);

insert into salesman values (5006, 'Mc Lyon', 'Paris', 0.14);

insert into salesman values (5007, 'Paul Adam', 'Rome', 0.13);

insert into salesman values (5003, 'Lauson Hen', 'San Jose', 0.12);

insert into customer values (3002, 'Nick Rimando', 'New York', 100, 5001);

insert into customer values (3007, 'Brad Davis', 'New York', 200, 5001);

insert into customer values (3005, 'Graham Zusi', 'California', 200, 5002);

insert into customer values (3008, 'Julian Green', 'London', 300, 5002);

insert into customer values (3004, 'Fabian Johnson', 'Paris', 300, 5006);

insert into customer values (3009, 'Geoff Cameron', 'Berlin', 100, 5003);

insert into customer values (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

select customer.cust_name as "Customer Name", customer.city, salesman.name as Salesman, salesman.commission
from customer
join salesman on customer.salesman_id=salesman.salesman_id;

select orders.ord_no, orders.purch_amt, orders.ord_date, customer.customer_id, customer.cust_name, customer.city as "customer city", customer.grade, salesman.salesman_id, salesman.name, salesman.city as "salesman city", salesman.commission
from customer 
join orders
on customer.customer_id=orders.customer_id
join salesman
on orders.salesman_id=salesman.salesman_id
order by ord_no asc;

select orders.ord_no, orders.purch_amt, customer.cust_name, customer.city
from orders
join customer
on orders.customer_id=customer.customer_id
where orders.purch_amt between 500 AND 2000;

select ord_no
from orders
where salesman_id = 
(select salesman_id
from salesman
where name = 'James Hoog');

select * 
from orders 
where purch_amt > 
(select AVG(purch_amt) 
from orders 
where ord_date = '10.10.12');