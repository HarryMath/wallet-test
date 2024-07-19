-- Найти все книги определенного жанра
SELECT * FROM "book"
WHERE "genre" ilike 'Fantasy';


-- Найти все книги, написанные определенным автором
SELECT * FROM "book"
WHERE "author_id" = (
    SELECT "id"
    FROM "author"
    WHERE "name" = 'Joanne Kathleen Rowling'
);


-- Найти всех читателей, которые взяли книги, но еще не вернули их:
SELECT * FROM "reader"
WHERE exists (
    SELECT 1
    FROM "borrowing"
    WHERE "borrowing"."reader_id" = "reader"."id"
    AND "borrowing"."return_date" IS NULL
);

-- Найти книги, которые были взяты за текущий месяц
SELECT "book".*, max("borrow_date") AS "last_borrow" FROM "book"
INNER JOIN "borrowing"
    ON "borrowing"."book_id" = "book"."id"
    AND date_trunc('month', "borrowing"."borrow_date") = date_trunc('month', now())
GROUP BY "book"."id";

-- Найти книги, которые были взяты в течение месяца
-- (написал второй вариант потому что из задания не понятно, какой нужен)
SELECT "book".*, max("borrow_date") AS "last_borrow" FROM "book"
INNER JOIN "borrowing"
    ON "borrowing"."book_id" = "book"."id"
    AND "borrow_date" >= now() - INTERVAL '1 month'
GROUP BY book."id";


-- Найти авторов, у которых более 3 книг в библиотеке.
SELECT * FROM "author"
WHERE "id" IN (
    SELECT "author_id" FROM "book"
    GROUP BY "author_id"
    HAVING count("book"."id") > 3
);

-- или такой вариант
SELECT "author".*, count("book"."id") AS "books_count" FROM "author"
INNER JOIN "book" ON "book"."author_id" = "author"."id"
GROUP BY "author"."id"
HAVING count("book"."id") > 3;
-- а еще можно сделать на триггерах колонку books_count и тогда можно обойтись без вложенных селоктов