CREATE DATABASE lampu_lalulintas;

USE lampu_lalulintas;

CREATE TABLE lampu (
  id INT AUTO_INCREMENT PRIMARY KEY,
  warna VARCHAR(10) NOT NULL,
  keterangan VARCHAR(50) NOT NULL
);

INSERT INTO lampu (warna, keterangan) VALUES
('merah', 'berhenti'),
('kuning', 'berhati-hati'),
('hijau', 'jalan');

INSERT INTO lampu (warna, keterangan) VALUES
('merah', 'berhenti'),
('kuning', 'berhati-hati'),
('hijau', 'jalan');

SELECT
  warna,
  IF(warna = 'merah', 'berhenti',
    IF(warna = 'kuning', 'berhati-hati',
      IF(warna = 'hijau', 'jalan', 'tidak diketahui')
    )
  ) AS keterangan
FROM lampu;

