-- Active: 1690135808651@@127.0.0.1@3306@sistemaventa
--create database
USE SISTEMAVENTA;
-- create table
CREATE TABLE USUARIO (
    ID_USUARIO      INT             AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(50)     UNIQUE          NOT NULL,
    EDAD            INT             UNSIGNED        NOT NULL,
    EMAIL           VARCHAR(80)     UNIQUE          NOT NULL,
    CONTRASENA      VARCHAR(80)                     NOT NULL,
    ESTADO          ENUM('A','I')   DEFAULT 'I'     NOT NULL, 
    FECHACREACION   DATETIME        DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ID_ROL          INT             NOT NULL,
    FOREIGN KEY (ID_ROL) REFERENCES ROL(ID_ROL) ON DELETE CASCADE
);

CREATE TABLE CATEGORIA(
    ID_CATEGORIA    INT             NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(50)     NOT NULL    UNIQUE,
    ESTADO          ENUM('A','I')   NOT NULL    DEFAULT 'I',
    FECHAREGISTRO   DATETIME        NOT NULL    DEFAULT     CURRENT_TIMESTAMP
);

CREATE TABLE PRODUCTO(
    ID_PRODUCTO     INT             NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(150)    NOT NULL    UNIQUE,
    STOCK           INT             NOT NULL,
    PRECIO          DECIMAL(10,4)   NOT NULL,
    ESTADO          ENUM('A','I')   NOT NULL    DEFAULT 'I',
    FECHAREGISTRO   DATETIME        NOT NULL    DEFAULT     CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES CATEGORIA(ID_CATEGORIA) ON DELETE CASCADE
)

DROP TABLE USUARIO;

DROP TABLE CATEGORIA;

CREATE TABLE ROL(
    ID_ROL          INT         AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(50) UNIQUE          NOT NULL,
    FECHAREGISTRO   DATETIME    DEFAULT         CURRENT_TIMESTAMP
);

