USE ASM2
GO

-- ==== ADD TITLES ====
INSERT INTO title
       (titleID, name)
VALUES
       ('t01', 'reporter'),
       ('t02', 'editor')

-- ==== ADD ROLES ====
INSERT INTO role
       (roleID, name, details)
VALUES
       ('rl001', 'write', 'writing articles'),
       ('rl002', 'submit', 'submitting articles for editor to confirm'),
       ('rl003', 'review', 'reviewing articles from reporters'),
       ('rl004', 'publish', 'publish articles after reviewing'),
       ('rl005', 'modify', 'editing and deleting articles'),
       ('rl006', 'suspend', 'suspend some journalists from work')
-- SELECT *
-- FROM role

-- ==== ADD JOURNALIST =====
-- Add editors
INSERT INTO journalist
       (name, email, phone, titleID, editorID)
values
       ('Tran Ngoc Tuan', 'tuantn@greennews.com', '0983458761', 't02', null),
       ('Nguyen Binh', 'binhn@greennews.com', '0953658532', 't02', null)
-- Add reporters
INSERT INTO journalist
       (name, email, phone, titleID, editorID)
values
       ('Le Trong Hai', 'hailt@greennews.com', '0913463511', 't01', 1),
       ('Ho Hoang Kim', 'kimhh@greennews.com', '0953629362', 't01', 1),
       ('Vu Trong Quoc', 'quocvt@greennews.com', '0926437384', 't01', 1),
       ('Thach Vu', 'vut@greennews.com', '0924674373', 't01', 1),
       ('Ha Ngoc Hang', 'hangnh@greennews.com', '0953356742', 't01', 1),
       ('Nguyen Ngoc Bao Thanh', 'thanhnnb@greennews.com', '0932334673', 't01', 2),
       ('Vu Thanh My', 'vutm@greennews.com', '0938634655', 't01', 2),
       ('Lam Tra My', 'mytl@greennews.com', '0914435312', 't01', 2),
       ('Pham Vu Toan', 'toanpm@greennews.com', '0921524214', 't01', 2)

-- ==== ADD STATUSES ====
INSERT INTO status
       (statusID, details)
VALUES
       ('pending', 'pending for review'),
       ('published', 'published to readers')
-- SELECT *
-- FROM status

-- ==== ADD CATEGORIES ====
INSERT INTO category
       (CATID, SECTION)
VALUES
       ('cat01', 'Sports'),
       ('cat02', 'Finance'),
       ('cat03', 'Politics'),
       ('cat04', 'Business'),
       ('cat05', 'Society'),
       ('cat06', 'lifestyle'),
       ('cat07', 'international'),
       ('cat08', 'education'),
       ('cat09', 'media'),
       ('cat10', 'technology');
-- select *
-- from category

-- ==== ADD REGISTERED READERS ====
INSERT INTO registeredReader
       (name, phone, email)
VALUES
       ('poorchoy89', null, 'poorchoy89@gmail.com'),
       ('Van Tran', '0932843434', null),
       ('Tran V Giau', null, 'beyeu99999@yahoo.com'),
       ('Trung Tran Tran', '0999321321', 'ttt2121@hotmail.com'),
       ('Ngoc Nga', null, 'imrich_because_mydaddy_rich@gmail.com'),
       ('That Luc Tien Sinh', '0983453859', '76senshing@gmail.com'),
       ('Tran Gia Han', '0936509719', 'giahan.tran92@gmail.com'),
       ('youre my sunshine', '0911753987', 'ok_imfine_8383@gmail.com'),
       ('Nguyen Ngoc', null, 'ngoc19970711@hotmail.com'),
       ('Cay Tao No Hoa Khong Phai Toi', '0936740912', 'ctnh93@gmail.com');
-- select *
-- from registeredReader

-- ==== ADD ARTICLES ===

-- Set id start from 1
-- DBCC CHECKIDENT ('article', RESEED, 1) 

