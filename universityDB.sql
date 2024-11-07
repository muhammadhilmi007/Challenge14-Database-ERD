-- Buat Database
CREATE DATABASE university;

-- Tabel Jurusan
CREATE TABLE
    jurusan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        namajurusan TEXT NOT NULL
    );

-- Tabel Mahasiswa
CREATE TABLE
    mahasiswa (
        nim TEXT PRIMARY KEY,
        nama TEXT NOT NULL,
        alamat TEXT,
        id_jurusan INTEGER,
        FOREIGN KEY (id_jurusan) REFERENCES jurusan (id)
    )
    -- Tabel Dosen
CREATE TABLE
    dosen (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL
    )
    -- Tabel Matakuliah
CREATE TABLE
    matakuliah (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        sks INTEGER NOT NULL
    )
    -- Tabel Many to Many Dosen-Matakuliah
CREATE TABLE
    dosen_matakuliah (
        id_dosen INTEGER,
        nama_dosen TEXT,
        id_matakuliah INTEGER,
        nama_matakuliah TEXT,
        PRIMARY KEY (id_dosen, id_matakuliah),
        FOREIGN KEY (id_dosen) REFERENCES dosen (id),
        FOREIGN KEY (id_matakuliah) REFERENCES matakuliah (id)
    )
    -- Tabel Relasi Mahasiswa-Matakuliah
CREATE TABLE
    mahasiswa_matakuliah (
        nim_mahasiswa TEXT,
        id_matakuliah INTEGER,
        nilai FLOAT,
        PRIMARY KEY (nim_mahasiswa, id_matakuliah),
        FOREIGN KEY (nim_mahasiswa) REFERENCES mahasiswa (nim),
        FOREIGN KEY (id_matakuliah) REFERENCES matakuliah (id)
    );

-- Insert Data Jurusan
INSERT INTO
    jurusan (namajurusan)
VALUES
    ('Teknik Informatika'),
    ('Sistem Informasi'),
    ('Teknik Komputer');

-- Insert Data Dosen
INSERT INTO
    dosen (nama)
VALUES
    ('Dr. Arie'),
    ('Dr. Andi'),
    ('Dr. Andre');

-- Insert Data Mahasiswa
INSERT INTO
    mahasiswa (nim, nama, alamat, id_jurusan)
VALUES
    ('2024001', 'Andi Pratama', 'Jakarta', 1),
    ('2024002', 'Budi Arie', 'Guantanamo', 2),
    ('2024003', 'Citra Dewi', 'Bandung', 3);

-- Insert Data Matakuliah
INSERT INTO
    matakuliah (nama, sks)
VALUES
    ('Basis Data', 3),
    ('Pemrograman Web', 4),
    ('Algoritma', 3);

-- Insert Data Dosen_Matakuliah
INSERT INTO
    dosen_matakuliah (
        id_dosen,
        nama_dosen,
        id_matakuliah,
        nama_matakuliah
    )
VALUES
    (1, 'Dr. Arie', 1, 'Basis Data'),
    (1, 'Dr. Arie', 3, 'Algoritma'),
    (2, 'Dr. Andi', 2, 'Pemrograman Web');

-- Insert Data Mahasiswa_Matakuliah
INSERT INTO
    mahasiswa_matakuliah (nim_mahasiswa, id_matakuliah, nilai)
VALUES
    ('2024001', 1, 85.0),
    ('2024001', 2, 78.0),
    ('2024002', 1, 90.0),
    ('2024003', 3, 88.5);