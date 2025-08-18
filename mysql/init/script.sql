-- CREATE DATABASE formation CHARACTER SET = utf8mb4;
-- USE formation
CREATE USER 'formation' IDENTIFIED BY 'formation';
GRANT ALL ON formation.* TO 'formation';
CREATE TABLE formation.personne (
	id int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255),
    DOB date,
    Sex varchar(10),
    FirstAction varchar(255),
    LastAction varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO formation.personne (id, LastName, FirstName, DOB, Sex, FirstAction, LastAction) VALUES
(1, 'Doe', 'John', '1990-01-01', 'M', 'INSERTED on 2023-01-01 12:34:56', 'UPDATED on 2023-01-02 12:34:56'),
(2, 'Smith', 'Jane', '1992-02-02', 'F', 'INSERTED on 2023-01-02 12:34:56', 'UPDATED on 2023-01-03 12:34:56'),
(3, 'Brown', 'Mike', '1988-03-03', 'M', 'INSERTED on 2023-01-03 12:34:56', 'UPDATED on 2023-01-04 12:34:56');