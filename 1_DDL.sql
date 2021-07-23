USE ASM2
GO

CREATE TABLE journalist
(
    journalistID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    email NVARCHAR(50),
    phone NVARCHAR(10),
    titleID NVARCHAR(3),
    editorID INT
)

CREATE TABLE title
(
    titleID NVARCHAR(3) PRIMARY KEY,
    name NVARCHAR(10) NOT NULL
)

CREATE TABLE role
(
    roleID NVARCHAR(5) NOT NULL PRIMARY KEY,
    name NVARCHAR(10) NOT NULL,
    details NVARCHAR(1000)
)

CREATE TABLE journalist_roles
(
    journalistID INT NOT NULL,
    roleID NVARCHAR(5) NOT NULL,
    PRIMARY KEY(journalistID, roleID)
)

CREATE TABLE article
(
    articleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    author INT,
    title nvarchar(500),
    summary nvarchar(1000),
    content nvarchar(max),
    submitDate dateTime,
    editorID INT,
    status NVARCHAR(10),
    publishDate dateTime,
    wordCount int
)

CREATE TABLE status
(
    statusID NVARCHAR(10) NOT NULL PRIMARY KEY,
    details NVARCHAR(1000)
)

CREATE TABLE comment
(
    commentID INT IDENTITY(1,1) PRIMARY KEY,
    articleID INT,
    regReaderID INT,
    comment NVARCHAR(1000),
    TIMESTAMP DATETIME,
)

CREATE TABLE registeredReader
(
    regReaderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name NVARCHAR(30),
    phone NVARCHAR(10),
    email NVARCHAR(50)
)


CREATE TABLE category
(
    catID NVARCHAR(10) NOT NULL PRIMARY KEY,
    section NVARCHAR(100),
)

CREATE TABLE article_categories
(
    articleID INT NOT NULL,
    categoryID NVARCHAR(10) NOT NULL,
    PRIMARY KEY (articleID, categoryID)
)

