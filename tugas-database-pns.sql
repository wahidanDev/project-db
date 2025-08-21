CREATE DATABASE pns;
DROP DATABASE pns;

USE pns;

CREATE TABLE pegawai (
    id CHAR(18) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    tanggal_lahir CHAR(8),
    tanggal_pns CHAR(6),
    jenis_kelamin CHAR(1),
    no_urut CHAR(3)
);


INSERT INTO pegawai (id, nama) VALUES
('197209172005011002', 'Mohamad Septiawan'),
('198201202021012001', 'Damayanti'),
('200901202020011003', 'Mohamad Naufal Dzakiy'),
('201407142022011008', 'Mohamad Tsaniy Atila Dzaka'),
('201511142023012002', 'Nabila Tsalsa Nuraisyah');

UPDATE pegawai
SET 
  tanggal_lahir = CASE
    WHEN LENGTH(id) = 18 THEN LEFT(id, 8)
    ELSE NULL
  END,
  
  tanggal_pns = CASE
    WHEN LENGTH(id) = 18 THEN SUBSTRING(id, 9, 6)
    ELSE NULL
  END,
  
  jenis_kelamin = CASE
    WHEN LENGTH(id) = 18 THEN SUBSTRING(id, 15, 1)
    ELSE NULL
  END,
  
  no_urut = CASE
    WHEN LENGTH(id) = 18 THEN RIGHT(id, 3)
    ELSE NULL
  END;

  SELECT * FROM pegawai;










