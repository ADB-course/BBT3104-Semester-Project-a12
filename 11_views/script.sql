-- Write your SQL code here
1)Client Overview View
This view combines data from the Client, Individual_Client, and Corporate_Client tables to provide a complete overview of each client, including their basic information and subtype details.
DELIMITER$$

CREATE VIEW Client_Overview AS
SELECT 
    c.Client_ID,
    c.Name,
    c.Contact_Details,
    c.Client_Type,
    i.Date_of_Birth,
    i.Gender,
    co.Company_Name,
    co.Contact_Person
FROM 
    Client c
LEFT JOIN 
    Individual_Client i ON c.Client_ID = i.Client_ID
LEFT JOIN 
    Corporate_Client co ON c.Client_ID = co.Client_ID;

DELIMITER ;
2)Paid Invoices View
This view shows all paid invoices along with the client information and the date of payment.
DELIMITER $$

CREATE VIEW Paid_Invoices AS
SELECT 
    i.Invoice_ID,
    c.Name AS Client_Name,
    i.Amount,
    i.Due_Date,
    i.Invoice_Date,
    i.Status
FROM 
    Invoice i
JOIN 
    Client c ON i.Client_ID = c.Client_ID
WHERE 
    i.Status = 'Paid';

DELIMITER ;






