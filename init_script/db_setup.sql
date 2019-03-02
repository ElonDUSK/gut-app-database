DROP DATABASE IF EXISTS gut_app;
CREATE DATABASE gut_app;
USE gut_app;

/*------------- Haupt- Tabellen ---------------*/

/*z.b. Technik,Gestaltung...  https://www.bkgut.de/bildungsangebote/  */
CREATE TABLE tbl_kategorie(
    pk_kategorie_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    kategorie_name VARCHAR(100) NOT NULL,

    PRIMARY KEY(pk_kategorie_id)
)ENGINE=InnoDB;

/*z.b. Berufsvorbereitung,Gesundheitstechnik...  https://www.bkgut.de/bildungsangebote/  */
CREATE TABLE tbl_bereich(
    pk_bereich_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    bereich_name VARCHAR(100) NOT NULL,

    PRIMARY KEY(pk_bereich_id)
)ENGINE=InnoDB;

/*z.b. Berufsschule,Höhere Berufsfachschule,Ausbildungsvorbereitung...  https://www.bkgut.de/bildungsangebote/  */
CREATE TABLE tbl_schulform(
    pk_schulform_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    schulform_name VARCHAR(100) NOT NULL,

    PRIMARY KEY(pk_schulform_id)
)ENGINE=InnoDB;

CREATE TABLE tbl_abschlüsse(
    pk_abschluss_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    abschluss_name VARCHAR(100) NOT NULL,

    PRIMARY KEY(pk_abschluss_id)
)ENGINE=InnoDB;

CREATE TABLE tbl_bildungsgänge(
    pk_bildungsgang_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    bildungsgang_dauer_jahre INT NOT NULL,
    PRIMARY KEY(pk_bildungsgang_id)
)ENGINE=InnoDB;

CREATE TABLE tbl_lehrer(
    pk_lehrer_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    lehrer_nachname VARCHAR(100) NOT NULL,
    lehrer_vorname VARCHAR(100) NOT NULL,
    lehrer_telefon_nummer VARCHAR(100) NOT NULL,
    lehrer_email_adresse VARCHAR(300) NOT NULL,
    PRIMARY KEY(pk_lehrer_id)
)ENGINE=InnoDB;

/*------------- AUFLÖSUNGS TABELLEN---------------*/

/* Ein bildungsgang kann mehrer Ansprechparter haben */
/* Ein lehrer kann für mehrere Bildungsgänge zuständig sein*/
CREATE TABLE tbl_lehrer_bildungsgänge(
    pk_fk_bildungsgang_id MEDIUMINT NOT NULL,
    pk_fk_lehrer_id MEDIUMINT NOT NULL,

    PRIMARY KEY(pk_fk_bildungsgang_id,pk_fk_lehrer_id),

    FOREIGN KEY (pk_fk_bildungsgang_id) 
        REFERENCES tbl_bildungsgänge(pk_bildungsgang_id),
    FOREIGN KEy (pk_fk_lehrer_id)
        REFERENCES tbl_lehrer(pk_lehrer_id)
)ENGINE=InnoDB;

/*Ein Bildungsgang kann für mehrer Abschlüsse Qualifizieren*/
/*Eine Qualifizierung kann durch mehrer Bildungsgänge erreicht werden*/
CREATE TABLE tbl_bildungsgänge_abschlüsse(
    pk_fk_bildungsgang_id MEDIUMINT NOT NULL,
    pk_fk_abschluss_id MEDIUMINT NOT NULL,

    PRIMARY KEY(pk_fk_bildungsgang_id,pk_fk_abschluss_id),

    FOREIGN KEY (pk_fk_bildungsgang_id) 
        REFERENCES tbl_bildungsgänge(pk_bildungsgang_id),
    FOREIGN KEy (pk_fk_abschluss_id)
        REFERENCES tbl_abschlüsse(pk_abschluss_id)

)ENGINE=InnoDB;