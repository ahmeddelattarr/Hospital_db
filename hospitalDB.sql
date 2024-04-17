CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY AUTO_INCREMENT,
  item_name VARCHAR(255) NOT NULL,
  quantity INT NOT NULL,
  exp_date DATE NOT NULL
);

CREATE TABLE doctor (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  specialization VARCHAR(255) NOT NULL
);

CREATE TABLE patient (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male', 'Female', 'Other') NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL -- Adjusted data type for phone number
);

CREATE TABLE appointment (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  appointment_deadline DATETIME,
  status ENUM('Scheduled', 'Pending', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE
);

CREATE TABLE bill (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    appointment_id INT,
    amount DECIMAL(10 , 2 ) NOT NULL,
    billing_date DATE NOT NULL,
    payment_status ENUM('Paid', 'Unpaid') NOT NULL DEFAULT 'Unpaid',
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Payment') NOT NULL,
    FOREIGN KEY (patient_id)
        REFERENCES patient (patient_id),
    FOREIGN KEY (appointment_id)
        REFERENCES appointment (appointment_id)
        ON DELETE SET NULL
);
