CREATE DATABASE db_manajemen_hotel;
USE db_manajemen_hotel;

CREATE TABLE tamu (
    id_tamu INT AUTO_INCREMENT PRIMARY KEY,
    nama_tamu VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    no_telepon VARCHAR(15),
    email VARCHAR(100),
    alamat TEXT
);

CREATE TABLE tipe_kamar (
    id_tipe INT AUTO_INCREMENT PRIMARY KEY,
    nama_tipe VARCHAR(50) NOT NULL,
    harga_per_malam DECIMAL(12,2) NOT NULL,
    kapasitas INT NOT NULL,
    fasilitas TEXT
);

CREATE TABLE kamar (
    id_kamar INT AUTO_INCREMENT PRIMARY KEY,
    nomor_kamar VARCHAR(10) NOT NULL UNIQUE,
    id_tipe INT NOT NULL,
    status_kamar ENUM('TERSEDIA', 'PERAWATAN')
        DEFAULT 'TERSEDIA',

    FOREIGN KEY (id_tipe)
        REFERENCES tipe_kamar(id_tipe)
);


CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT PRIMARY KEY,
    nama_pegawai VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE reservasi (
    id_reservasi INT AUTO_INCREMENT PRIMARY KEY,
    id_tamu INT NOT NULL,
    id_pegawai INT NOT NULL,
    tanggal_reservasi DATE NOT NULL,
    tanggal_checkin DATE NOT NULL,
    tanggal_checkout DATE NOT NULL,
    status_reservasi ENUM(
        'MENUNGGU',
        'DIKONFIRMASI',
        'LUNAS',
        'SELESAI',
        'DIBATALKAN'
    ) DEFAULT 'MENUNGGU',

    FOREIGN KEY (id_tamu)
        REFERENCES tamu(id_tamu),

    FOREIGN KEY (id_pegawai)
        REFERENCES pegawai(id_pegawai),

    CHECK (tanggal_checkout > tanggal_checkin)
);

CREATE TABLE detail_reservasi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_reservasi INT NOT NULL,
    id_kamar INT NOT NULL,
    harga_per_malam DECIMAL(12,2) NOT NULL,
    jumlah_malam INT NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (id_reservasi)
        REFERENCES reservasi(id_reservasi),

    FOREIGN KEY (id_kamar)
        REFERENCES kamar(id_kamar)
);

CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_reservasi INT NOT NULL,
    tanggal_pembayaran DATETIME DEFAULT CURRENT_TIMESTAMP,
    jumlah_bayar DECIMAL(12,2) NOT NULL,
    metode_pembayaran ENUM(
        'TUNAI',
        'TRANSFER',
        'QRIS'
    ),
    status_pembayaran ENUM(
        'PENDING',
        'BERHASIL',
        'GAGAL'
    ) DEFAULT 'PENDING',

    FOREIGN KEY (id_reservasi)
        REFERENCES reservasi(id_reservasi)
);

INSERT INTO tamu
(nama_tamu, jenis_kelamin, no_telepon, email, alamat)
VALUES
('Budi Bakso', 'Laki-laki', '081234567801',
 'budi@gmail.com', 'Bengkulu'),

('Agus Kopling', 'Laki-laki', '081234567802',
 'agus@gmail.com', 'Kaur'),

('Ujang Racing', 'Laki-laki', '081234567803',
 'ujang@gmail.com', 'Palembang'),

('Mamat Preman', 'Laki-laki', '081234567804',
 'mamat@gmail.com', 'Bengkulu'),

('Tejo Turbo', 'Laki-laki', '081234567805',
 'tejo@gmail.com', 'Curup');
 
 
 INSERT INTO tipe_kamar
(nama_tipe, harga_per_malam, kapasitas, fasilitas)
VALUES
('Standard', 250000, 2, 'AC, TV, WiFi'),
('Deluxe', 400000, 2, 'AC, TV, WiFi, Balkon'),
('Superior', 550000, 3, 'AC, TV, WiFi, Bathtub'),
('Suite', 900000, 4, 'AC, TV, WiFi, Ruang Tamu');
 
 
 INSERT INTO kamar
