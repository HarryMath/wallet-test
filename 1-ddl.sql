-- Authors table
CREATE TABLE "author" (
    "id"        SERIAL PRIMARY KEY,
    "name"      varchar(128) NOT NULL,
    "birthdate" date,
    "country"   varchar(128)
);

-- Books table
CREATE TABLE "book" (
    "id"               SERIAL PRIMARY KEY,
    "title"            varchar(256) NOT NULL,
    "author_id"        INT4 REFERENCES "author" ("id") ON DELETE RESTRICT,
    "publication_date" date,
    "genre"            varchar(128)
);

-- Readers (Visitors) table
CREATE TABLE "reader" (
    "id"        SERIAL PRIMARY KEY,
    "name"      varchar(128) NOT NULL,
    "email"     varchar(128) NOT NULL,
    "join_date" TIMESTAMPTZ  NOT NULL DEFAULT "now"()
);

-- History of book borrowings
CREATE TABLE "borrowing" (
    "borrow_id"   SERIAL PRIMARY KEY,
    "book_id"     int REFERENCES "book" ("id") ON DELETE CASCADE,
    "reader_id"   int REFERENCES "reader" ("id") ON DELETE CASCADE,
    "borrow_date" TIMESTAMPTZ,
    "return_date" TIMESTAMPTZ
);
