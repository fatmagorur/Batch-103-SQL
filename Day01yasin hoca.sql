--TABLE NASIL OLUŞTURULUR

--1.YOL:Sıfırdan tablo oluşturma:

CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE
);

--2.yol:başka bir tablo kullanarak tablo oluşturma:
CREATE TABLE student_name_age
AS SELECT student_name, student_age
FROM students;



SELECT * FROM student_name_age;

--tablo oluştururken bazı "Constrains" atamaları yapabiliriz
--Constrains:
--a)unique
--b)not null
--c)primary key
--d)foreign key
--e)check constraint

--primary key oluştumak için iki yol kullanabiliriz
--1. yol
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,--student name null değer alamaz.
student_age SMALLINT,
student_dob DATE UNIQUE --student_id unique key=>null değer dışındaki değerler tekrarsız olmalıdır.Çoklu null değer alabilir
);
--2.yol
CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_id_pk PRIMARY KEY(student_id )
	
);
--FOREİGN KEY constraint nasıl eklenir:

CREATE TABLE parents
(
student_id SMALLINT,
parent_name VARCHAR(50),
phone_number CHAR(11),
CONSTRAINT student_id_pk PRIMARY KEY(student_id )
);

CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_id_fk FOREIGN KEY(student_id ) REFERENCES parents(student_id )
);

--check constraint nasıl eklenir
CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 30),--SIFIR VE 30 DAHİL
 CONSTRAINT student_name_check CHECK(student_name = UPPER(student_name))
);
--Tabloya veri nasıl girilir:
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) UNIQUE,
student_age SMALLINT NOT NULL,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 30),--SIFIR VE 30 DAHİL
CONSTRAINT student_name_check CHECK(student_name = UPPER(student_name))
);

INSERT INTO students VALUES(101,'ALİ CAN',13,'10-Aug-2008' );
INSERT INTO students VALUES(102,'ALİ CAN',13,'10-Aug-2008' );

SELECT * FROM students;








