USE ASM2
GO

CREATE NONCLUSTERED INDEX article_title_idx 
ON [dbo].[article]
(
    [title]
)
GO

CREATE NONCLUSTERED INDEX article_subDate_idx
ON [dbo].[article]
(
    [submitDate]
)
GO

CREATE NONCLUSTERED INDEX article_pubDate_idx
ON [dbo].[article]
(
    [publishDate]
)
GO

CREATE NONCLUSTERED INDEX article_ath_edt_idx
ON [dbo].[article]
(
    [author], [editorID]
)
GO