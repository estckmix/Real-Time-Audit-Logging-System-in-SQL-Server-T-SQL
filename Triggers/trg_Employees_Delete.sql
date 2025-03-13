--Delete Trigger
CREATE TRIGGER trg_Employees_Delete
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditLogs (TableName, Operation, KeyValue, OldData, ChangedBy)
    SELECT
        'Employees',
        'DELETE',
        CONCAT('EmployeeID=', CAST(d.EmployeeID AS NVARCHAR(100))),
        (SELECT * FROM DELETED d FOR JSON PATH),
        SUSER_SNAME()
    FROM DELETED d;
END;
