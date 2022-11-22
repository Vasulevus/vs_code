USE Learning;
--SELECT * FROM dbo.project_dept;
--віконна функція
/*
SELECT
	[dept_name]
 --   ,[budget]
    ,SUM(emp_cnt) OVER (PARTITION BY dept_name) AS EMP
    ,AVG(budget) OVER (PARTITION BY dept_name) AS AVBUD
FROM
    [dbo].[project_dept]
WHERE dept_name IN ('Accounting','Research');
*/
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
-- по групам
/*
SELECT 
    [dept_name]
    ,SUM(emp_cnt) AS EMP
    ,AVG(budget) AS AVBUD
FROM dbo.project_dept
WHERE dept_name IN ('Accounting','Research')
GROUP BY dept_name
GO
*/
/*
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT 
    [dept_name]
    ,budget
    ,emp_cnt
    ,SUM(budget) OVER (PARTITION BY dept_name ORDER by budget) AS sum_dept
FROM dbo.project_dept
--WHERE dept_name = 'Marketing'
GO


SELECT 
    [dept_name]
    ,budget
    ,emp_cnt
    ,SUM(budget) OVER (
        PARTITION BY 
            dept_name 
        ORDER by 
            budget
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS sum_dept
FROM dbo.project_dept
--WHERE dept_name = 'Marketing'
GO



CREATE SEQUENCE dbo.Sequence1
AS INT
START WITH 1 INCREMENT BY 1
MINVALUE 1 MAXVALUE 256
CYCLE;


SELECT
    NEXT VALUE FOR Sequence1 OVER(ORDER BY dept_name), budget, dept_name
FROM
(SELECT 
    dept_name
    ,budget
FROM project_dept
ORDER BY budget, dept_name
OFFSET 1 ROW FETCH FIRST 5 ROWS ONLY) AS D


SELECT 
    dept_name
    ,emp_cnt
    ,SUM(budget) AS sum_of_budgets
FROM project_dept
WHERE dept_name IN ('Accounting','Research')
GROUP BY dept_name, emp_cnt

*/


SELECT 
    dept_name
    ,emp_cnt
    ,SUM(budget) AS sum_of_budgets
FROM project_dept
WHERE dept_name IN ('Accounting','Research')
GROUP BY CUBE (dept_name, emp_cnt)



SELECT 
    dept_name
    ,emp_cnt
    ,SUM(budget) AS sum_of_budgets
    ,GROUPING(emp_cnt) AS gr
FROM project_dept
WHERE dept_name IN ('Accounting','Marketing')
GROUP BY ROLLUP (dept_name, emp_cnt)