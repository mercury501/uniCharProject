DROP DATABASE IF EXISTS DB_UNICHAR;
CREATE DATABASE DB_UNICHAR;
USE DB_UNICHAR;

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (	
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME CHAR(20) NOT NULL,
    SURNAME CHAR(20) NOT NULL,
    USERNAME CHAR(20) NOT NULL,
    PASSWORD CHAR(20) NOT NULL,
    ROLE CHAR(20) NOT NULL,
    AVATAR CHAR(20) NOT NULL DEFAULT '',
    EMAIL CHAR(40) NOT NULL
);


INSERT INTO USERS VALUES (1,"Dylan","Dog","DD6","groucho", "user", "user.jpg", "galeone@yahoo.it");
INSERT INTO USERS VALUES (2,"Eva","Kant","EK67","walter", "admin", "luca.jpeg", "eva@gmail.com");
INSERT INTO USERS VALUES (3, "Levi", "Ackermann", "LA555", "mikasa", "manager", "gerardo.jpeg", "wallmaria@biagio.it");

DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCTS (
  	ID INT PRIMARY KEY AUTO_INCREMENT,
    PRICE FLOAT NOT NULL,
    DESCR CHAR(255),
    TITLE CHAR(30),
    DEVELOPER CHAR(30),
    IMG_PATH_ONE CHAR(30),
    IMG_PATH_TWO CHAR(30),
    IMG_PATH_THREE CHAR(30),
    DISCOUNT_PERC FLOAT DEFAULT 0,
    STOCK INT
    );

INSERT INTO PRODUCTS VALUES (1, 23, "TACTICAL ESPIONAGE ACTION", "METAL GEAR SOLID", "KONAMI", "1.jpg", "1b.jpg", "", 0, 10);
INSERT INTO PRODUCTS VALUES (2, 43, "POST APOCALIPTIC ADVENTURE", "FALLOUT", "BLACK ISLE", "2.jpg", "2b.jpg", "", 15, 10);
INSERT INTO PRODUCTS VALUES (3, 42, "POST APOCALIPTIC ADVENTURE", "FALLOUT 2", "BLACK ISLE", "3.jpg", "3b.jpg", "", 6, 10);
INSERT INTO PRODUCTS VALUES (4, 21, "POST APOCALIPTIC ADVENTURE", "FALLOUT NEW VEGAS", "OBSIDIAN", "4.jpg", "4b.jpg", "", 50, 10);
INSERT INTO PRODUCTS VALUES (5, 2, "THE ELDER SCROLLS", "SKYRIM", "BETHESDA", "5.jpg", "5b.jpg", "", 0, 10);
INSERT INTO PRODUCTS VALUES (6, 39, "ASYMMETRICAL HORROR", "EVIL DEAD: THE GAME", "SABER INTERACTIVE", "2.jpg", "6b.jpg", "", 45, 10);
INSERT INTO PRODUCTS VALUES (7, 15, "EPIC SMALL ADVENTURE", "HOLLOW KNIGHT", "TEAM CHERRY", "7.jpg", "7b.jpg", "", 34, 10);
INSERT INTO PRODUCTS VALUES (8, 67, "CATCH 'EM ALL!", "POKEMON SWORD", "GAME FREAK", "8.jpg", "8b.jpg", "", 90, 10);
INSERT INTO PRODUCTS VALUES (9, 67, "CATCH 'EM ALL!", "POKEMON SHIELD", "GAME FREAK", "9.jpg", "9b.jpg", "", 12, 10);
INSERT INTO PRODUCTS VALUES (10, 99, "SURVIVAL HORROR STORY", "SILENT HILL 3", "KONAMI", "10.jpg", "10b.jpg", "", 0, 10);
INSERT INTO PRODUCTS VALUES (11, 99, "SURVIVAL HORROR STORY", "SILENT HILL 2", "KONAMI", "11.jpg", "11b.jpg", "", 0, 10);
INSERT INTO PRODUCTS VALUES (12, 34, "PLATFORMING ADVENTURE", "CRASH BANDICOOT 3", "NAUGHTY DOG", "12.jpg", "12b.jpg", "", 0, 10);


DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS (
    USER_ID INT,
    ORDER_ID INT,
    PRODUCT_ID INT,
    PURCH_DATE DATE,
    QUANTITY INT,
    ORDER_STATUS ENUM('PENDING', 'PAID', 'NOT SENT','DELIVERED', 'CLAIMED'),
    UNIT_PRICE FLOAT,
    CONSTRAINT FOREIGN_USER_ID FOREIGN KEY (USER_ID) REFERENCES USERS (ID) ON UPDATE CASCADE,
    CONSTRAINT FOREIGN_PROD_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PORODUCTS (ID) ON UPDATE CASCADE    
);

INSERT INTO ORDERS VALUES(1, 1, 1, '2045-10-16', 15, 1, 45);
INSERT INTO ORDERS VALUES(1, 1, 5, '2045-10-16', 15, 1, 45);
INSERT INTO ORDERS VALUES(1, 1, 7, '2045-10-16', 15, 1, 45);

DROP TABLE IF EXISTS DONATIONS;
CREATE TABLE DONATIONS (
	USER_ID INT DEFAULT 0,
    AMOUNT FLOAT DEFAULT 0
);

INSERT INTO DONATIONS VALUES(2, 45);
INSERT INTO DONATIONS VALUES(2, 45);
INSERT INTO DONATIONS VALUES(1, 45);
INSERT INTO DONATIONS VALUES(1, 45);
INSERT INTO DONATIONS VALUES(1, 45);

select * from users;

select * from products;