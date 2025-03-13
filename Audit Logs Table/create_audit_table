CREATE TABLE AuditLogs (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(128),
    Operation NVARCHAR(10),
    KeyValue NVARCHAR(1000),
    OldData NVARCHAR(MAX),
    NewData NVARCHAR(MAX),
    ChangedBy NVARCHAR(128),
    ChangedOn DATETIME DEFAULT GETDATE()
);
