CREATE DATABASE IF NOT EXISTS hitung_luas;

USE hitung_luas;

DELIMITER //
CREATE FUNCTION sf_hitungluas (
    panjang tinyint,
    lebar tinyint
) RETURNS INT DETERMINISTIC
BEGIN
    RETURN panjang * lebar;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sf_hitungluas (
    panjang tinyint,
    lebar tinyint
)
BEGIN
    set @p_panjang = panjang;
    set @p_lebar = lebar;
    SELECT sf_hitungluas(@_panjang, @lebar);
END //
DELIMITER ;

-- Panggil fungsi dengan nama yang benar
SELECT sf_hitungluas(2, 5);

call sf_hitungluas(2,5);