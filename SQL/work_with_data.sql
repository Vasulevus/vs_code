--Вставляння одного рядка

USE [Sample];

IF(
        SELECT COUNT(*)
        FROM employee
    ) > 3
    PRINT 'HI'
    ELSE PRINT 'NO'


