USE ASM2
GO

-- article content Wordcount 
IF EXISTS (SELECT *
FROM sys.objects
WHERE NAME = 'fn_wordCount')
DROP FUNCTION dbo.fn_wordCount
GO

CREATE FUNCTION fn_wordCount (@content NVARCHAR(max) )   
RETURNS INT
BEGIN
    DECLARE @index          INT
    DECLARE @wordCount      INT
    DECLARE @currentChar    CHAR(1)
    DECLARE @prevChar       CHAR(1)

    SET @index = 1
    SET @wordCount = 0

    WHILE (@index < len(@content))
    BEGIN
        SET @currentChar = SUBSTRING(@content, @index, 1)
        SET @prevChar = CASE WHEN @index = 1 THEN ' '
                             ELSE SUBSTRING(@content, @index - 1, 1)
                        END
        IF (@prevChar = ' ' AND @currentChar != '')
            BEGIN
            SET @wordCount = @wordCount + 1
        END
        SET @index = @index + 1
    END
    RETURN @wordCount
END
GO

-- Test
-- DECLARE @myValue INT
-- DECLARE @content NVARCHAR(MAX)
-- SET @content = (SELECT content
-- FROM article
-- WHERE articleID = 6)
-- EXEC @myValue = dbo.fn_wordCount @content
-- SELECT @myValue