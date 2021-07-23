-- tble article
ALTER TABLE article
ADD FOREIGN KEY (author) REFERENCES journalist(journalistID)

ALTER TABLE article
ADD FOREIGN KEY (editorID) REFERENCES journalist(journalistID)

ALTER TABLE article
ADD FOREIGN KEY (status) REFERENCES status(statusID)

-- tbl article_categories
ALTER TABLE article_categories
ADD FOREIGN KEY (articleID) REFERENCES article(articleID)

ALTER TABLE article_categories
ADD FOREIGN KEY (categoryID) REFERENCES category(catID)

-- tbl journalist
ALTER TABLE journalist
ADD FOREIGN KEY (editorID) REFERENCES journalist(journalistID)

ALTER TABLE journalist
ADD FOREIGN KEY (titleID) REFERENCES title(titleID)

-- tbl journalist_roles
ALTER TABLE journalist_roles
ADD FOREIGN KEY (journalistID) REFERENCES journalist(journalistID)

ALTER TABLE journalist_roles
ADD FOREIGN key (roleID) REFERENCES role(roleID)


-- tbl Comment
ALTER TABLE comment
ADD FOREIGN KEY (articleID) REFERENCES article(articleID)

ALTER TABLE comment
ADD FOREIGN KEY (regReaderID) REFERENCES registeredReader(regReaderID)

--------------

-- Make sure phone numbers contain 10 numbers
ALTER TABLE journalist
ADD CONSTRAINT jnl_phone_len_ck CHECK (LEN(phone) = 10)

ALTER TABLE registeredReader
ADD CONSTRAINT reg_phone_len_ck CHECK (LEN(phone) = 10)

-- Make sure email is in proper formated
ALTER TABLE journalist
ADD CONSTRAINT jnl_email_ck CHECK (email LIKE '%@%.%')

ALTER TABLE registeredReader
ADD CONSTRAINT reg_email_ck CHECK (email LIKE '%@%.%')

-- Make sure status = pending then publish date is null and  vice versa.
ALTER TABLE article
ADD CONSTRAINT art_pub_date_stt_ck CHECK ((status = 'pending' AND publishDate IS NULL) 
                                OR (status = 'published' AND publishDate IS NOT NULL))
