CREATE TRIGGER trg_Employees_Insert
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLogs (TableName, Operation, KeyValue, NewData, ChangedBy)
    SELECT
        'Employees',
        'INSERT',
        CONCAT('EmployeeID=', CAST(i.EmployeeID AS NVARCHAR(100))),
        (SELECT * FROM INSERTED i FOR JSON PATH),
        SUSER_SNAME()
    FROM INSERTED i;
END;
