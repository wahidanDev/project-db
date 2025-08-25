CREATE DATABASE IF NOT EXISTS kalkulator_mini;
USE kalkulator_mini;

DELIMITER //
CREATE FUNCTION sf_kalkulator (
    a INT,
    b INT,
    op CHAR(1)
) RETURNS INT DETERMINISTIC
BEGIN
    IF op = '+' THEN
        RETURN a + b;
    ELSEIF op = '-' THEN
        RETURN a - b;
    ELSEIF op = '*' THEN
        RETURN a * b;
    ELSEIF op = '/' THEN
        RETURN a / b;
    ELSE
        RETURN NULL; -- operator tidak valid
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE kal_mini (
    IN a INT,
    IN b INT,
    IN op CHAR(1)
)
BEGIN
    SELECT sf_kalkulator(a, b, op) AS hasil;
END //
DELIMITER ;

SELECT sf_kalkulator(10, 5, '+') AS tambah;
SELECT sf_kalkulator(10, 5, '-') AS kurang;
SELECT sf_kalkulator(10, 5, '*') AS kali;
SELECT sf_kalkulator(10, 5, '/') AS bagi;

CALL kal_mini(10, 5, '+');
CALL kal_mini(10, 5, '-');
CALL kal_mini(10, 5, '*');
CALL kal_mini(10, 5, '/');