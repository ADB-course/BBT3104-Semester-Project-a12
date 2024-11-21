-- Write your SQL code here
1)Client Table 
CREATE TABLE Client (
    Client_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact_Details VARCHAR(255),
    Client_Type ENUM('Individual', 'Corporate') NOT NULL
) ENGINE=InnoDB;

2)Individual_Client Table 
CREATE TABLE Individual_Client (
    Client_ID INT PRIMARY KEY,
    Date_of_Birth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE
) ENGINE=InnoDB;
3)Corporate_Client Table 
CREATE TABLE Corporate_Client (
    Client_ID INT PRIMARY KEY,
    Company_Name VARCHAR(255) NOT NULL,
    Contact_Person VARCHAR(255),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE
) ENGINE=InnoDB;

4)Invoice Table
CREATE TABLE Invoice (
    Invoice_ID INT PRIMARY KEY,
    Client_ID INT NOT NULL,
    Invoice_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Due_Date DATE NOT NULL,
    Status ENUM('Paid', 'Unpaid', 'Overdue') NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE,
    INDEX (Client_ID),
    INDEX (Invoice_Date)
) ENGINE=InnoDB;

5)Department Table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(255) NOT NULL,
    Contact_Number VARCHAR(15),
    Manager VARCHAR(255),
    INDEX (Department_Name)
) ENGINE=InnoDB;

6)Client_Department Table
CREATE TABLE Client_Department (
    Client_ID INT NOT NULL,
    Department_ID INT NOT NULL,
    PRIMARY KEY (Client_ID, Department_ID),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
) ENGINE=InnoDB;







