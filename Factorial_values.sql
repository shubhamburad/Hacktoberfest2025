-- Create a temp table to store factorial values
CREATE TABLE #Factorials (
    Number INT,
    Factorial BIGINT
);

-- Declare a counter
DECLARE @counter INT = 1;
DECLARE @result BIGINT = 1;

-- WHILE loop to calculate factorials from 1 to 10
WHILE @counter <= 10
BEGIN
    SET @result = @result * @counter;

    INSERT INTO #Factorials VALUES (@counter, @result);

    SET @counter = @counter + 1;
END;

-- Use a CTE to query and format factorial results
WITH FactorialCTE AS (
    SELECT 
        Number,
        Factorial
    FROM #Factorials
)
SELECT 
    Number,
    Factorial
FROM FactorialCTE
ORDER BY Number;

-- Cleanup
DROP TABLE #Factorials;
