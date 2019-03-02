DROP DATABASE IF EXISTS gut_app;
CREATE DATABASE gut_app;
USE gut_app;

CREATE TABLE tbl_abschlüsse(
    pk_schluss_id MEDIUMINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(pk_schluss_id)
)ENGINE=InnoDB;
