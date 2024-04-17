## Hospital Management Database

This document describes the schema for a hospital management database. The database is designed to store information about patients, doctors, appointments, inventory, and billing.

### Tables

The database consists of the following tables:

* **inventory**
* **doctor**
* **patient**
* **appointment**
* **bill**

### Table Descriptions

#### 1. inventory

| Column Name          | Data Type   | Description                                          | Not Null | Primary Key | Auto Increment |
|----------------------|-------------|------------------------------------------------------|----------|--------------|----------------|
| inventory_id         | INT         | Unique identifier for inventory item (auto-increment)| YES      | YES          | YES            |
| item_name            | VARCHAR(255)| Name of the inventory item                           | YES      |              |                |
| quantity             | INT         | Current quantity of the item in stock                | YES      |              |                |
| exp_date             | DATE        | Expiration date of the inventory item                | YES      |              |                |

#### 2. doctor

| Column Name     | Data Type   | Description                                     | Not Null | Primary Key | Auto Increment |
|-----------------|-------------|-------------------------------------------------|----------|--------------|----------------|
| doctor_id       | INT         | Unique identifier for doctor (auto-increment)   | YES      | YES          | YES            |
| first_name      | VARCHAR(255)| Doctor's first name                             | YES      |              |                |
| last_name       | VARCHAR(255)| Doctor's last name                              | YES      |              |                |
| specialization | VARCHAR(255)| Doctor's area of specialization                 | YES      |              |                |

#### 3. patient

| Column Name     | Data Type   | Description                                              | Not Null | Primary Key | Auto Increment |
|-----------------|-------------|----------------------------------------------------------|----------|--------------|----------------|
| patient_id      | INT         | Unique identifier for patient (auto-increment)            | YES      | YES          | YES            |
| first_name      | VARCHAR(255)| Patient's first name                                     | YES      |              |                |
| last_name       | VARCHAR(255)| Patient's last name                                      | YES      |              |                |
| date_of_birth   | DATE        | Patient's date of birth                                  | YES      |              |                |
| gender          | ENUM        | Patient's gender ('Male', 'Female', 'Other')             | YES      |              |                |
| address         | VARCHAR(255)| Patient's address                                        | YES      |              |                |
| phone_number    | VARCHAR(20) | Patient's phone number (adjusted for international formats) | YES     |              |                |

#### 4. appointment

| Column Name          | Data Type   | Description                                                   | Not Null | Primary Key | Auto Increment |
|----------------------|-------------|---------------------------------------------------------------|----------|--------------|----------------|
| appointment_id       | INT         | Unique identifier for appointment (auto-increment)             | YES      | YES          | YES            |
| patient_id           | INT         | Foreign key referencing patient table                          | YES      |              |                |
| doctor_id            | INT         | Foreign key referencing doctor table                           | YES      |              |                |
| appointment_deadline | DATETIME    | Date and time of the appointment                               | YES      |              |                |
| status               | ENUM        | Appointment status ('Scheduled', 'Pending', 'Completed', 'Cancelled') | YES  |              |                |

#### 5. bill

| Column Name     | Data Type   | Description                                                   | Not Null | Primary Key | Auto Increment |
|-----------------|-------------|---------------------------------------------------------------|----------|--------------|----------------|
| bill_id         | INT         | Unique identifier for bill (auto-increment)                   | YES      | YES          | YES            |
| patient_id      | INT         | Foreign key referencing patient table                         | YES      |              |                |
| appointment_id  | INT         | Foreign key referencing appointment table                     |          |              |                |
| amount          | DECIMAL     | Amount to be paid                                             | YES      |              |                |
| billing_date    | DATE        | Date of the bill generation                                   | YES      |              |                |
| payment_status  | ENUM        | Payment status ('Paid', 'Unpaid')                             | YES      |              |                |
| payment_method  | ENUM        | Method of payment ('Cash', 'Credit Card', 'Debit Card', 'Online Payment') | YES |              |                |

### Foreign Key Constraints

- The **appointment** table has foreign key constraints:
  - **patient_id** referencing **patient(patient_id)**
  - **doctor_id** referencing **doctor(doctor_id)** with cascade delete behavior.

### Note

- Adjustments to the schema or additional features may be required based on specific hospital requirements.
- Ensure proper data types and lengths are used for each column to maintain data integrity.
