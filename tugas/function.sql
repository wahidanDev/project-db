CREATE DATABASE IF NOT EXISTS hitung_luas;

USE hitung_luas;

DELIMITER //
CREATE PROCEDURE sf_hitungluas (
    panjang INT,
    lebar INT
)
BEGIN
    set @p_panjang = panjang;
    set @p_lebar = lebar;
    SELECT sf_hitungluas(@_panjang, @lebar);
END //

DELIMITER ;

-- Panggil fungsi dengan nama yang benar
SELECT sf_hitungluas(2, 5);

call hitungluas(2,5);