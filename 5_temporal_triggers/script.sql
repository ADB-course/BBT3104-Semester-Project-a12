-- Write your SQL code here
1)Trigger to Automatically Set Invoice Due Date to 30 Days After Invoice Date
This trigger automatically sets the Due_Date to 30 days after the Invoice_Date when a new invoice is inserted.
Code;
CREATE TRIGGER SetInvoiceDueDate
BEFORE INSERT ON Invoice
FOR EACH ROW
BEGIN
    SET NEW.Due_Date = DATE_ADD(NEW.Invoice_Date, INTERVAL 30 DAY);
END;
2Trigger to Automatically Set Created_At Timestamp on New Client Insert
This trigger automatically sets a Created_At timestamp when a new client is inserted into the Client table.
Code;
CREATE TRIGGER SetCreatedAtTimestamp
BEFORE INSERT ON Client
FOR EACH ROW
BEGIN
    SET NEW.Created_At = NOW();
END;
3)Trigger to Automatically Update Not Paid Status for Invoices Past Due
This trigger automatically updates the status of invoices to Not Paid if the Due_Date is past and the invoice is still Pending.
Code;
CREATE TRIGGER UpdateExpiredInvoiceStatus
AFTER UPDATE ON Invoice
FOR EACH ROW
BEGIN
    IF NEW.Due_Date < CURDATE() AND NEW.Status = 'Pending' THEN
        UPDATE Invoice
        SET Status = 'Not Paid’'
        WHERE Invoice_ID = NEW.Invoice_ID;
    END IF;
END;
