-- Write your SQL code here
CREATE TRIGGER UpdateInvoiceStatusToPaid
AFTER UPDATE ON Invoice
FOR EACH ROW
BEGIN
    IF NEW.Amount = 0 THEN
        UPDATE Invoice
        SET Status = 'Paid'
        WHERE Invoice_ID = NEW.Invoice_ID;
    END IF;
END;
CREATE TRIGGER ValidateClientType
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
    IF NEW.Client_Type NOT IN ('Individual', 'Corporate') THEN
   SET MESSAGE_TEXT = 'Invalid Client_Type. It must be either "Individual" or "Corporate".';
    END IF;
END;
CREATE TRIGGER AssignDefaultDepartment
AFTER INSERT ON Client
FOR EACH ROW
BEGIN
    INSERT INTO Client_Department (Client_ID, Department_ID)
    VALUES (NEW.Client_ID, 1);
END;
