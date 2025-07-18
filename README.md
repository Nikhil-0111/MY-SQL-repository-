# 🧑‍💼 Employee Data Analysis Project – SQL

This project showcases advanced SQL skills using a realistic employee dataset. It simulates HR analytics and project-level tasks for a data science team within an organization.

---

## 📂 Project Overview

This project involves creating and managing a MySQL database named `employee` and performing a variety of analytical tasks using SQL:

- 📋 Importing and organizing employee and project data
- 🔍 Writing advanced SQL queries (filters, joins, nested queries)
- 📊 Salary & performance analysis
- ⚙️ Creating views, stored procedures, and user-defined functions
- 📈 Optimizing performance with indexes and EXPLAIN plans

---

## 🔧 Tools & Technologies

- 🛠️ **MySQL**
- 💾 CSV Data Import (`emp_record_table.csv`, `proj_table.csv`, `data_science_team.csv`)
- 💻 SQL Scripting

---

## 🗂️ Dataset Tables

1. **emp_record_table** – Main employee data including roles, salaries, departments, etc.
2. **proj_table** – Project assignments.
3. **data_science_team** – Employee data specific to the data science department.

---

## 🧠 Key Concepts Demonstrated

| Feature | Description |
|--------|-------------|
| `GROUP BY`, `HAVING`, `ROLLUP` | Salary & rating aggregations |
| `JOIN`, `UNION`, `CASE`, `IFNULL` | Combined filters & logic |
| `RANK()`, `DENSE_RANK()` | Experience-based ranking |
| `Views` | Salary filters by threshold |
| `Stored Procedures` | Reusable query blocks |
| `Functions` | Role mapping by experience |
| `Indexes & EXPLAIN` | Query performance tuning |

---

## 📌 Highlights

### ✔️ Stored Function – Job Role Standardization
```sql
CREATE FUNCTION jobprofile_by_exp(exp INT)
RETURNS VARCHAR(150)

Classifies employees as Junior, Associate, Senior, Lead, or Manager based on years of experience.

✔️ Stored Procedure – Employees with >3 Years Experience
sql
Copy
Edit
CREATE PROCEDURE exp_above_3()
Displays experienced employee details using reusable logic.

✔️ View – High Salary Employees
sql
Copy
Edit
CREATE VIEW emp_salary_above_6000 AS ...
Filters employees with salaries greater than ₹6000 for further analytics.

✔️ Indexing
sql
Copy
Edit
CREATE INDEX query_2 ON emp_record_table(first_name);
Added index on first_name and verified usage with EXPLAIN.

📊 Sample Query Outputs
🔹 Average salary by country and continent

🔹 Department-wise ratings with max score

🔹 Bonus calculation based on rating and salary

🔹 List of managers with report counts

🚀 How to Run
Import all 3 CSV files into MySQL under the employee database.

Run the SQL script: employee_project.sql (available in repo)

View or modify stored functions, procedures, and views.

🧾 Author
Nikhil
BSc Physical Science | SQL, Python, Excel | TrustTrade Founder

If you liked this project or have feedback, feel free to star ⭐ the repo or connect on LinkedIn: 
https://www.linkedin.com/in/nikhil-kumar-667135375/!

📁 File Structure
bash
Copy
Edit
employee-sql-project/
│
├── employee_project.sql         # Main SQL script
├── README.md                    # Project overview and explanation
├── emp_record_table.csv         # Employee records
├── proj_table.csv               # Project table
└── data_science_team.csv        # Data science employee data
✅ What I Learned
Writing real-world SQL queries for HR analytics

Building views, stored functions & procedures

Performance tuning with indexes

Business insights using raw data

## ⚠️ Note on Data Files

The original `.csv` files (`emp_record_table.csv`, `proj_table.csv`, `data_science_team.csv`) have **not been uploaded** due to privacy and confidentiality.

You can recreate similar datasets or modify the queries to run them on your own sample data.


> You can refer to the SQL script (`employee_project.sql`) to understand the expected table structures and create mock data accordingly.




