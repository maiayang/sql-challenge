-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" int   NOT NULL,
    "dept_name" VARCHAR(45)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_employees" (
    "emp_no" int   NOT NULL,
    "dept_no" int   NOT NULL,
    CONSTRAINT "pk_dept_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "managers" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_managers" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employee_list" (
    "emp_no" int   NOT NULL,
    "emp_title_id" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_Name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(30)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee_list" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employee_salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_employee_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "managers" ADD CONSTRAINT "fk_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employee_list" ADD CONSTRAINT "fk_employee_list_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