-- /* Add published article
INSERT INTO article
       (author, title, summary, content, submitDate, status, publishDate)
VALUES
       (3, 'Love from the rains', 'Magna velit nullam urna in fermentum', 'Magna velit nullam urna in fermentum sollicitudin ornare ullamcorper risus tellus in sed tincidunt nisl pretium vestibulum placerat platea volutpat consectetuer.

Commodo senectus morbi sem tristique malesuada. Blandit lorem nisi mattis felis nonummy facilisi nisl sit leo. Viverra lorem.

Imperdiet. Magnis vulputate ullamcorper feugiat ipsum varius habitasse elit sit et tincidunt litora luctus vitae aptent cubilia. A.

Accumsan sit ornare consequat bibendum blandit, magna tempor, pellentesque ridiculus dolor nibh nisl ultrices in hendrerit sollicitudin sodales risus enim curae;.

At aliquam potenti posuere porta ante. Nibh tincidunt penatibus. Natoque, bibendum aenean ullamcorper, sociis morbi donec, curabitur orci quam arcu consequat taciti.', '2021-01-02', 'published', '2021-01-03'),
       (4, 'When chess becomes Jess', 'Aliquam sit egestas
ultricies lacinia, adipiscing, mollis conubia nam hendrerit commodo', 'Aliquam sit egestas ultricies lacinia, adipiscing, mollis conubia nam hendrerit commodo Diam convallis sed quisque netus. A congue cras taciti montes lacus mattis, semper duis torquent gravida pretium, fusce facilisi. Luctus.

Mus suscipit cum rhoncus sapien aliquam morbi semper. Eleifend vestibulum mattis duis hymenaeos dis nascetur. Taciti litora vehicula mollis aenean, pharetra semper suspendisse sollicitudin tellus magnis natoque faucibus aliquam aliquam primis Duis in condimentum rutrum vehicula litora fusce sapien sollicitudin risus nisl.

Malesuada dignissim pharetra at augue erat vitae amet mollis posuere fermentum eros placerat conubia suscipit penatibus libero fusce porttitor a interdum vivamus. Posuere nibh cubilia Duis in.', '2020-12-30', 'published', '2020-12-30'),
       (5, 'Soviet Tanks', 'Vitae vel velit
.', 'Vitae vel velit. Purus posuere mattis vestibulum nibh odio cubilia taciti condimentum imperdiet interdum aliquam Leo morbi lorem inceptos ipsum hac tristique est.

Convallis habitant netus aenean sapien aptent non donec accumsan dignissim vel condimentum nibh posuere dictum habitant pretium nam a. Parturient pellentesque magna bibendum etiam cubilia habitasse, risus, per tortor hendrerit ultricies platea cras parturient.

Mauris laoreet et mus lacinia magna luctus aenean, donec dis morbi ultrices odio ac metus massa torquent eros euismod pede scelerisque, condimentum elit, malesuada pharetra rutrum Rutrum sociosqu velit varius habitasse. Primis. Interdum. Lorem proin rhoncus class adipiscing ligula non quam vitae. Et.', '2021-03-26', 'published', '2021-03-27'),
       (6, 'Good Doctor is a good series', 'Natoque porta imperdiet
ultrices ridiculus. Hymenaeos vestibulum hendrerit rutrum tempus pretium. Mollis varius urna lacinia. Lacus.', 'Magnis scelerisque ornare quam duis accumsan tincidunt nisi, nisi auctor potenti diam egestas felis dictumst sociis mi arcu molestie luctus ullamcorper condimentum rutrum sociosqu. Et ultrices.

Natoque porta imperdiet ultrices ridiculus. Hymenaeos vestibulum hendrerit rutrum tempus pretium. Mollis varius urna lacinia. Lacus.

Ultricies quis. Volutpat, porttitor. Sem consequat ultricies sodales sollicitudin quisque sodales mauris viverra aptent pretium arcu felis integer orci erat nostra donec nascetur.

Mi diam nascetur habitant donec enim sodales. Enim netus luctus odio. Quis eros laoreet lacinia laoreet eget Tempus non per malesuada class enim nullam aenean vehicula a sociis ridiculus. Maecenas. Lacus tortor ultricies porttitor ut.', '2019-06-21', 'published', '2019-06-21'),
       (8, 'Iphone defeated Android', 'Vulputate arcu, nec lacus
eros nonummy neque torquent elementum mus suscipit enim ligula sollicitudin', 'Libero nascetur sem tellus. Lectus facilisis conubia Porttitor volutpat a magnis turpis faucibus, blandit primis tempor eget nibh Lacinia blandit neque ultricies eu massa tincidunt parturient phasellus cursus interdum vulputate sociis. Cras odio auctor Platea. Nisl ultrices curae; at.

Aliquet sem hendrerit nonummy lobortis. Massa Suspendisse suspendisse sapien elementum est scelerisque elit lacinia nascetur suscipit. Hymenaeos cras quis facilisis duis diam purus placerat. Cum accumsan lectus lectus a ornare nullam turpis sollicitudin. Ante sociis eu rutrum inceptos. Nullam fames. Quam lectus dictumst.

Vulputate arcu, nec lacus eros nonummy neque torquent elementum mus suscipit enim ligula sollicitudin feugiat feugiat etiam ultricies molestie habitant lacinia curae; consectetuer vehicula ut luctus natoque consequat ultrices potenti Nibh. Nibh dis sollicitudin nec phasellus lobortis lorem sed condimentum dui scelerisque. Orci cras porttitor blandit tellus blandit facilisis curae; pede curabitur egestas pulvinar arcu urna turpis cubilia sem massa mauris laoreet aliquet, felis litora urna dolor.

Dapibus neque curae; nibh fermentum porttitor taciti et. Sed sollicitudin eleifend fusce eros sociis felis suspendisse natoque hymenaeos, odio. A euismod sapien orci ligula orci suspendisse maecenas nostra pharetra ipsum dapibus euismod ultrices, nunc. Augue libero porttitor pretium augue cum accumsan ridiculus. Ipsum tempor turpis consectetuer hymenaeos class tempus, felis accumsan.', '2021-05-19', 'published', '2021-05-20'),
       (9, 'Cops and victims', 'Magna viverra quisque
scelerisque penatibus.', 'Varius sem. Molestie a. Habitant imperdiet. Sit erat. Arcu vehicula dui id consequat torquent primis sem lacinia. Dolor, ad risus et metus quam volutpat tortor dui tempus venenatis.

Magna viverra quisque scelerisque penatibus. Cubilia senectus maecenas. Diam fusce platea quam dolor aliquam neque, varius montes blandit sociosqu quam purus porttitor placerat tristique sagittis morbi malesuada.

Ultrices facilisis imperdiet eu netus leo convallis vitae ligula torquent ipsum luctus senectus egestas arcu.', '2021-07-10', 'published', '2021-07-10'),
       (10, 'Civilization VI and society characterictis', 'Lorem malesuada mus', 'Montes cras morbi mus class iaculis morbi commodo molestie cras torquent placerat etiam. A. Torquent eget quisque.

Lorem malesuada mus, libero suscipit tincidunt natoque nonummy. Sodales eget nec orci. Lobortis amet aliquam, senectus class tellus urna elit sem Tristique mollis Nam. Curae;. Euismod natoque fermentum.

Porta justo eros tincidunt tempus vivamus orci massa risus auctor amet. Tortor porttitor ipsum nec. Natoque netus est mattis. Ad ad massa Habitant eget senectus nec bibendum venenatis elit nec sollicitudin justo facilisi Blandit bibendum.', '2021-04-30', 'published', '2021-04-30'),
       (11, 'Water and China', 'Water falls water falls water falls', 'Pharetra platea, a nibh consectetuer. Justo Auctor aenean etiam ad parturient porttitor malesuada.

Tincidunt. Enim. Mi aptent eleifend posuere nisi commodo bibendum integer phasellus maecenas accumsan auctor tristique faucibus congue. Interdum. Tempor.

Primis. Ante cras laoreet quis fusce duis pellentesque ut ullamcorper accumsan felis congue gravida sagittis diam. Erat. Semper, dolor ut ante tempus tristique. Accumsan habitant, lacus dictumst iaculis.', '2021-05-03', 'published', '2021-05-05')

-- /* Add pending article
INSERT INTO article
       (author, title, summary, content, submitDate, status)
VALUES
       (3, 'Ultrices facilisis taciti', 'Inceptos vulputate lobortis et varius varius risus et nisi class.', 'Augue congue tempor. Conubia eros leo feugiat pede in in euismod. Lacinia ad erat ultricies eros convallis duis dis nibh suscipit vel molestie hendrerit. Eleifend per.

Aenean turpis in urna. Etiam eget curae; velit arcu consequat accumsan sociis suspendisse. Lobortis in eros quis ultrices integer venenatis ut purus aliquam urna.

Ultrices facilisis taciti nonummy. Inceptos vulputate lobortis et varius varius risus et nisi class. Vestibulum adipiscing. Ac dui ullamcorper litora class hymenaeos at tortor ornare vestibulum porta nec ut phasellus.', '2021-07-20', 'pending'),
       (4, 'Netus lacus nascetur', 'Lorem, vestibulum conubia
elit integer conubia.', 'Netus lacus nascetur molestie cubilia gravida ipsum risus tempor. Nisl blandit fermentum nunc luctus curabitur.

Lorem, vestibulum conubia elit integer conubia nisl dolor elementum nulla Nam congue. Velit quis nec sit tortor venenatis metus quisque taciti. Velit parturient etiam.

Amet ornare felis leo quam cum dapibus donec erat cras cubilia penatibus dictum facilisis amet pellentesque ligula litora sapien Malesuada Viverra Maecenas etiam et torquent justo aptent pharetra lobortis adipiscing porta.', '2021-07-19', 'pending'),
       (5, 'Ipsum urna nibh
ad etiam montes', 'Dui phasellus nam. Sem. Nisi parturient pede id velit cras ligula sit. ', 'Ipsum urna nibh ad etiam montes fermentum feugiat senectus. Magnis nisl et. Quam eu ullamcorper vivamus fermentum cras primis maecenas. Habitasse mus class id bibendum accumsan.

Dui phasellus nam. Sem. Nisi parturient pede id velit cras ligula sit. Aenean dapibus cras eros porta sagittis Molestie odio congue fusce interdum porta phasellus lobortis duis diam suspendisse.

Quis cum sit, viverra accumsan pellentesque, facilisi facilisi convallis maecenas placerat purus velit aptent pulvinar lacus penatibus sociosqu non nec ullamcorper vehicula netus tempor in.', '2021-07-21', 'pending'),
       (10, 'TSit, sollicitudin', 'Dictumst nunc lorem
ad dui etiam sociis', 'Sit, sollicitudin. Sit habitasse a faucibus euismod rutrum neque amet duis.

Dictumst nunc lorem ad dui etiam sociis sem phasellus penatibus inceptos euismod etiam nibh. Neque. Curae; maecenas varius vestibulum mus. Luctus. Dui tempor diam.

Vitae dictumst facilisis penatibus class praesent eget cum senectus vehicula. Facilisi platea. Diam volutpat fames.', '2021-07-21', 'pending'),
       (11, 'Fames. In pulvinar potenti', 'At, taciti cumtincidunt nostra ac aptent pharetra', 'Fames. In pulvinar potenti. Suscipit fermentum tristique. Malesuada imperdiet, duis, per habitant phasellus quis. Magna nullam curae; nullam ultricies lacinia Aenean posuere. Sociosqu suscipit justo vulputate nam lorem id nec quam. Neque.

At, taciti cum tincidunt nostra ac aptent pharetra ac felis mollis laoreet pharetra ante leo, elit habitasse lacus integer orci aliquet malesuada sed.

Convallis ac libero per ac interdum viverra condimentum. Placerat diam augue et lacus non vehicula vulputate sagittis nibh. Auctor nec cras suspendisse, iaculis elementum aenean. Suscipit dictum. Taciti interdum nisl placerat primis, nostra penatibus rutrum.', '2021-07-21', 'pending')

-- journalist_roles
-- added by procedure 

-- article_categories 
select *
from category
SELECT *
FROM article

INSERT INTO article_categories
       (articleID, categoryID)
VALUES
       (1, 'cat05'),
       (1, 'cat06'),
       (1, 'cat09'),
       (2, 'cat10'),
       (2, 'cat01'),
       (3, 'cat10'),
       (3, 'cat03'),
       (3, 'cat07'),
       (4, 'cat05'),
       (4, 'cat08'),
       (4, 'cat09'),
       (4, 'cat04'),
       (5, 'cat10'),
       (5, 'cat04'),
       (6, 'cat05'),
       (6, 'cat09'),
       (7, 'cat02'),
       (7, 'cat07'),
       (7, 'cat10'),
       (8, 'cat02'),
       (8, 'cat07'),
       (8, 'cat10'),
       (9, 'cat01'),
       (10, 'cat06'),
       (10, 'cat07'),
       (10, 'cat08'),
       (11, 'cat09'),
       (11, 'cat05'),
       (12, 'cat05'),
       (12, 'cat06'),
       (13, 'cat01'),
       (13, 'cat07');

-- SELECT *
-- FROM article_categories

-- comment
INSERT INTO comment
       (regReaderID, articleID, comment, TIMESTAMP)
VALUES
       (1, 3, 'I love it!', '2021-03-26'),
       (1, 3, 'But I hate it also', '2021-03-27'),
       (1, 5, 'Cool', '2021-05-20'),
       (3, 5, 'Fake', '2021-05-21'),
       (3, 6, 'I do not think so!', '2021-07-12'),
       (4, 3, 'Nibh posuere mattis nascetur hymenaeos.', '2021-03-31'),
       (4, 8, 'Blandit in nunc morbi adipiscing quis, ultrices neque. Dapibus metus.', '2021-05-05'),
       (4, 7, 'Torquent blandit nunc felis porta nunc vulputate. Volutpat penatibus in.', '2021-05-01'),
       (4, 4, 'Sapien. Porttitor dignissim, hendrerit hendrerit, nunc eros pharetra commodo et.', '2021-06-22'),
       (7, 5, 'Lacus phasellus etiam libero nullam tristique enim libero mauris. Nullam.', '2021-05-30'),
       (7, 4, 'Diam turpis
. Orci. Lectus dignissim malesuada. Primis, pulvinar nostra consequat.', '2021-06-25'),
       (7, 3, 'Nibh magna nullam
venenatis cum conubia vel lacus varius egestas.', '2021-03-27'),
       (7, 8, 'Class hac conubia porta platea, eu metus tristique pulvinar nunc.', '2021-05-05'),
       (8, 5, 'Enim curabitur est ante mus nisi. Dictumst montes eget lorem.', '2021-05-20'),
       (8, 6, 'Elementum tempus ultricies
pharetra interdum felis ornare primis Viverra odio.', '2021-07-10'),
       (8, 7, 'Egestas bibendum bibendum scelerisque magna sollicitudin Quisque placerat gravida. Magnis.', '2021-05-01'),
       (8, 8, 'Viverra egestas
. In litora egestas nec et consequat ante Malesuada.', '2021-05-04') ,
       (9, 3, 'Dis molestie malesuada quis sollicitudin cursus porttitor porta primis natoque.', '2021-04-30'),
       (9, 1, 'Dis molestie malesuada
quis sollicitudin cursus porttitor porta primis natoque.', '2021-01-10'),
       (9, 2, 'Iaculis per sem pede mus potenti elementum pellentesque nibh natoque.', '2021-01-01'),
       (9, 1, 'Dignissim
in nunc purus dictumst, velit curabitur duis mattis sapien.', '2021-01-03');

-- TEST
-- SELECT *
-- FROM comment

-- select *
-- from registeredReader
-- select *
-- from article
-- where [status] = 'published'
