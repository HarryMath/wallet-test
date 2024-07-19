INSERT INTO "author" ("name", "birthdate", "country")
VALUES ('Brian Wilson Aldiss', '1925-08-18', 'United Kingdom'),
       ('Hermann Hesse', '1877-07-02', 'Germany'),
       ('Joanne Kathleen Rowling', '1965-07-31', 'United Kingdom'),
       ('Yanka Kupala', '1882-07-07', 'Belarus'),
       ('Stephen King', '1947-09-21', 'United States'),
       ('Isaac Asimov', '1920-01-02', 'United States'),
       ('Arthur C. Clarke', '1917-12-16', 'United Kingdom'),
       ('Frank Herbert', '1920-10-08', 'United States');

-- I can mistake with author ids :)
INSERT INTO "book" ("title", "author_id", "publication_date", "genre")
VALUES ('Harry Potter and the Philosopher''s Stone', 3, '1997-06-26', 'Fantasy'),
       ('1984', 2, '1949-06-08', 'Dystopian'),
       ('The Hobbit', 1, '1937-09-21', 'Fantasy'),
       ('Murder on the Orient Express', 5, '1934-01-01', 'Mystery'),
       ('The Shining', 6, '1977-01-28', 'Horror'),
       ('Harry Potter and the Chamber of Secrets', 3, '1998-07-02', 'Fantasy'),
       ('Animal Farm', 2, '1945-08-17', 'Political Satire'),
       ('The Lord of the Rings', 1, '1954-07-29', 'Fantasy'),
       ('And Then There Were None', 4, '1939-11-06', 'Mystery'),
       ('Nonstop', 1, '1958-09-18', 'Science Fiction'),
       ('I, Robot', 6, '1950-12-02', 'Science Fiction'),
       ('Rendezvous with Rama', 7, '1973-06-20', 'Science Fiction'),
       ('Dune', 8, '1965-08-01', 'Science Fiction'),
       ('The Man in the High Castle', 1, '1962-10-01', 'Science Fiction'),
       ('Siddhartha', 2, '1922-11-01', 'Philosophical Fiction'),
       ('The Silmarillion', 3, '1977-09-15', 'Fantasy'),
       ('Carrie', 5, '1974-04-05', 'Horror'),
       ('It', 6, '1986-09-15', 'Horror');

-- self check that there are no book duplicates (expect 0 records)
-- select "title" from book group by "title" having count("id") > 1;

INSERT INTO "reader" ("name", "email", "join_date")
VALUES ('Mikita Bortnik', 'mikita@example.com', '2024-01-15'),
       ('John Smith', 'bob@example.com', '2020-02-20'),
       ('Natalia Smirnova', 'charlie@example.com', '2001-03-25'),
       ('Kate Play', 'diana@example.com', '1999-04-30'),
       ('Oksana Malanchevskaya', 'malanchevskaya@example.com', '2024-07-19'),
       ('Joy Goodman', 'eve@example.com', '2023-05-10');

INSERT INTO "borrowing" ("book_id", "reader_id", "borrow_date", "return_date")
VALUES (1, 1, '2024-03-01', NULL),
       (2, 2, '2024-02-15', '2024-07-05'),
       (3, 3, '2022-01-05', NULL),
       (4, 4, '2007-12-20', '2024-07-10'),
       (5, 5, '2022-11-10', NULL),
       (4, 6, '2021-06-21', '2024-07-10'),
       (5, 6, '2024-07-12', '2024-07-19'),
       (6, 4, '2019-08-03', '2024-07-10'),
       (6, 2, '2024-07-01', NULL),
       (7, 1, '2015-06-25', '2024-07-10'),
       (8, 3, '2023-05-16', NULL),
       (9, 4, '2022-04-07', '2024-07-10'),
       (10, 2, '2021-03-28', NULL),
       (17, 5, '2024-07-29', '2024-07-10'),
       (13, 5, '2024-06-29', '2024-07-19'),
       (18, 3, '2024-01-31', NULL);


