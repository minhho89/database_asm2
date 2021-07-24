USE ASM2
 GO
-- Turn recursive triggers OFF in the database. 
ALTER DATABASE ASM2    
      SET RECURSIVE_TRIGGERS OFF 
GO

-- Update content word count at table article
-- using fn_wordCount
IF EXISTS (SELECT *
FROM sys.objects
WHERE name = 'trg_article_wordCount')
    DROP TRIGGER trg_article_wordCount
GO

CREATE TRIGGER trg_article_wordCount
    ON article
    AFTER INSERT AS
    SET NOCOUNT ON 
    BEGIN

    UPDATE article
        SET wordCount = (
            SELECT dbo.fn_wordCount(content)
    FROM inserted
    WHERE inserted.articleID = article.articleID
        )
        FROM article, inserted
        WHERE inserted.articleID = article.articleID
END
GO

-- Update editor for a reporter in article
IF EXISTS(SELECT *
FROM sys.objects
WHERE name = 'trg_article_editor_update')
    DROP TRIGGER trg_article_editor_update
GO

CREATE TRIGGER trg_article_editor_update
    ON article
    AFTER INSERT AS
    SET NOCOUNT ON 
    BEGIN
    UPDATE article
        SET editorID = (
            SELECT j.editorID
    FROM inserted i JOIN journalist j
        ON i.author = j.journalistID
    WHERE i.articleID = inserted.articleID
        )
        FROM article, inserted 
        WHERE article.articleID = inserted.articleID
END
GO