(nomor_kamar, id_tipe, status_kamar)
VALUES
('101', 1, 'TERSEDIA'),
('102', 1, 'TERSEDIA'),
('201', 2, 'TERSEDIA'),
('202', 2, 'TERSEDIA'),
('301', 3, 'TERSEDIA'),
('302', 3, 'TERSEDIA'),
('401', 4, 'TERSEDIA'),
('402', 4, 'PERAWATAN');
 
 
 INSERT INTO pegawai
(nama_pegawai, jabatan, no_telepon, email)
VALUES
('Bambang Subur', 'Resepsionis', '081111111111',
 'bambang@hotel.com'),

('Joko Karbu', 'Admin', '082222222222',
 'joko@hotel.com'),

('Siti Santuy', 'Manager', '083333333333',
 'siti@hotel.com');
 
 
 INSERT INTO reservasi
(id_tamu, id_pegawai, tanggal_reservasi,
 tanggal_checkin, tanggal_checkout, status_reservasi)
VALUES
(1, 1, '2026-10-01', '2026-11-05', '2026-11-07',
 'DIKONFIRMASI'),

(2, 1, '2026-10-02', '2026-11-08', '2026-11-10',
 'DIKONFIRMASI'),

(3, 2, '2026-10-03', '2026-11-12', '2026-11-15',
 'DIKONFIRMASI'),

(4, 2, '2026-10-04', '2026-11-16', '2026-11-18',
 'MENUNGGU'),

(5, 1, '2026-10-05', '2026-11-20', '2026-11-22',
 'DIKONFIRMASI');
 
 
 INSERT INTO detail_reservasi
(id_reservasi, id_kamar, harga_per_malam,
 jumlah_malam, subtotal)
VALUES
(1, 1, 250000, 2, 500000),
(2, 3, 400000, 2, 800000),
(3, 5, 550000, 3, 1650000),
(4, 2, 250000, 2, 500000),
(5, 7, 900000, 2, 1800000);


INSERT INTO pembayaran
(id_reservasi, jumlah_bayar, metode_pembayaran,
 status_pembayaran)
VALUES
(1, 500000, 'TRANSFER', 'BERHASIL'),
(2, 800000, 'QRIS', 'BERHASIL'),
(3, 1000000, 'TUNAI', 'BERHASIL'),
(4, 200000, 'TRANSFER', 'PENDING'),
(5, 1800000, 'QRIS', 'BERHASIL');



-- Query JOIN
-- Menampilkan data reservasi beserta nama tamu dan nomor kamar
SELECT
    r.id_reservasi,
    t.nama_tamu,
    k.nomor_kamar,
    tk.nama_tipe,
    r.tanggal_checkin,
    r.tanggal_checkout,
    r.status_reservasi
FROM reservasi r
JOIN tamu t
    ON r.id_tamu = t.id_tamu
JOIN detail_reservasi dr
    ON r.id_reservasi = dr.id_reservasi
JOIN kamar k
    ON dr.id_kamar = k.id_kamar
JOIN tipe_kamar tk
    ON k.id_tipe = tk.id_tipe;
    
-- Menampilkan informasi pembayaran tamu    
SELECT
    t.nama_tamu,
    r.id_reservasi,
    p.jumlah_bayar,
    p.metode_pembayaran,
    p.status_pembayaran
FROM pembayaran p
JOIN reservasi r
    ON p.id_reservasi = r.id_reservasi
JOIN tamu t
    ON r.id_tamu = t.id_tamu;


-- Alias dan Operator SQL
-- Menggunakan alias
SELECT
    nama_tamu AS 'Nama Tamu',
    no_telepon AS 'Nomor Telepon',
    email AS 'Alamat Email'
FROM tamu;

-- Menggunakan operator AND
SELECT *
FROM tipe_kamar
WHERE harga_per_malam > 300000
AND kapasitas >= 2;

-- Menggunakan operator OR
SELECT *
FROM kamar
WHERE status_kamar = 'TERSEDIA'
OR id_tipe = 4;

-- Menggunakan LIKE
SELECT *
FROM tamu
WHERE nama_tamu LIKE 'A%';

-- Menggunakan BETWEEN
SELECT *
FROM tipe_kamar
WHERE harga_per_malam BETWEEN 250000 AND 600000;


-- Function, Grouping, dan Sorting
-- count
SELECT COUNT(*) AS jumlah_tamu
FROM tamu;

-- sum
SELECT SUM(jumlah_bayar) AS total_pendapatan
FROM pembayaran
WHERE status_pembayaran = 'BERHASIL';

