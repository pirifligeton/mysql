CREATE DATABASE sistemaventa;

USE sistemaventa;

CREATE TABLE
    `usuario` (
        `idusuario` int NOT NULL AUTO_INCREMENT,
        `usuario` varchar(20) NOT NULL,
        `password` tinyblob NOT NULL,
        PRIMARY KEY (`idusuario`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = latin1;

CREATE TABLE
    `producto` (
        `codigoproducto` int NOT NULL,
        `nombre` varchar(100) NOT NULL,
        `precio` decimal(18, 2) NOT NULL,
        PRIMARY KEY (`codigoproducto`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
    usuario (idusuario, usuario, password)
VALUES (
        1,
        'jperezgil',
        AES_ENCRYPT('admin', 'IDAT')
    );

ALTER USER
    'root' @'localhost' IDENTIFIED
WITH
    mysql_native_password BY 'root';

flush privileges;

SELECT * FROM usuario;

--SELECT *,AES_DECRYPT(password,'IDAT') FROM usuario WHERE idusuario=1 AND password=AES_ENCRYPT('admin','IDAT');

--DELETE FROM usuario WHERE idusuario=1