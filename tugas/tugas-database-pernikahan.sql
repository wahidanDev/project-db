CREATE DATABASE status_nikah;

USE status_nikah;

CREATE TABLE orang (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(20) NOT NULL,
  jenis_kelamin VARCHAR(20) NOT NULL,
  keterangan VARCHAR(50) NOT NULL
);

INSERT INTO orang (nama, jenis_kelamin, keterangan) VALUES
('Andi', 'Pria', 'Perjaka'),
('Budi', 'Pria', 'Kawin'),
('Wahab', 'Pria', 'Duda'),
('Khansa', 'Wanita', 'Perawan'),
('Keisha', 'Wanita', 'Kawin'),
('Oriza', 'Wanita', 'Janda');

SELECT 
  nama,
  jenis_kelamin,
  keterangan,
  IF(keterangan = 'Perjaka' OR keterangan = 'Perawan', 'Belum Menikah',
    IF(keterangan = 'Kawin', 'Menikah',
      IF(keterangan = 'Duda' OR keterangan = 'Janda', 'Pernah Menikah', 'Tidak Diketahui')
    )
  ) AS status_pernikahan
FROM orang;

-- SELECT
--   nama,
--   kelamin,
--   stat_nama,
--   IF(
--     kelamin = 'Pria',
--     -- Jika laki-laki
--     IF(stat_nama = 'Sendiri', 'Perjaka',
--        IF(stat_nama = 'Nikah', 'Kawin', 'Duda')
--     ),
--     -- Jika perempuan
--     IF(stat_nama = 'Sendiri', 'Perawan',
--        IF(stat_nama = 'Nikah', 'Kawin', 'Janda')
--     )
--   ) AS keterangan
-- FROM dt_status;






