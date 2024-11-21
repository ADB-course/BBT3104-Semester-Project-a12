 -- Write your SQL code here
 1)Client Table 
This table includes a CHECK constraint to ensure that the Client_Type is either 'Individual' or 'Corporate'.
CREATE TABLE Client (
    Client_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact_Details VARCHAR(255),
    Client_Type VARCHAR(50) NOT NULL,
    CHECK (Client_Type IN ('Individual', 'Corporate'))
) ENGINE=InnoDB;

2)Individual_Client Table 
In this table, the Gender column is restricted to valid values ('Male'or 'Female') using a CHECK constraint.
CREATE TABLE Individual_Client (
    Client_ID INT PRIMARY KEY,
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    CHECK (Gender IN ('Male', 'Female')),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE
) ENGINE=InnoDB;

3)Corporate_Client Table 
In this table, we use a CHECK constraint to ensure that the Company_Name is not empty.
CREATE TABLE Corporate_Client (
    Client_ID INT PRIMARY KEY,
    Company_Name VARCHAR(255) NOT NULL,
    Contact_Person VARCHAR(255),
    CHECK (LENGTH(Company_Name) > 0),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE
) ENGINE=InnoDB;

4)Invoice Table
The Invoice table includes two CHECK constraints: one for the Amount column (ensuring it is positive) and another for the Due_Date column (ensuring it is after the Invoice_Date).
CREATE TABLE Invoice (
    Invoice_ID INT PRIMARY KEY,
    Client_ID INT NOT NULL,
    Invoice_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Due_Date DATE NOT NULL,
    Status ENUM('Paid', 'Unpaid', 'Overdue') NOT NULL,
    CHECK (Amount > 0),
    CHECK (Due_Date > Invoice_Date),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE,
    INDEX (Client_ID),
    INDEX (Invoice_Date)
) ENGINE=InnoDB;
5)Department Table
The Department table includes a CHECK constraint to ensure the Department_Name is not empty.
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(255) NOT NULL,
    Contact_Number VARCHAR(15),
    Manager VARCHAR(255),
    CHECK (LENGTH(Department_Name) > 0),
      INDEX (Department_Name)
) ENGINE=InnoDB;
6)Client_Department Table
This table ensures that both the Client_ID and Department_ID are positive integers through a CHECK constraint. It also uses foreign keys to link to the Client and Department tables.
CREATE TABLE Client_Department (
    Client_ID INT NOT NULL,
    Department_ID INT NOT NULL,
    PRIMARY KEY (Client_ID, Department_ID),
    CHECK (Client_ID > 0 AND Department_ID > 0),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID) ON DELETE CASCADE,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
) ENGINE=InnoDB;
















