CREATE DATABASE library;
use library;

CREATE TABLE Branch(
Branch_no varchar(19) PRIMARY KEY,
Manager_Id varchar(16),
Branch_address VARCHAR(40),
Contact_no varchar(17));

CREATE TABLE Employee(
Emp_Id varchar(15) PRIMARY KEY,
Emp_name VARCHAR(20),
Position varchar(70),
Branch_no varchar(20),
Salary float);


CREATE TABLE Customer(
Customer_Id varchar(15) PRIMARY KEY,
Customer_name VARCHAR(20),
Customer_address VARCHAR(30),
Reg_date DATE);

drop table Customer;
drop table issueStatus;
drop table ReturnStatus;

CREATE TABLE Books(
Isbn varchar(15)  primary key,
Book_title varchar(155),
Category varchar(40),
Rental_Price float,
status varchar(3) check(status in("yes","no")),
 Author varchar(50),
 Publisher varchar(30));


CREATE TABLE IssueStatus(
Issue_Id int primary key,
Issued_cust  varchar(15) ,
Issued_book_name varchar(50),
Issue_date Date,
Isbn_book varchar(15),
foreign key(Issued_cust)references Customer(Customer_Id),
foreign key(Isbn_book) references Books(Isbn));

CREATE  TABLE ReturnStatus(
Return_Id  int primary key,
 Return_cust varchar(15),
 Return_book_name varchar(50),
 Return_date date,
 Isbn_book2 varchar(30),
 foreign key (Isbn_book2) references Books(Isbn));
 
 insert into Employee
 values
 ("e1001","parthiv","librarian","brn001",55000),
 ("e1002","asish","instructor","brn003", 50000),
 ("e1003","rahul","manager","brn002",85000),
 ("e1004","johan","clerk","brn001",80000),
 ("e1005","kiara","operator","brn003",70000),
 ("e1006","nathasha","project assistant","brn003",65000),
 ("e1007","suhan","library staff","brn002",55000);
 
 

 insert into books
 values
 ("isbn1001","The Hunger Games" ,"Dystopian Fiction",300,"no"," Suzanne Collins", "Scholastic"),
 ("isbn1002","Harry Potter and the Philosopher's Stone", "Fantasy Magic",1000,"yes", "J.K. Rowling","Bloomsbury"),
 ("isbn1003","The Chronicles of Narnia"," Children's Literature",900,"yes"," C.S. Lewis", " Geoffrey Bles"),
 ("isbn1004","The Catcher in the Rye"," Coming-of-Age Fiction Literary",700,"no"," J.D. Salinger", "Little, Brown and Company"),
 ("isbn1005","To Kill a Mockingbird"," Classic Fiction Social Justice",1000,"yes"," Harper Lee","J.B. Lippincott & Co."),
 ("isbn1006","The Great Gatsby" ,"American Literature",600,'yes', "F. Scott Fitzgerald","Charles Scribner's Sons");
 
 insert into customer
values
  ("c1001", "alwin", "mumbai", '2012-8-13'),
  ("c1002", "sangamitra", "delhi", '2007-7-23'),
  ("c1003", "ruhan", "kerala", '2013-4-16'),
  ("c1004", "ashwin", "washington", '2011--2-18'),
  ("c1005", "sanskruti", "germany", '2009-11-23'),
  ("c1006", "rukmini", "maharashtra", '2011-2-12'),
  ("c1007", "asweth", "chennai", '2017-4-16'),
  ("c1008", "ashiq", "jaipur", '2012-11-2'),
  ("c1009", "anvi", "bengal", '2012-6-19'),
  ("c1010", "navdeep kaur", "punjab", '2010-8-13'),
  ("c1011", "apoorva", "dubai", '2012-9-23');
  
  insert into IssueStatus
  values
  (9001,"c1002","To Kill a Mockingbird",'2023-10-23',"isbn1005"),
  (9002,"c1006","The Hunger Games" ,'2015-07-24',"isbn1001"),
  (9003,"c1008","Harry Potter and the Philosopher's Stone",'2011-10-18',"isbn1002"),
  (9004,"c1009","The Chronicles of Narnia",'2012-06-16',"isbn1003"),
  (9005,"c1005","The Great Gatsby",'2014-04-20',"isbn1006");
  
  insert into ReturnStatus
  values
  (001,"c1002","To Kill a Mockingbird",'2023-12-23',"isbn1005"),
  (002,"c1006","The Hunger Games" ,'2015-09-24',"isbn1001"),
  (003,"c1008","Harry Potter and the Philosopher's Stone",'2011-12-18',"isbn1002"),
  (004,"c1009","The Chronicles of Narnia",'2012-09-16',"isbn1003"),
  (005,"c1005","The Great Gatsby",'2014-08-20',"isbn1006");
  
  -- Retrieve the book title, category, and rental price of all available book
select Book_title ,
Category ,
Rental_Price from Books where status="yes";

-- List the employee names and their respective salaries in descending 
-- order of salary.

select Emp_name ,
Salary  from Employee order by Salary desc;

-- Retrieve the book titles and the corresponding customers who have issued those books.

 select Issued_book_name,Customer_name  from IssueStatus join
 Customer on IssueStatus.Issued_cust = Customer.Customer_Id;
 
 -- Display the total count of books in each category
 SELECT Category, count(*) as TotalBooks from Books group by Category;
 
-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position from Employee where Salary>50000;

-- List the customer names who registered before 2022-01-01 and have  not issued any books yet.

select Customer_name from Customer  where  Reg_date<'2022-01-01' and
 Customer_Id NOT IN(select distinct( Issued_cust) FROM  IssueStatus );
 
 
 -- Display the branch numbers and the total count of employees in each branch
 select  Branch_no,count(*) as totalemployees from Employee group by Branch_no;
 
 -- Display the names of customers who have issued books in the month  of June 2023.
 select  Customer_name from  Customer where Customer_id in
 (select Issued_cust  from  IssueStatus where  Issue_date between '2023-06-01' and '2023-06-30');
 
 --  Retrieve book_title from book table containing history.
 select Book_title from Books where Book_title like '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_no,count(*) as totalemployees from Employee group by Branch_no having totalemployees>5;

 

 
 
 



  
  
  
  
  


 
 

 
