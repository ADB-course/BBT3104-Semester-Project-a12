-- Write your SQL code here
1)Get Client's Full Name (Including Subtype Info)
This function returns a client's full name, including information from either the Individual_Client or Corporate_Client table, depending on the client type.
DELIMITER $$

CREATE FUNCTION Get_Client_Full_Name(p_Client_ID INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(255);
    DECLARE client_type VARCHAR(50);

    SELECT Client_Type INTO client_type
    FROM Client
    WHERE Client_ID = p_Client_ID;

    IF client_type = 'Individual' THEN
        SELECT CONCAT(Name, ', ', Date_of_Birth, ', ', Gender) INTO full_name
        FROM Individual_Client
        WHERE Client_ID = p_Client_ID;
    ELSEIF client_type = 'Corporate' THEN
        SELECT CONCAT(Name, ' - ', Company_Name) INTO full_name
        FROM Corporate_Client
        WHERE Client_ID = p_Cli

2)Get Client's Total Invoiced Amount
This function calculates the total amount invoiced to a client
DELIMITER $$

CREATE FUNCTION Get_Total_Invoiced_Amount(p_Client_ID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_invoiced DECIMAL(10, 2);

    SELECT IFNULL(SUM(Amount), 0) INTO total_invoiced
    FROM Invoice
    WHERE Client_ID = p_Client_ID;

    RETURN total_invoiced;
END$$

DELIMITER ;





