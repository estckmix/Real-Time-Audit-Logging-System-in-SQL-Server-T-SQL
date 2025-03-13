--Update Trigger
CREATE TRIGGER trg_Employees_Update
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLogs (TableName, Operation, KeyValue, OldData, NewData, ChangedBy)
    SELECT
        'Employees',
        'UPDATE',
        CONCAT('EmployeeID=', CAST(i.EmployeeID AS NVARCHAR(100))),
        (SELECT * FROM DELETED d FOR JSON PATH),
        (SELECT * FROM INSERTED i FOR JSON PATH),
        SUSER_SNAME()
    FROM INSERTED i
    INNER JOIN DELETED d ON i.EmployeeID = d.EmployeeID;
END;
