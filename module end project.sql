drop database library ;
create database library ;
use library ;
create table branch(branch_no int primary key,manager_id int(30),branch_address varchar(30),contact_number varchar(30));
insert into branch values
(10001,101,"Kottakkal",9076567678),
(10002,102,"Tirur",9087345456),
(10003,103,"Malappuram",9087678789),
(10004,104,"Manjeri",9878765656),
(10005,105,"Perinthalmanna",9087678789);
desc branch ;
select * from branch ;
create table employees(employees_id int primary key,emp_name varchar(30),position varchar(30),salary varchar(30),branch_id int(30),foreign key(branch_no) references branch(branch_no));
insert into employees values
(1101,"sankar","librarian",30000,10001),
(1302,"malavika","accountant",25000,10004),
(1203,"rahim","accountant",25000,10003),
(1404,"radhamani","librarian",30000,10002),
(1705,"suresh","attender",20000,10005);
desc employees ;
select * from employees ;
create table books(isbn varchar(30) primary key,book_title varchar(30),category varchar(30),rental_price float(30),status boolean,author varchar(30),publisher varchar(30));
insert into books values
("8122611885","randamoozham","novel",50.00,True,"M.T.Vasudevan nair","DC Books"),
("8171302092","pathummayude aaadu","novel",30.00,True,"vaikom muhammed basheer","DC Books"),
("9789355491794","amazoneum kure vyakulathakalum","travelogue",20,False,"MP veerendrakumar","Mathrbhumi"),
("9789354821394","amaran","short story",20,True,"VKN","mambazham"),
("789357329682","Swarangal","poetry",30,True,"k sachidanandan","DC Books"),
("9788171300129","anavariyum ponkurishum","novel",50,True,"vaikkom muhammed basheer","DC Books"),
("9788122607277","naalukettu","novel",50,False,"MT Vasudevan nair","thrissur current books");
desc books ;
select * from books ;
create table customer(customer_id int(30) primary key,customer_name varchar(30),customer_address varchar(30),reg_date date);
insert into customer values
(001,"ravikumar","sreenilayam,kottoor,kottakkal","2022-10-12"),
(002,"sreelakshmi","pournami house,tirurtown","2022-07-04"),
(003,"arun","udayam house,malappuram","2023-03-18"),
(004,"parvathi","souparnika,manjeri town","2023-07-23"),
(005,"aravind","sarovaram,perinthalmanna","2022-09-24");
desc customer ;
select * from customer ;
create table issue_status(issue_id int(30) primary key,issued_cust int,issue_date date,isbn_book varchar(30),foreign key(issued_cust) references customer(customer_id),foreign key(isbn_book) references books(isbn));
insert into issue_status values
(1020,001,"2023-01-03","8122611885"),
(1021,003,"2023-05-16","9789354821394"),
(1022,004,"2023-09-05","9788171300129"),
(1023,002,"2022-07-18","8171302092"),
(1024,005,"2022-10-05","789357329682");
desc issue_status ;
select * from issue_status ;
create table return_status(return_id int(30) primary key,return_cust int,return_book_name varchar(30),return_date date,isbn_book2 varchar(30),foreign key(return_cust) references customer(customer_id),foreign key(isbn_book2) references books(isbn));
insert into return_status values
(2051,001,"randamoozham","2023-03-19","8122611885"),
(2052,003,"amaran","2023-07-18","9789354821394"),
(2053,004,"aana variyum pon kurishum","2023-11-17","9788171300129"),
(2054,002,"paathummayude aadu","2023-03-23","8171302092"),
(2055,005,"swarangal","2023-02-15","789357329682");
desc return_status ;
select * from return_status ;



select book_title,category,rental_price from books where status=True ;



select emp_name,salary from employees order by salary desc ; 



select books.book_title,customer.customer_name 
from books
join issue_status on books.isbn=issue_status.isbn-book
join customer on issue_status.issued_cust=customer.customer_id ;



select category,count(*) from books group by category ;



select emp_name,position from employees where salary>50000 ;

select emp_name,position from employees where salary>10000 and salary<30000 ;



select branch.branch_no,count(*) as total_employees 
from branch
join employees where branch.branch_no=employees.branch_no
group by branch.branch_no ;



select customer_name from customer where reg_date < "2022-01-01"
and customer_id not in (select distinct issued_cust from  issue_status);



select distinct customer_name from customer
join issue_status on customer.customer_id=issue_status.issued_cust
where issue_date >=2023-06-01 and issue_date<2023-07-01 ;



select book_title from books where category="history";

select book_title from books where category="novel";



select distinct customer_name from customer
join issue_status on customer.customer_id=issue_status.issued_cust
where issue_date>=2022-09-01 
and issue_date<2024-01-01;



select branch.branch_no, count(*) as total_employees
from branch
 join employees on branch.branch_no=employees.branch_no
 group by branch.branch_no;
 
 select branch.branch_no, count(*) as total_employees
from branch
 join employees on branch.branch_no=employees.branch_no
 group by branch.branch_no having count(*)>5;









