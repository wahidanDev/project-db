/* 
	comment
*/

CREATE DATABASE pbl;

USE pbl;

CREATE TABLE IF NOT EXISTS tbl_registrasi(
	id TINYINT,
    nama VARCHAR(25),
    tinggal VARCHAR(25)
)

INSERT INTO tbl_registrasi (id, nama, tinggal) VALUES (3, "Wahidan", "Maleer");