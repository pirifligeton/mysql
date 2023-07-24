
-- =============================================================================
-- DATABASE CREATION
-- =============================================================================
CREATE DATABASE TIENDA;

-- SELECT DATABASE TIENDA ======================================================
USE TIENDA;

-- TABLE CREATION "USUARIO" ====================================================

CREATE TABLE USUARIO(
    ID_USUARIO              INT(6)                  NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE_USUARIO          VARCHAR(50)             NOT NULL,
    APELLIDO_USUARIO        VARCHAR(50)             NOT NULL,
    CONTRASENA_USUARIO      VARCHAR(50)             NOT NULL,
    EMAIL_USUARIO           VARCHAR(99)             NOT NULL    UNIQUE,
    EDAD_USUARIO            INT                     NOT NULL,
    TIPO_USUARIO            ENUM('0','1','2','3')   NOT NULL    DEFAULT '1',
    FECHA_REGISTRO_USUARIO  DATETIME                NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    ESTADO_USUARIO          ENUM('0','1')           NOT NULL    DEFAULT '0',
    CONSTRAINT CHK_EDAD_USU CHECK (EDAD_USUARIO>= 18 AND EDAD_USUARIO<=65)
);

-- TABLE DROPING USUARIO =======================================================
DROP TABLE USUARIO;

--TYPE 0 IS "ADMIN"
--TYPE 1 IS "UNASSIGNED" 
--TYPE 2 IS "CLIENT"
--TYPE 3 IS "USER"

--STATUS 0 IS "INACTIVE"
--STATUS 1 IS "ACTIVE"

-- TABLE CREATION "PRODUCTO" ===================================================

CREATE TABLE PRODUCTO(
    ID_PRODUCTO             INT(6)                      NOT NULL    AUTO_INCREMENT      PRIMARY KEY,
    NOMBRE_PRODUCTO         VARCHAR(50)                 NOT NULL    UNIQUE,
    DESCRIPCION_PRODUCTO    VARCHAR(255)                NOT NULL,
    CANTIDAD_PRODUCTO       INT                         NOT NULL    DEFAULT 0,
    PRECIO_PRODUCTO         DECIMAL(5,2)                NOT NULL    DEFAULT 0,
    FECHA_REGISTRO_PRODUCTO DATETIME                    NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    ESTADO_PRODUCTO         ENUM('0','1')               NOT NULL    DEFAULT '0',
    CATEGORIA_PRODUCTO      ENUM('0','1','2','3','4')   NOT NULL    DEFAULT '0'
);

-- TABLE DROPING PRODUCTO ======================================================
DROP TABLE PRODUCTO;

--STATUS 0 IS "UNLISTED"
--STATUS 1 IS "LISTED"

--CATEGORY 0 IS "UNDEFINED"
--CATEGORY 1 IS "POLOS"
--CATEGORY 2 IS "CALZADO"
--CATEGORY 3 IS "PANTALON"
--CATEGORY 4 IS "ROPA-INTERIOR"

-- TABLE CREATION VENTA ==========================================================

CREATE TABLE VENTA(
    ID_VENTA                INT(6)                      NOT NULL    AUTO_INCREMENT      PRIMARY KEY,
    TIPO_VENTA              ENUM('0','1','2')           NOT NULL    DEFAULT '0',
    TIPO_PAGO_VENTA         ENUM('0','1','2')           NOT NULL    DEFAULT '0',
    FECHA_ENTREGA_VENTA     DATETIME                    NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    ID_USUARIO              INT(6)                      NOT NULL,
    ID_PRODUCTO             INT(6)                      NOT NULL,
    CONSTRAINT FK_VENTA_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT FK_VENTA_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);

-- TABLE DROPING VENTA =========================================================
DROP TABLE VENTA;

-- TYPE 0 IS "UNDEFINED"
-- TYPE 1 IS "BOLETA"
-- TYPE 2 IS "FACTURA"

-- TYPE PAYMENT 0 IS "UNDEFINED"
-- TYPE PAYMENT 1 IS "EFECTIVO"
-- TYPE PAYMENT 2 IS "TARJETA"

-- TABLE CREATION DETALLE_VENTA ==================================================

CREATE TABLE DETALLE_VENTA(
    ID_DETALLE_VENTA        INT(6)                      NOT NULL    AUTO_INCREMENT      PRIMARY KEY,
    ID_VENTA                INT(6)                      NOT NULL,
    ID_PRODUCTO             INT(6)                      NOT NULL,
    DOCUMENTO_DETALLE_VENTA INT(16)                     NOT NULL    UNIQUE,  
    CANTIDAD_DETALLE_VENTA  INT                         NOT NULL    DEFAULT 0,
    TOTAL_DETALLE_VENTA     DECIMAL(5,2)                NOT NULL    DEFAULT 0,
    CONSTRAINT FK_DETALLEVENTA_VENTA FOREIGN KEY (ID_VENTA) REFERENCES VENTA(ID_VENTA),
    CONSTRAINT FK_DETALLEVENTA_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);

-- TABLE DROPING DETALLE_VENTA ==================================================
DROP TABLE DETALLE_VENTA;