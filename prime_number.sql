-- Declare main and helper variables
DECLARE @I INT = 2;
DECLARE @PRIME BIT;
DECLARE @OUTPUT TABLE (NUM INT);

-- Outer loop: iterate over numbers up to 100
WHILE @I <= 100
BEGIN
    DECLARE @J INT = @I - 1;
    SET @PRIME = 1;

    -- Inner loop: check divisibility
    WHILE @J > 1
    BEGIN
        IF @I % @J = 0
        BEGIN
            SET @PRIME = 0;
            BREAK;
        END
        SET @J = @J - 1;
    END

    -- If prime, insert into table
    IF @PRIME = 1
    BEGIN
        INSERT INTO @OUTPUT VALUES (@I);
    END

    SET @I = @I + 1;
END

-- Display all prime numbers
SELECT * FROM @OUTPUT;
