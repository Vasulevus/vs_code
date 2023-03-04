--Вставляння одного рядка

USE [Sample];

IF(
        SELECT COUNT(*)
        FROM employee
    ) > 3
    BEGIN
    PRINT 'HI'
    SELECT COUNT(*) AS counts,
    'hi' AS Wow
        FROM employee
    END
    ELSE PRINT 'NO'


