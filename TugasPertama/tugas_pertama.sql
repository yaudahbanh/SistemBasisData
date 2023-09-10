-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-09-09 12:57:42.834

-- tables
-- Table: guest
CREATE TABLE guest (
    guest_id int  NOT NULL,
    guest_guesthouse_id int  NOT NULL,
    guest_name varchar(255)  NOT NULL,
    guest_idcard varchar(255)  NOT NULL,
    guest_facilites int  NULL,
    guest_checkin datetime  NOT NULL,
    guest_checkout datetime  NOT NULL,
    guest_payment int  NOT NULL,
    guest_card_returned bool  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guest_pk PRIMARY KEY (guest_id)
);

-- Table: guest_feedback
CREATE TABLE guest_feedback (
    feedback_id int  NOT NULL,
    feedback_comment varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guest_feedback_pk PRIMARY KEY (feedback_id)
);

-- Table: guest_payments
CREATE TABLE guest_payments (
    payments_id int  NOT NULL,
    payments_method varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guest_payments_pk PRIMARY KEY (payments_id)
);

-- Table: guesthouse
CREATE TABLE guesthouse (
    guesthouse_id int  NOT NULL,
    guesthouse_name varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guesthouse_pk PRIMARY KEY (guesthouse_id)
);

-- Table: guesthouse_facilities
CREATE TABLE guesthouse_facilities (
    facilities_id int  NOT NULL,
    facilites_name varchar(255)  NOT NULL,
    facilities_quantity int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guesthouse_facilities_pk PRIMARY KEY (facilities_id)
);

-- Table: guesthouse_roomtype
CREATE TABLE guesthouse_roomtype (
    roomtype_id int  NOT NULL,
    roomtype_name varchar(255)  NOT NULL,
    guesthouse_id int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT guesthouse_roomtype_pk PRIMARY KEY (roomtype_id)
);

-- foreign keys
-- Reference: guest_guest_feedback (table: guest)
ALTER TABLE guest ADD CONSTRAINT guest_guest_feedback FOREIGN KEY guest_guest_feedback (guest_id)
    REFERENCES guest_feedback (feedback_id);

-- Reference: guest_guesthouse (table: guest)
ALTER TABLE guest ADD CONSTRAINT guest_guesthouse FOREIGN KEY guest_guesthouse (guest_guesthouse_id)
    REFERENCES guesthouse (guesthouse_id);

-- Reference: guest_payments_guest (table: guest)
ALTER TABLE guest ADD CONSTRAINT guest_payments_guest FOREIGN KEY guest_payments_guest (guest_payment)
    REFERENCES guest_payments (payments_id);

-- Reference: guesthouse_facilities_guest (table: guest)
ALTER TABLE guest ADD CONSTRAINT guesthouse_facilities_guest FOREIGN KEY guesthouse_facilities_guest (guest_facilites)
    REFERENCES guesthouse_facilities (facilities_id);

-- Reference: guesthouse_roomtype_guesthouse (table: guesthouse_roomtype)
ALTER TABLE guesthouse_roomtype ADD CONSTRAINT guesthouse_roomtype_guesthouse FOREIGN KEY guesthouse_roomtype_guesthouse (guesthouse_id)
    REFERENCES guesthouse (guesthouse_id);

-- End of file.

