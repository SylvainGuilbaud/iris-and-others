CREATE SCHEMA app;

-- CREATE SEQUENCE IF NOT EXISTS app.customer_id_seq
-- 	INCREMENT BY 1
-- 	MINVALUE 1
-- 	MAXVALUE 9223372036854775807
-- 	START 1;

-- DROP TABLE app.customer;

CREATE TABLE IF NOT EXISTS app.customer (
	-- id integer NOT NULL DEFAULT nextval('app.customer_id_seq'),
	id integer NOT NULL,
	last_name varchar(100) NULL,
	first_name varchar(100) NULL,
	city varchar(100) NULL,
    active bool DEFAULT 't',
    category integer DEFAULT 1,
    hashtag bytea,
	gender varchar,
	country varchar(100),
	description text,
	created timestamp NULL,
    inserted timestamp NULL DEFAULT now(),
    lastUpdate timestamp NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS app.personne (
  id int NOT NULL,
  LastName varchar(255) DEFAULT NULL,
  FirstName varchar(255) DEFAULT NULL,
  DOB date DEFAULT NULL,
  Sex varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (1, 'Hendrix', 'Jimi', '1942-11-27', 'M');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (2, 'Verdurin', 'Olivia', '1954-09-15', 'F');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (3, 'Hemingway', 'Ernest', '1899-07-21', 'M');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (4, 'Orwell', 'George', '1903-06-25', 'M');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (5, 'Austen', 'Jane', '1775-12-16', 'F');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (6, 'Poe', 'Edgar', '1809-01-19', 'M');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (7, 'Twain', 'Mark', '1835-11-30', 'M');
INSERT INTO app.personne (id, LastName, FirstName, DOB, Sex) 
                  VALUES (8, 'Joyce', 'James', '1882-02-02', 'M');
