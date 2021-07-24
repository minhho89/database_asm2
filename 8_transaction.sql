
/**
        1 - Thăng chức cho phóng viên mã số 3 thành biên tập viên
        2 - Bổ sung các quyền của biên tập viên (rl004 va rl006) cho người đó
    **/
BEGIN TRAN
-- 1. Chuyển từ phóng viên sang biên tập viên
UPDATE journalist
    SET titleID = 't02'
    WHERE journalistID = 3

-- 2. Thêm quyền của biên tập viên
INSERT INTO journalist_roles
    (journalistID, roleID)
VALUES
    (3, 'rl003'),
    (3, 'rl004'),
    (3, 'rl006')

COMMIT TRAN

-- CONFIRM
SELECT *
FROM journalist
SELECT *
FROM title
SELECT *
FROM journalist_roles
WHERE journalistID = 3