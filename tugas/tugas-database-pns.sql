CREATE DATABASE pns
    DEFAULT CHARACTER SET = 'utf8mb4';
USE pns;

create table pegawai_pns (
    nip CHAR(18) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);

insert into pegawai_pns (nip, nama) values
('197209172005011002', 'Mohamad Septiawan'),
('198201202021012004', 'Damayanti'),
('200901202020011003', 'Mohamad Naufal Dzakiy'),
('201407142022011008', 'Mohamad Tsaniy Atila Dzaka'),
('201511142023012002', 'Nabila Tsalsa Nuraisyah');

CREATE VIEW info_pns AS
SELECT 
  nip,
  nama,
  STR_TO_DATE(SUBSTRING(nip, 1, 8), '%Y%m%d') AS tgl_lahir,
  DATE_FORMAT(
    STR_TO_DATE(CONCAT(SUBSTRING(nip, 9, 6), '01'), '%Y%m%d'),
    '%Y-%m'
  ) AS tgl_pns,
  SUBSTRING(nip, 15, 1) AS jenis_kelamin,
  SUBSTRING(nip, 16, 3) AS no_urut
FROM pegawai_pns;

create table agama(
	kode char(1) primary key,
    nama_agama varchar(9)
);

show table status from pns

delimiter //
create procedure ins_agama(
	pkode  char(1),
    pnama  varchar(9)
)
begin
	insert into agama (kode, nama_agama) values (pkode, pnama);
end //
delimiter ;

call ins_agama('1', 'Islam');
call ins_agama('2', 'Katolik');
call ins_agama('3', 'Protestan');
call ins_agama('4', 'Budha');
call ins_agama('5', 'Hindu');
call ins_agama('6', 'Konghucu');

select * from agama;

select * from info_pns;

alter table pegawai_pns
	add agama_id char(1);
                     
alter table pegawai_pns
	add constraint fk_pegawai_2_agama foreign key(agama_id)
    references agama(kode);
    
update pegawai_pns set agama_id = 1 where nama = 'Mohamad Septiawan';


select * from pegawai_pns;

delimiter //
create procedure update_agama(
    p_nama varchar(100),
    p_agama char(1)
)
begin
    update pegawai_pns
    set agama_id = p_agama
    where nama = p_nama;
end //
delimiter ;

CALL update_agama('Mohamad Septiawan', '1');
CALL update_agama('Damayanti', '2');
CALL update_agama('Mohamad Naufal Dzakiy', '1');
CALL update_agama('Mohamad Tsaniy Atila Dzaka', '3');
CALL update_agama('Nabila Tsalsa Nuraisyah', '1');

select nama, nama_agama from agama, pegawai_pns where agama.kode = pegawai_pns.agama_id;

delimiter //
create procedure insert_pegawai(
    p_nip char(18),
    p_nama varchar(100),
    p_agama_id char(1)
)
begin
    insert into pegawai_pns (nip, nama, agama_id) values (p_nip, p_nama, p_agama_id);
end //
delimiter ;

CALL insert_pegawai('199001012024011001', 'Fulan Bin Fulan', '4');
CALL insert_pegawai('199202022024011002', 'Siti Rahmawati', '1');
CALL insert_pegawai('198805052023012003', 'Budi Santoso', '2');
CALL insert_pegawai('199511112025011004', 'Agus Firmansyah', '5');


select * from pegawai_pns;
SELECT * FROM info_pns;