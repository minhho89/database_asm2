USE ASM2
GO

-- 1) === Truy vấn dữ liệu trên một bảng ===
-- Hiển thị danh sách nhà báo và các thông tin liên quan của họ
SELECT *
FROM journalist;

-- 2) === Truy vấn có sử dụng Order by ===
-- Hiển thị tên người đọc đăng ký và số lần comment của họ
-- Sắp xếp theo số lần comment tăng dần
SELECT r.name as 'Registered reader', COUNT(c.comment) as 'Comment time'
FROM comment c, registeredReader r
WHERE  c.regReaderID = r.regReaderID
GROUP BY r.name
ORDER BY 'Comment time';

-- 3) === Truy vấn dữ liệu từ nhiều bảng sử dụng Inner join ===
-- Liệt kê toàn bộ danh sách các phong viên đã từng đăng bài 
SELECT DISTINCT j.*
FROM article c INNER JOIN journalist j
    ON c.author = j.journalistID;

-- 4) === Truy vấn thống kê sử dụng Group by và Having ===
-- Liệt kê id, title, summary các bài báo có lượng comment từ 3 lượt trở lên
-- kèm theo số lượt comment tương ứng
SELECT a.articleID, a.title, a.summary, COUNT(c.commentID) as comment_time
FROM comment c, article a
WHERE c.articleID = a.articleID
GROUP BY a.articleID, a.title, a.summary
HAVING COUNT(c.commentID) >= 3;

-- 5) - Truy vấn sử dụng truy vấn con.
-- Liệt kê các phóng viên có số lượng bài báo nhiều hơn 
-- số lượng bài báo của phóng viên mã số '8'
SELECT j.journalistID, j.name, COUNT(a.articleID) AS article_count
FROM journalist j, article a
WHERE j.journalistID = a.author
GROUP BY j.journalistID, j.name
HAVING COUNT(a.articleID) > (SELECT COUNT(a.articleID)
FROM journalist j, article a
WHERE j.journalistID = a.author
    AND a.articleID = 8);

-- 6) === Truy vấn sử dụng toán tử Like và các so sánh xâu ký tự. ===
-- Liệt kê các nhà báo có số điện thoại đầu số 091
SELECT *
FROM journalist
WHERE phone LIKE '091%';

-- 7) === Truy vấn liên quan tới điều kiện về thời gian ===
-- Liệt kê các bài báo được publish trong năm 2021
SELECT *
FROM article
WHERE publishDate BETWEEN '2021-01-01' AND '2021-12-31';

-- 8) === Truy vấn sử dụng Self join, Outer join. ===
-- Self join
-- Hiển thị tên phóng viên và tên biên tập viên tương ứng
SELECT A.name AS reporter_name, B.name AS editor_name
FROM journalist A INNER JOIN journalist B
    ON a.editorID = B.journalistID
ORDER BY editor_name;

-- Outer join
-- hiển thị tất cả tên các độc giả đăng ký có comment và chưa comment vào bài báo bất kỳ, 
-- mã bài báo, nội dung comment 
SELECT r.regReaderID, r.name, c.articleID, c.comment
FROM registeredReader r FULL OUTER JOIN comment c
    ON c.regReaderID = r.regReaderID;

-- Union
-- hiển thị thông tin phóng viên có đăng bài trong chuyên mục 'society' (cat 05) và 'sports' (cat01)
    SELECT j.*
    FROM journalist j, article a, article_categories ac
    WHERE j.journalistID = a.author AND a.articleID = ac.articleID
        AND ac.categoryID = 'cat05'
UNION
    (SELECT j.*
    FROM journalist j, article a, article_categories ac
    WHERE j.journalistID = a.author AND a.articleID = ac.articleID
        AND ac.categoryID = 'cat01');

-- Intersect
-- hiển thị thông tin phóng viên có đăng bài trong chuyên mục 'society' (cat 05) và đang ở trạng thái 'pending'
    (SELECT j.*
    FROM journalist j, article a, article_categories ac
    WHERE j.journalistID = a.author AND a.articleID = ac.articleID
        AND ac.categoryID = 'cat05')
INTERSECT
    (SELECT j.*
    FROM journalist j, article a
    WHERE j.journalistID = a.author
        AND [status] = 'pending')



-- Intersect
-- hiển thị thông tin phóng viên có đăng 

SELECT *
FROM category

-- 9) === Truy vấn sử dụng With. ===
-- Hiển thị mã bài báo, tựa đề, tóm tắt của các bài báo
-- thuộc chuyên mục 'technology'
WITH
    publishedArt
AS
(
        SELECT *
FROM article
WHERE [status] = 'published'
    )
SELECT p.articleID, p.title, p.summary
FROM publishedArt p, article_categories ac, category c
WHERE p.articleID = ac.articleID AND ac.categoryID = c.catID
    AND c.section = 'technology';

-- 10) === Truy vấn sử dụng function (hàm) đã viết trong bước trước. ===
-- Đếm số lượng từ trong mục summary
SELECT articleID, author, title, summary,
    dbo.fn_wordCount(summary) AS summary_word_count
FROM article;
