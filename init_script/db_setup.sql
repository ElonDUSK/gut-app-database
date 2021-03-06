DROP DATABASE IF EXISTS gut_app;
CREATE DATABASE gut_app;
USE gut_app;

/*------------- Haupt- Tabellen ---------------*/
CREATE TABLE tbl_abschlüsse(
    pk_abschluss_id MEDIUMINT NOT NULL AUTO_INCREMENT,

    PRIMARY KEY(pk_abschluss_id)
)ENGINE=InnoDB;

CREATE TABLE tbl_bildungsgänge(
    pk_bildungsgang_id MEDIUMINT NOT NULL AUTO_INCREMENT,

    PRIMARY KEY(pk_bildungsgang_id)
)ENGINE=InnoDB;

CREATE TABLE tbl_lehrer(
    pk_lehrer_id MEDIUMINT NOT NULL AUTO_INCREMENT,

    PRIMARY KEY(pk_lehrer_id)
)ENGINE=InnoDB;

/*------------- AUFLÖSUNGS TABELLEN---------------*/

/* Ein bildungsgang kann mehrer Ansprechparter haben 
und ein lehrer kann für mehrere Bildungsgänge zuständig sein*/
CREATE TABLE tbl_lehrer_bildungsgänge(
    pk_fk_bildungsgang_id MEDIUMINT NOT NULL,
    pk_fk_lehrer_id MEDIUMINT NOT NULL,

    PRIMARY KEY(pk_fk_bildungsgang_id,pk_fk_lehrer_id),

    FOREIGN KEY (pk_fk_bildungsgang_id) 
        REFERENCES tbl_bildungsgänge(pk_bildungsgang_id),
    FOREIGN KEy (pk_fk_lehrer_id)
        REFERENCES tbl_lehrer(pk_lehrer_id)
        
)ENGINE=InnoDB;