-- avg
SELECT AVG(harga_per_malam) AS rata_rata_harga
FROM tipe_kamar;

-- group by
SELECT
    tk.nama_tipe,
    COUNT(k.id_kamar) AS jumlah_kamar
FROM tipe_kamar tk
JOIN kamar k
    ON tk.id_tipe = k.id_tipe
GROUP BY tk.id_tipe, tk.nama_tipe;

-- order by
SELECT
    nama_tipe,
    harga_per_malam
FROM tipe_kamar
ORDER BY harga_per_malam DESC;


-- Membuat VIEW
CREATE VIEW view_reservasi_hotel AS
SELECT
    r.id_reservasi,
    t.nama_tamu,
    k.nomor_kamar,
    tk.nama_tipe,
    r.tanggal_checkin,
    r.tanggal_checkout,
    dr.subtotal,
    r.status_reservasi
FROM reservasi r
JOIN tamu t
    ON r.id_tamu = t.id_tamu
JOIN detail_reservasi dr
    ON r.id_reservasi = dr.id_reservasi
JOIN kamar k
    ON dr.id_kamar = k.id_kamar
JOIN tipe_kamar tk
    ON k.id_tipe = tk.id_tipe;

-- menampilkan view
SELECT * FROM view_reservasi_hotel;


-- Stored Procedure
-- Procedure membuat reservasi
DELIMITER //

CREATE PROCEDURE sp_buat_reservasi(
    IN p_id_tamu INT,
    IN p_id_pegawai INT,
    IN p_id_kamar INT,
    IN p_checkin DATE,
    IN p_checkout DATE
)
BEGIN
    DECLARE v_id_reservasi INT;
    DECLARE v_harga DECIMAL(12,2);
    DECLARE v_malam INT;

    SET v_malam = DATEDIFF(p_checkout, p_checkin);

    IF v_malam <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tanggal checkout harus setelah checkin';
    END IF;

    SELECT tk.harga_per_malam
    INTO v_harga
    FROM kamar k
    JOIN tipe_kamar tk
        ON k.id_tipe = tk.id_tipe
    WHERE k.id_kamar = p_id_kamar
    AND k.status_kamar = 'TERSEDIA';

    INSERT INTO reservasi (
        id_tamu,
        id_pegawai,
        tanggal_reservasi,
        tanggal_checkin,
        tanggal_checkout,
        status_reservasi
    )
    VALUES (
        p_id_tamu,
        p_id_pegawai,
        CURDATE(),
        p_checkin,
        p_checkout,
        'DIKONFIRMASI'
    );

    SET v_id_reservasi = LAST_INSERT_ID();

    INSERT INTO detail_reservasi (
        id_reservasi,
        id_kamar,
        harga_per_malam,
        jumlah_malam,
        subtotal
    )
    VALUES (
        v_id_reservasi,
        p_id_kamar,
        v_harga,
        v_malam,
        v_harga * v_malam
    );

    SELECT CONCAT(
        'Reservasi berhasil dibuat. ID Reservasi: ',
        v_id_reservasi
    ) AS pesan;
END //

DELIMITER ;


-- Cara menjalankan:
CALL sp_buat_reservasi(
    1, 1, 2, '2026-11-05', '2026-11-07'
);

SELECT * FROM reservasi;

-- Procedure laporan pendapatan
DELIMITER //

CREATE PROCEDURE sp_laporan_pendapatan(
    IN p_tanggal_awal DATE,
    IN p_tanggal_akhir DATE
)
BEGIN
    SELECT
        COUNT(id_pembayaran) AS jumlah_transaksi,
        SUM(jumlah_bayar) AS total_pendapatan
    FROM pembayaran
    WHERE status_pembayaran = 'BERHASIL'
    AND DATE(tanggal_pembayaran)
        BETWEEN p_tanggal_awal AND p_tanggal_akhir;
END //

DELIMITER ;

-- Cara menjalankan:
CALL sp_laporan_pendapatan(
    '2026-11-01', '2026-11-30'
);


-- Nested Query
SELECT
    nama_tipe,
    harga_per_malam
FROM tipe_kamar
WHERE harga_per_malam > (
    SELECT AVG(harga_per_malam)
    FROM tipe_kamar
);

SELECT *
FROM tamu
WHERE id_tamu IN (
    SELECT id_tamu
    FROM reservasi
);


