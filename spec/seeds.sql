DROP TABLE IF EXISTS "public"."names";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS names_id_seq;

-- Table Definition
CREATE TABLE "public"."names" (
    "id" SERIAL,
    "name" text,
    "postcode" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."names" ("name", "postcode") VALUES
('Simon', 'CB1 1AA'),
('Lauren', 'CB2 2AA'),
('Miles', 'CB3 3AA'),
('Bethany', 'CB4 4AA'),
('Richard', 'CB5 5AA'),
('Sam', 'CB1 1AA'),
('Ed', 'CB2 2AA'),
('Monica', 'CB3 3AA'),
('Pete', 'CB4 4AA');