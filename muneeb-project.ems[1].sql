DROP SCHEMA

IF EXISTS EMS;
	CREATE SCHEMA EMS COLLATE = utf8_general_ci;
USE EMS;

CREATE TABLE Employee (
  emp_id INT PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  gender ENUM('Male', 'Female'),
  age INT,
  contact_address VARCHAR(255),
  emp_email VARCHAR(255) NOT NULL,
  emp_pass VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
  admin_id INT PRIMARY KEY,
  instructor_fname VARCHAR(255),
  instructor_lname VARCHAR(255),
  instructor_gender ENUM('Male', 'Female'),
  instructor_age INT,
  contact_address VARCHAR(255),
  admin_email VARCHAR(255) NOT NULL,
  admin_pass VARCHAR(255) NOT NULL
);


CREATE TABLE job_department (
  job_id INT PRIMARY KEY,
  emp_id INT,
  job_dept VARCHAR(30),
  job_name VARCHAR(30),
  job_description VARCHAR(255),
  salary_range VARCHAR(30),
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE salary (
  salary_id INT PRIMARY KEY,
  emp_id INT,
  amount FLOAT(10, 2),
  annual FLOAT(10, 2),
  bonus FLOAT(10, 2),
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Qualification (
  qual_id INT PRIMARY KEY,
  emp_id INT,
  position VARCHAR(30),
  requirements VARCHAR(255),
  date_in DATE,
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE leave_request (
  leave_id INT PRIMARY KEY,
  emp_id INT,
  start_date DATE,
  end_date DATE,
  leave_type VARCHAR(30),
  reason VARCHAR(255),
  status VARCHAR(20),
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE payroll (
  payroll_id INT PRIMARY KEY,
  emp_id INT,
  job_id INT,
  salary_id INT,
  leave_id INT,
  date DATE,
  report VARCHAR(20),
  total_amount FLOAT(10, 2),
  FOREIGN KEY (job_id) REFERENCES job_department(job_id),
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
  FOREIGN KEY (salary_id) REFERENCES salary(salary_id),
  FOREIGN KEY (leave_id) REFERENCES leave_request(leave_id)
);


CREATE TABLE EmployeeBackup LIKE Employee;
 
 /* *************************************************************** 
**************************INSERTING DATA************************
**************************************************************** */


INSERT INTO Employee (emp_id, fname, lname, gender, age, contact_address, emp_email, emp_pass)
VALUES (1, 'John', 'Doe', 'Male', 30, '123 Main St', 'john.doe@example.com', 'password123');

INSERT INTO Employee (emp_id, fname, lname, gender, age, contact_address, emp_email, emp_pass)
VALUES (3, 'wali', 'hussain', 'Male', 20, '333 Main St', 'wali.doe@example.com', 'password1563');

INSERT INTO Users (admin_id, instructor_fname, instructor_lname, instructor_gender, instructor_age, contact_address, admin_email, admin_pass)
VALUES (1, 'Jane', 'Smith', 'Female', 35, '456 Park Ave', 'jane.smith@example.com', 'password456');

INSERT INTO job_department (job_id, job_dept, job_name, job_description, salary_range)
VALUES (1, 'IT', 'Software Engineer', 'Develops software applications', '50,000 - 100,000');

INSERT INTO salary (salary_id, emp_id, amount, annual, bonus)
VALUES (1, 1, 60000.00, 720000.00, 5000.00);

INSERT INTO Qualification (qual_id, emp_id, position, requirements, date_in) 
VALUES (1, 1, 'Software Engineer', 'Bachelors degree in Computer Science', '2022-01-01');

INSERT INTO leave_request (leave_id, emp_id, start_date, end_date, leave_type, reason, status)
VALUES (1, 1, '2023-06-01', '2023-06-05', 'Vacation', 'Taking a short break', 'approved');

INSERT INTO payroll (payroll_id, emp_id, job_id, salary_id, leave_id, date, report, total_amount)
VALUES (1, 1, 1, 1, 1, '2023-06-30', 'Monthly report', 5000.00);

