-- Drop tables and relationships if they exists already
DROP TABLE IF EXISTS title CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- Create tables
CREATE TABLE title(
	title_id VARCHAR(50) NOT NULL PRIMARY KEY,
	title VARCHAR(100) NOT NULL			  
				  );
				  
CREATE TABLE employees(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
				);
					 
CREATE TABLE departments(
	dept_no	VARCHAR(50) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL);
	  
CREATE TABLE dept_manager(
	dept_no VARCHAR(50) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),				  
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no,emp_no));
				  
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(50) NOT NULL,				  
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no,dept_no));			  
				  				  
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	salary INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)		  
				  );	
				  
-- Load the tables data from csv files manually

-- Check the data imported
SELECT * FROM title;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;