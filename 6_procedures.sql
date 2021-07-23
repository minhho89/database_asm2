-- Add data to journalist_roles table automatically
/**
    REPORTERS have the roles of: 
        write rl001, submit rl002 , modify rl005
    EDITORS have the roles of:
        reporter role set + review rl003, publish rl004, suspend rl006
**/
IF EXISTS (SELECT *
FROM sys.objects
WHERE NAME = 'prc_fill_tbl_journalist_rols')
DROP PROCEDURE prc_fill_tbl_journalist_rols
GO

CREATE PROCEDURE prc_fill_tbl_journalist_rols
AS
DECLARE @max INT
DECLARE @count INT
DECLARE @journalistID INT
DECLARE @roleID NVARCHAR(5)

SET @max = (SELECT COUNT(*)
FROM journalist)
SET @count = 1
BEGIN
    WHILE @count <= @max
    BEGIN
        SELECT @journalistID = journalistID
        FROM (SELECT journalistID,
                ROW_NUMBER() OVER(ORDER BY journalistID) AS rn
            FROM journalist) as subQuery
        WHERE rn = @count
        GROUP BY journalistID, rn

        IF (SELECT titleID
        FROM journalist
        WHERE journalistID = @journalistID) = 't01' -- reporter
            BEGIN
            INSERT INTO journalist_roles
                (journalistID, roleID)
            VALUES
                (@journalistID, 'rl001'),
                (@journalistID, 'rl002'),
                (@journalistID, 'rl005')
        END
        ELSE -- editor
            BEGIN
            INSERT INTO journalist_roles
                (journalistID, roleID)
            VALUES
                (@journalistID, 'rl001'),
                (@journalistID, 'rl002'),
                (@journalistID, 'rl003'),
                (@journalistID, 'rl004'),
                (@journalistID, 'rl005'),
                (@journalistID, 'rl006')
        END
        SET @count = @count + 1
    END
END
GO


EXEC prc_fill_tbl_journalist_rols
-- CONFIRM
SELECT *
FROM journalist_roles
