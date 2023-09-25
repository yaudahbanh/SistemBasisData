-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-09-24 13:52:43.485

-- tables
-- Table: customer
CREATE TABLE customer (
    customer_id varchar(6)  NOT NULL,
    customer_nama_depan varchar(255)  NOT NULL,
    customer_nama_belakang varchar(255)  NOT NULL,
    customer_alamat varchar(255)  NULL,
    customer_no_telepon int  NULL,
    is_membership boolean  NULL,
    CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

-- Table: membership
CREATE TABLE membership (
    membership_id varchar(6)  NOT NULL,
    customer_id varchar(6)  NOT NULL,
    membership_point int  NOT NULL,
    membership_started date  NOT NULL,
    membership_ended date  NOT NULL,
    CONSTRAINT membership_pk PRIMARY KEY (membership_id)
);

-- Table: menu
CREATE TABLE menu (
    menu_id varchar(6)  NOT NULL,
    menu_nama varchar(255)  NOT NULL,
    menu_harga decimal(8,2)  NOT NULL,
    CONSTRAINT menu_pk PRIMARY KEY (menu_id)
);

-- Table: pegawai
CREATE TABLE pegawai (
    nik int  NOT NULL,
    nama_depan varchar(255)  NOT NULL,
    nama_belakang varchar(255)  NOT NULL,
    jenis_kelamin varchar(255)  NOT NULL,
    no_telepon int  NOT NULL,
    no_telepon_1 int  NULL,
    no_telepon_2 int  NULL,
    email varchar(255)  NOT NULL,
    umur int  NOT NULL,
    CONSTRAINT pegawai_pk PRIMARY KEY (nik)
);

-- Table: pesanan
CREATE TABLE pesanan (
    pesanan_id int  NOT NULL,
    menu_id varchar(6)  NOT NULL,
    transaksi_id varchar(10)  NOT NULL,
    banyak_pesanan int  NOT NULL,
    CONSTRAINT pesanan_pk PRIMARY KEY (pesanan_id)
);

-- Table: transaksi
CREATE TABLE transaksi (
    transaksi_id varchar(10)  NOT NULL,
    nik_pegawai int  NOT NULL,
    membership_id varchar(6)  NULL,
    customer_id varchar(6)  NOT NULL,
    total_menu int  NOT NULL,
    total_harga decimal(8,2)  NOT NULL,
    metode_pembayaran varchar(255)  NOT NULL,
    tanggal_pemesanan datetime  NOT NULL,
    CONSTRAINT transaksi_pk PRIMARY KEY (transaksi_id)
);

-- foreign keys
-- Reference: membership_customer (table: membership)
ALTER TABLE membership ADD CONSTRAINT membership_customer FOREIGN KEY membership_customer (customer_id)
    REFERENCES customer (customer_id);

-- Reference: pesanan_menu (table: pesanan)
ALTER TABLE pesanan ADD CONSTRAINT pesanan_menu FOREIGN KEY pesanan_menu (menu_id)
    REFERENCES menu (menu_id);

-- Reference: pesanan_transaksi (table: pesanan)
ALTER TABLE pesanan ADD CONSTRAINT pesanan_transaksi FOREIGN KEY pesanan_transaksi (transaksi_id)
    REFERENCES transaksi (transaksi_id);

-- Reference: transaksi_customer (table: transaksi)
ALTER TABLE transaksi ADD CONSTRAINT transaksi_customer FOREIGN KEY transaksi_customer (customer_id)
    REFERENCES customer (customer_id);

-- Reference: transaksi_membership (table: transaksi)
ALTER TABLE transaksi ADD CONSTRAINT transaksi_membership FOREIGN KEY transaksi_membership (membership_id)
    REFERENCES membership (membership_id);

-- Reference: transaksi_pegawai (table: transaksi)
ALTER TABLE transaksi ADD CONSTRAINT transaksi_pegawai FOREIGN KEY transaksi_pegawai (nik_pegawai)
    REFERENCES pegawai (nik);

-- End of file.

