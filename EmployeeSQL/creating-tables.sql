-- Creating Tables
create table departments(
	dept_no varchar(30) not null,
	dept_name varchar(30) not null,
	primary key(dept_no)
);

create table titles(
	title_id varchar(5) not null,
	title varchar(30),
	primary key	(title_id)
);

create table salaries(
	emp_no int not null,
	salary int,
	primary key (emp_no)
);

create table employees(
	emp_no int not null,
	emp_title varchar(30) not null,
	birth_date date,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date date,
	primary key (emp_no),
	foreign key (emp_no) references salaries(emp_no),
	foreign key (emp_title) references titles(title_id)
);
create table dept_emp(
	emp_no int not null,
	dept_no varchar(30) not null,
	primary key (emp_no, dept_no),
	foreign key (dept_no) references departments(dept_no)
);

create table dept_manager(
	dept_no varchar(30) not null,
	emp_no int not null,
	primary key (dept_no, emp_no)
);