-- TRIGGER
-- Trigger validasi ketersediaan kamar
DELIMITER //

CREATE TRIGGER trg_cek_ketersediaan_kamar
BEFORE INSERT ON detail_reservasi
FOR EACH ROW
BEGIN
    DECLARE v_jumlah INT;

    SELECT COUNT(*)
    INTO v_jumlah
    FROM detail_reservasi dr
    JOIN reservasi r
        ON dr.id_reservasi = r.id_reservasi
    JOIN reservasi r_baru
        ON r_baru.id_reservasi = NEW.id_reservasi
    WHERE dr.id_kamar = NEW.id_kamar
    AND r.status_reservasi <> 'DIBATALKAN'
    AND r.tanggal_checkin < r_baru.tanggal_checkout
    AND r.tanggal_checkout > r_baru.tanggal_checkin;

    IF v_jumlah > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Kamar sudah dipesan pada tanggal tersebut';
    END IF;
END //

DELIMITER ;

-- Trigger memperbarui status reservasi
DELIMITER //

CREATE TRIGGER trg_update_status_reservasi
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    DECLARE v_total_bayar DECIMAL(12,2);
    DECLARE v_total_reservasi DECIMAL(12,2);

    SELECT COALESCE(SUM(jumlah_bayar), 0)
    INTO v_total_bayar
    FROM pembayaran
    WHERE id_reservasi = NEW.id_reservasi
    AND status_pembayaran = 'BERHASIL';

    SELECT COALESCE(SUM(subtotal), 0)
    INTO v_total_reservasi
    FROM detail_reservasi
    WHERE id_reservasi = NEW.id_reservasi;

    IF v_total_bayar >= v_total_reservasi
       AND v_total_reservasi > 0 THEN

        UPDATE reservasi
        SET status_reservasi = 'LUNAS'
        WHERE id_reservasi = NEW.id_reservasi;

    END IF;
END //

DELIMITER ;


-- cek trigger 1
INSERT INTO detail_reservasi
(id_reservasi, id_kamar, harga_per_malam, jumlah_malam, subtotal)
VALUES
(4, 1, 250000, 2, 500000);

-- cek trigger 2
INSERT INTO pembayaran
(id_reservasi, tanggal_pembayaran, jumlah_bayar,
 metode_pembayaran, status_pembayaran)
SELECT
    4,
    NOW(),
    GREATEST(
        COALESCE((
            SELECT SUM(subtotal)
            FROM detail_reservasi
            WHERE id_reservasi = 4
        ), 0)
        -
        COALESCE((
            SELECT SUM(jumlah_bayar)
            FROM pembayaran
            WHERE id_reservasi = 4
            AND status_pembayaran = 'BERHASIL'
        ), 0),
        0
    ),
    'TRANSFER',
    'BERHASIL';

-- DCL (Data Control Language)
-- Membuat pengguna database
CREATE USER 'admin_hotel'@'localhost'
IDENTIFIED BY 'AdminHotel123';

-- Memberikan hak akses
GRANT SELECT, INSERT, UPDATE, DELETE
ON db_manajemen_hotel.*
TO 'admin_hotel'@'localhost';

-- Melihat hak akses
SHOW GRANTS FOR 'admin_hotel'@'localhost';

-- Mencabut hak akses DELETE
REVOKE DELETE
ON db_manajemen_hotel.*
FROM 'admin_hotel'@'localhost';

SELECT * FROM kamar;

SELECT
    r.id_reservasi,
    t.nama_tamu,
    SUM(dr.subtotal) AS total_biaya
FROM reservasi r
JOIN tamu t
    ON r.id_tamu = t.id_tamu
JOIN detail_reservasi dr
    ON r.id_reservasi = dr.id_reservasi
GROUP BY r.id_reservasi, t.nama_tamu
ORDER BY total_biaya DESC;

SELECT *
FROM kamar
WHERE id_kamar NOT IN (
    SELECT id_kamar
    FROM detail_reservasi
);

SELECT
    t.nama_tamu,
    COUNT(r.id_reservasi) AS jumlah_reservasi
FROM tamu t
LEFT JOIN reservasi r
    ON t.id_tamu = r.id_tamu
GROUP BY t.id_tamu, t.nama_tamu
ORDER BY jumlah_reservasi DESC;


