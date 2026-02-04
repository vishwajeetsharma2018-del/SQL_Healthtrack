# SQL_Healthtrack
HealthTrack is a SQL-based healthcare management database designed to manage doctors, patients, appointments, treatments, and billing records. The project demonstrates database design, table relationships, joins, and queries to analyze patient data, doctor assignments, and payment status.
🏥 HealthTrack – Hospital Management Database (SQL Project)
📌 Project Overview

HealthTrack is a Hospital Management Database System designed using SQL.
This project helps manage and organize important hospital operations such as doctors, patients, appointments, treatments, and billing in a structured and efficient way.

The main goal of this project is to demonstrate database design, table relationships, and SQL query implementation for real-world healthcare management.

🛠️ Technologies Used

SQL (MySQL)

Relational Database Design

Foreign Key Relationships

Data Management Queries

📂 Database Structure

The database consists of the following tables:

👨‍⚕️ Doctor Table

Stores information about doctors.

doctor_id (Primary Key)

name

specialization

phone

🧑 Patient Table

Stores patient details.

patient_id (Primary Key)

name

age

gender

phone

📅 Appointment Table

Manages doctor-patient appointment scheduling.

appt_id (Primary Key)

doctor_id (Foreign Key)

patient_id (Foreign Key)

appt_date

appt_time

💊 Treatment Table

Stores treatment and diagnosis details.

treat_id (Primary Key)

patient_id (Foreign Key)

doctor_id (Foreign Key)

diagnosis

prescription

💰 Bill Table

Handles billing and payment tracking.

bill_id (Primary Key)

patient_id (Foreign Key)

amount

payment_status

🔗 Relationships Implemented

One doctor can treat multiple patients

One patient can have multiple appointments

Treatments are linked with both doctors and patients

Billing is linked with patient records

🎯 Project Objectives

Demonstrate normalization and relational database concepts

Implement primary and foreign key constraints

Build real-world healthcare data management system

Practice SQL table creation and relationship handling

🚀 How to Use

Download or clone this repository

Open MySQL / SQL Workbench

Run the Healthtrack.sql file

Database and tables will be created automatically

📚 Learning Outcomes

Database schema design

SQL table creation

Relationship management using foreign keys

Real-world project implementation
