-- Write your SQL code here
1)Insert New Client
This stored procedure inserts a new client (either individual or corporate) into the Client table and its respective subtype table (Individual_Client or Corporate_Client).
DELIMITER $$

CREATE PROCEDURE Insert_Client(
    IN p_Name VARCHAR(255),
    IN p_Contact_Details VARCHAR(255),
    IN p_Client_Type VARCHAR(50),
    IN p_Date_of_Birth DATE,
    IN p_Gender VARCHAR(10),
    IN p_Company_Name VARCHAR(255),
    IN p_Contact_Person VARCHAR(255)
)
BEGIN
    DECLARE new_client_id INT;

    INSERT INTO Client (Name, Contact_Details, Client_Type)
    VALUES (p_Name, p_Contact_Details, p_Client_Type);

    SET new_client_id = LAST_INSERT_ID();

    IF p_Client_Type = 'Individual' THEN
        INSERT INTO Individual_Client (Client_ID, Date_of_Birth, Gender)
        VALUES (new_client_id, p_Date_of_Birth, p_Gender);
    ELSEIF p_Client_Type = 'Corporate' THEN
        INSERT INTO Corporate_Client (Client_ID, Company_Name, Contact_Person)
        VALUES (new_client_id, p_Company_Name, p_Contact_Person);
    END IF;
END$$

DELIMITER ;
2)Get Client Information
This stored procedure retrieves the full information of a client, including their subtype details (i.e., individual or corporate details).
DELIMITER $$

CREATE PROCEDURE Get_Client_Info(
    IN p_Client_ID INT
)
BEGIN
    DECLARE client_name VARCHAR(255);
    DECLARE client_type VARCHAR(50);
    DECLARE client_contact_details VARCHAR(255);
    DECLARE individual_date_of_birth DATE;
    DECLARE individual_gender VARCHAR(10);
    DECLARE corporate_company_name VARCHAR(255);
    DECLARE corporate_contact_person VARCHAR(255);

    SELECT Name, Contact_Details, Client_Type INTO client_name, client_contact_details, client_type
    FROM Client
    WHERE Client_ID = p_Client_ID;

    IF client_type = 'Individual' THEN
        SELECT Date_of_Birth, Gender INTO individual_date_of_birth, individual_gender
        FROM Individual_Client
        WHERE Client_ID = p_Client_ID;
        SELECT client_name, individual_date_of_birth, individual_gender AS Gender;
    ELSEIF client_type = 'Corporate' THEN
        SELECT Company_Name, Contact_Person INTO corporate_company_name, corporate_contact_person
        FROM Corporate_Client
        WHERE Client_ID = p_Client_ID;
        SELECT client_name, corporate_company_name, corporate_contact_person;
    END IF;
END$$

DELIMITER ;







