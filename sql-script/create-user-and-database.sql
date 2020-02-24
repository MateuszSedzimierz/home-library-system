-- Create user

CREATE USER 'homelibrary'@'localhost' IDENTIFIED BY 'homelibrary';

GRANT ALL PRIVILEGES ON * . * to 'homelibrary'@'localhost';

ALTER USER 'homelibrary'@'localhost' IDENTIFIED WITH mysql_native_password BY 'homelibrary';

-- Create database

CREATE DATABASE IF NOT EXISTS `home_library_system`;
USE `home_library_system`;

ALTER DATABASE home_library_system DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
	id int AUTO_INCREMENT PRIMARY KEY,
	title varchar(140), 
	author varchar(140),
	publisher varchar(140),
	publication_year varchar(4)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci; 

SET NAMES 'utf8';

-- Examples

LOCK TABLES book WRITE;

INSERT INTO book (title, author, publisher, publication_year) VALUES 
('Wiedza o świecie', 'Jane Elliott, Colin King', 'Firma Księgarska Jacek i Krzysztof Olesiejuk "Inwestycje"', 2005),
('Jak zdobyć przyjaciół i zjednać sobie ludzi', 'Dale Carnegie', 'Wydawnictwo "Emka"', 1981),
('Podręcznik przetrwania dla sił specjalnych', 'Chris McNAB', 'Bellona', 2010),
('Igrzyska śmierci', 'Suzanne Collins', 'Media Rodzina', 2008);

UNLOCK TABLES;

