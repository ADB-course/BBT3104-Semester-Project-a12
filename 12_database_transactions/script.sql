-- Write your SQL code here
1)Transaction for Inserting a New Client and Invoice
DELIMITER $$

START TRANSACTION;

INSERT INTO Client (Name, Contact_Details, Client_Type) 
VALUES ('John Doe', 'johndoe@email.com', 'Individual');

INSERT INTO Individual_Client (Client_ID, Date_of_Birth, Gender)
VALUES (LAST_INSERT_ID(), '1990-05-15', 'Male');

INSERT INTO Invoice (Client_ID, Invoice_Date, Amount, Due_Date, Status)
VALUES (LAST_INSERT_ID(), CURDATE(), 500.00, DATE_ADD(CURDATE(), INTERVAL 30 DAY), 'Unpaid');

COMMIT;

DELIMITER ;

2)Transaction for Deleting a Client and Related Records
DELIMITER $$

START TRANSACTION;

DELETE FROM Invoice WHERE Client_ID = 1;

DELETE FROM Individual_Client WHERE Client_ID = 1;

DELETE FROM Client WHERE Client_ID = 1;

COMMIT;

DELIMITER ;





