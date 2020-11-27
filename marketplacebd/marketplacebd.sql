-- MySQL Workbench Forward Engineering
USE marketplacebd;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marketplacebd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `cupon_descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupon_descuento` (
  `idcupon` INT NOT NULL AUTO_INCREMENT,
  `monto_descuento` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idcupon`),
  UNIQUE INDEX `idCuponDescuento_UNIQUE` (`idcupon` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `idtarjeta` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_tarjeta` VARCHAR(16) NOT NULL,
  `cod_erificacion_tarjeta` VARCHAR(3) NOT NULL,
  `fecha_deposito` DATETIME NOT NULL,
  `monto_deposito` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idtarjeta`),
  UNIQUE INDEX `idDeposito_UNIQUE` (`idtarjeta` ASC) VISIBLE,
  UNIQUE INDEX `numeroTarjeta_UNIQUE` (`numero_tarjeta` ASC) VISIBLE,
  UNIQUE INDEX `codVerificaciónTarjeta_UNIQUE` (`cod_erificacion_tarjeta` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pago` (
  `idpago` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(45) NOT NULL,
  `fecha_pago` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `impuesto` DECIMAL(10,2) NOT NULL,
  `idcupon` INT NOT NULL,
  `idtarjeta` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpago`),
  UNIQUE INDEX `idPago_UNIQUE` (`idpago` ASC) VISIBLE,
  INDEX `fk_pago_cupon_descuento1_idx` (`idcupon` ASC) VISIBLE,
  INDEX `fk_pago_tarjeta1_idx` (`idtarjeta` ASC) VISIBLE,
  CONSTRAINT `fk_pago_cupon_descuento1`
    FOREIGN KEY (`idcupon`)
    REFERENCES `cupon_descuento` (`idcupon`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_pago_tarjeta1`
    FOREIGN KEY (`idtarjeta`)
    REFERENCES `tarjeta` (`idtarjeta`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boleta` (
  `idboleta` INT NOT NULL,
  `cantidad_producto` INT NOT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idboleta`),
  UNIQUE INDEX `idBoletaVenta_UNIQUE` (`idboleta` ASC) VISIBLE,
  INDEX `fk_boleta_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_boleta_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `regalo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `regalo` (
  `idregalo` INT NOT NULL AUTO_INCREMENT,
  `descripcion_regalo` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `puntos_requeridos` VARCHAR(45) NOT NULL DEFAULT '0' COMMENT 'Puntos necesarios para que un comprador pueda tener un regalo.',
  PRIMARY KEY (`idregalo`),
  UNIQUE INDEX `idRegalo_UNIQUE` (`idregalo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comprador_frecuente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comprador_frecuente` (
  `idcompradorfrecuente` INT NOT NULL AUTO_INCREMENT,
  `puntos_acumulados` INT UNSIGNED NULL DEFAULT NULL,
  `idregalo` INT NOT NULL,
  PRIMARY KEY (`idcompradorfrecuente`),
  UNIQUE INDEX `idCompradorFrecuente_UNIQUE` (`idcompradorfrecuente` ASC) VISIBLE,
  INDEX `fk_comprador_frecuente_regalo1_idx` (`idregalo` ASC) VISIBLE,
  CONSTRAINT `fk_comprador_frecuente_regalo1`
    FOREIGN KEY (`idregalo`)
    REFERENCES `regalo` (`idregalo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(90) NOT NULL,
  `contrasenia` VARCHAR(120) NOT NULL,
  `ultimo_login` TIMESTAMP NULL DEFAULT NULL,
  `idcompradorfrecuente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  INDEX `fk_usuario_comprador_frecuente1_idx` (`idcompradorfrecuente` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_comprador_frecuente1`
    FOREIGN KEY (`idcompradorfrecuente`)
    REFERENCES `comprador_frecuente` (`idcompradorfrecuente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carrito` (
  `idcarrito` INT NOT NULL,
  `idusuario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idcarrito`),
  INDEX `fk_carrito_compra_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_compra_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `garantia_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `garantia_producto` (
  `idgarantiaproducto` INT NOT NULL AUTO_INCREMENT,
  `inicio_garantia` DATETIME NOT NULL,
  `final_garantia` DATETIME NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idgarantiaproducto`),
  UNIQUE INDEX `idGarantiaProducto_UNIQUE` (`idgarantiaproducto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(9) NULL DEFAULT NULL,
  `foto` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `idusuario` INT NULL DEFAULT NULL,
  `numero_ruc` VARCHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE INDEX `idCuentaUsuario_UNIQUE` (`idpersona` ASC) VISIBLE,
  INDEX `fk_CuentaUsuario_Usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_CuentaUsuario_Usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_destacado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto_destacado` (
  `idproductodestacado` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idproductodestacado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `cantidad` TINYINT NOT NULL,
  `estadoseleccionoferta` TINYINT(1) NOT NULL DEFAULT '0',
  `idgarantiaproducto` INT NULL DEFAULT NULL,
  `url` VARCHAR(300) NULL DEFAULT NULL,
  `idproductodestacado` INT NULL DEFAULT NULL,
  `idpersona` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idproducto` ASC) VISIBLE,
  UNIQUE INDEX `codigoProducto_UNIQUE` (`codigo` ASC) VISIBLE,
  INDEX `fk_producto_garantia_producto1_idx` (`idgarantiaproducto` ASC) VISIBLE,
  INDEX `fk_producto_producto_destacado1_idx` (`idproductodestacado` ASC) VISIBLE,
  INDEX `fk_producto_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_producto_garantia_producto1`
    FOREIGN KEY (`idgarantiaproducto`)
    REFERENCES `garantia_producto` (`idgarantiaproducto`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_producto_destacado1`
    FOREIGN KEY (`idproductodestacado`)
    REFERENCES `producto_destacado` (`idproductodestacado`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `carrito_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carrito_producto` (
  `idcarritoproducto` INT NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idcarrito` INT NOT NULL,
  PRIMARY KEY (`idcarritoproducto`),
  INDEX `fk_carrito_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_carrito_producto_carrito1_idx` (`idcarrito` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_producto_carrito1`
    FOREIGN KEY (`idcarrito`)
    REFERENCES `carrito` (`idcarrito`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_carrito_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `idTipoProducto_UNIQUE` (`idcategoria` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `idcategoriaproducto` VARCHAR(45) NOT NULL,
  `idproducto` BIGINT NOT NULL,
  `idcategoria` INT NOT NULL,
  PRIMARY KEY (`idcategoriaproducto`),
  INDEX `fk_producto_has_categoria_categoria1_idx` (`idcategoria` ASC) VISIBLE,
  INDEX `fk_producto_has_categoria_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_categoria_categoria1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_producto_has_categoria_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `categoria_subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categoria_subcategoria` (
  `idcategoriasubcategoria` INT NOT NULL AUTO_INCREMENT,
  `idcategoria` INT NOT NULL,
  `idsubcategoria` INT NOT NULL,
  PRIMARY KEY (`idcategoriasubcategoria`),
  UNIQUE INDEX `idcategoriasubcategoria_UNIQUE` (`idcategoriasubcategoria` ASC) VISIBLE,
  INDEX `fk_categoria_has_categoria_categoria2_idx` (`idsubcategoria` ASC) VISIBLE,
  INDEX `fk_categoria_has_categoria_categoria1_idx` (`idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_has_subcategoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_subcategoria_has_categoria`
    FOREIGN KEY (`idsubcategoria`)
    REFERENCES `categoria` (`idcategoria`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura` (
  `idfactura` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `igv` FLOAT UNSIGNED NOT NULL,
  `subtotal` FLOAT UNSIGNED NOT NULL,
  `numero_ruc` VARCHAR(11) NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idfactura`),
  UNIQUE INDEX `numeroRUC_UNIQUE` (`numero_ruc` ASC) VISIBLE,
  UNIQUE INDEX `idFactura_UNIQUE` (`idfactura` ASC) VISIBLE,
  INDEX `idpersona_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `idpersona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguimiento` (
  `id_seguimiento` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_seguimiento` VARCHAR(124) NULL DEFAULT NULL,
  PRIMARY KEY (`id_seguimiento`),
  UNIQUE INDEX `id_seguimiento_UNIQUE` (`id_seguimiento` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `direccion_entrega` VARCHAR(50) NOT NULL,
  `cantidad_producto` INT NOT NULL,
  `estado_pedido` TINYINT NOT NULL DEFAULT '0',
  `precio_producto` FLOAT NOT NULL,
  `precio_ofertado` FLOAT NULL DEFAULT NULL,
  `descuento_producto` FLOAT NOT NULL,
  `idpago` INT NULL DEFAULT NULL,
  `idfactura` INT NULL DEFAULT NULL,
  `idproducto` BIGINT NULL DEFAULT NULL,
  `idpersona` INT NULL DEFAULT NULL,
  `idseguimiento` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE INDEX `codigoPedido_UNIQUE` (`codigo` ASC) VISIBLE,
  UNIQUE INDEX `idPedido_UNIQUE` (`idpedido` ASC) VISIBLE,
  INDEX `fk_pedido_pago1_idx` (`idpago` ASC) VISIBLE,
  INDEX `fk_pedidio_factura1_idx` (`idfactura` ASC) VISIBLE,
  INDEX `fk_idpedido_producto1_idx` (`idproducto` ASC) VISIBLE,
  INDEX `fk_idpersona_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_pedido_seguimiento1_idx` (`idseguimiento` ASC) VISIBLE,
  CONSTRAINT `fk_idpedido_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_idpersona_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_pedidio_factura1`
    FOREIGN KEY (`idfactura`)
    REFERENCES `factura` (`idfactura`),
  CONSTRAINT `fk_pedido_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_pedido_seguimiento1`
    FOREIGN KEY (`idseguimiento`)
    REFERENCES `seguimiento` (`id_seguimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comentario` (
  `idcomentario` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `puntaje` TINYINT NULL DEFAULT NULL,
  `idusuario` INT NOT NULL,
  `idpedido` BIGINT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `fk_comentario_usuario1_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_comentario_pedido1_idx` (`idpedido` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_pedido1`
    FOREIGN KEY (`idpedido`)
    REFERENCES `pedido` (`idpedido`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `direccion` (
  `iddireccion` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `distrito` VARCHAR(45) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iddireccion`),
  UNIQUE INDEX `idDireccion_UNIQUE` (`iddireccion` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imagen_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imagen_producto` (
  `idimagenproducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(586) NULL DEFAULT NULL,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idimagenproducto`),
  UNIQUE INDEX `idImagenProducto_UNIQUE` (`idimagenproducto` ASC) VISIBLE,
  INDEX `fk_imagen_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_imagen_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulo` (
  `idmodulo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `icono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmodulo`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `idModulo_UNIQUE` (`idmodulo` ASC) VISIBLE,
  UNIQUE INDEX `icono_UNIQUE` (`icono` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `oferta_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oferta_producto` (
  `idofertaproducto` BIGINT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NULL,
  `precio_oferta` DOUBLE NULL,
  `fecha_inicio` DATE NULL,
  `fecha_limite` DATE NULL,
  `estado` TINYINT(1) NULL,
  `idproducto` BIGINT NULL,
  PRIMARY KEY (`idofertaproducto`),
  INDEX `fk_oferta_producto_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_oferta_producto_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sub_modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sub_modulo` (
  `idsubmodulo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` TINYINT NOT NULL,
  `idmodulo` INT NOT NULL,
  PRIMARY KEY (`idsubmodulo`),
  UNIQUE INDEX `idSubModulo_UNIQUE` (`idsubmodulo` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `estado_UNIQUE` (`estado` ASC) VISIBLE,
  INDEX `fk_sub_modulo_modulo1_idx` (`idmodulo` ASC) VISIBLE,
  CONSTRAINT `fk_sub_modulo_modulo1`
    FOREIGN KEY (`idmodulo`)
    REFERENCES `modulo` (`idmodulo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `opcion` (
  `idopcion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` TINYINT NOT NULL,
  `idsubmodulo` INT NOT NULL,
  PRIMARY KEY (`idopcion`),
  UNIQUE INDEX `idOpcion_UNIQUE` (`idopcion` ASC) VISIBLE,
  INDEX `fk_opcion_sub_modulo1_idx` (`idsubmodulo` ASC) VISIBLE,
  CONSTRAINT `fk_opcion_sub_modulo1`
    FOREIGN KEY (`idsubmodulo`)
    REFERENCES `sub_modulo` (`idsubmodulo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persona_direccion` (
  `idpersonadireccion` INT NOT NULL,
  `iddireccion` INT NOT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idpersonadireccion`),
  INDEX `fk_persona_direccion_direccion1_idx` (`iddireccion` ASC) VISIBLE,
  INDEX `fk_persona_direccion_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_persona_direccion_direccion1`
    FOREIGN KEY (`iddireccion`)
    REFERENCES `direccion` (`iddireccion`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_persona_direccion_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`),
  UNIQUE INDEX `nombreRol_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persona_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persona_rol` (
  `idpersonarol` INT NOT NULL AUTO_INCREMENT,
  `estado` TINYINT NOT NULL,
  `idpersona` INT NOT NULL,
  `idrol` INT NOT NULL,
  PRIMARY KEY (`idpersonarol`),
  UNIQUE INDEX `idPersonaRol_UNIQUE` (`idpersonarol` ASC) VISIBLE,
  INDEX `fk_persona_rol_persona1_idx` (`idpersona` ASC) VISIBLE,
  INDEX `fk_persona_rol_rol1_idx` (`idrol` ASC) VISIBLE,
  CONSTRAINT `fk_persona_rol_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_persona_rol_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_deseado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto_deseado` (
  `idproductodeseado` INT NOT NULL AUTO_INCREMENT,
  `idproducto` BIGINT NOT NULL,
  PRIMARY KEY (`idproductodeseado`),
  UNIQUE INDEX `idProductoDeseado_UNIQUE` (`idproductodeseado` ASC) VISIBLE,
  INDEX `fk_producto_deseado_producto1_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_deseado_producto1`
    FOREIGN KEY (`idproducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `producto_favorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto_favorito` (
  `idproductofavorito` INT NOT NULL,
  `producto_idproducto` BIGINT NOT NULL,
  `persona_idpersona` INT NOT NULL,
  PRIMARY KEY (`idproductofavorito`),
  INDEX `fk_producto_favorito_producto1_idx` (`producto_idproducto` ASC) VISIBLE,
  INDEX `fk_producto_favorito_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_producto_favorito_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `persona` (`idpersona`),
  CONSTRAINT `fk_producto_favorito_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reclamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reclamo` (
  `idreclamo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL,
  `tipo_reclamo` VARCHAR(80) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idreclamo`),
  UNIQUE INDEX `idLibro_UNIQUE` (`idreclamo` ASC) VISIBLE,
  INDEX `fk_Reclamo_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Reclamo_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `usuario` (`idusuario`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reporte` (
  `idreporte` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL DEFAULT NULL,
  `idpersona` INT NOT NULL,
  PRIMARY KEY (`idreporte`),
  INDEX `fk_reporte_persona1_idx` (`idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_reporte_persona1`
    FOREIGN KEY (`idpersona`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rol_opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rol_opcion` (
  `idrolopcion` INT NOT NULL,
  `idrol` INT NOT NULL,
  `idopcion` INT NOT NULL,
  PRIMARY KEY (`idrolopcion`),
  UNIQUE INDEX `idRolOpcioncol_UNIQUE` (`idrolopcion` ASC) VISIBLE,
  INDEX `fk_rol_opcion_rol1_idx` (`idrol` ASC) VISIBLE,
  INDEX `fk_rol_opcion_opcion1_idx` (`idopcion` ASC) VISIBLE,
  CONSTRAINT `fk_rol_opcion_opcion1`
    FOREIGN KEY (`idopcion`)
    REFERENCES `opcion` (`idopcion`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_rol_opcion_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `rol` (`idrol`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `valoracion_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `valoracion_vendedor` (
  `idvaloracion` INT NOT NULL AUTO_INCREMENT,
  `puntaje` TINYINT NOT NULL COMMENT 'Este puntaje va hacer la valoracion al vendedor(rol)',
  `idvendedor` INT NOT NULL,
  `idcomprador` INT NOT NULL,
  PRIMARY KEY (`idvaloracion`),
  UNIQUE INDEX `idvaloracion_UNIQUE` (`idvaloracion` ASC) VISIBLE,
  INDEX `fk_valoracion_persona1_idx` (`idvendedor` ASC) VISIBLE,
  INDEX `fk_valoracion_persona2_idx` (`idcomprador` ASC) VISIBLE,
  CONSTRAINT `fk_valoracion_persona1`
    FOREIGN KEY (`idvendedor`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_valoracion_persona2`
    FOREIGN KEY (`idcomprador`)
    REFERENCES `persona` (`idpersona`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `idpago` INT NOT NULL,
  PRIMARY KEY (`idventa`),
  UNIQUE INDEX `idVenta_UNIQUE` (`idventa` ASC) VISIBLE,
  INDEX `fk_venta_pago1_idx` (`idpago` ASC) VISIBLE,
  CONSTRAINT `fk_venta_pago1`
    FOREIGN KEY (`idpago`)
    REFERENCES `pago` (`idpago`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `venta_reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venta_reporte` (
  `idventareporte` INT NOT NULL AUTO_INCREMENT,
  `tipo_reporte` VARCHAR(80) NOT NULL,
  `idreporte` INT NOT NULL,
  `idventa` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idventareporte`),
  INDEX `fk_venta_reporte_reporte1_idx` (`idreporte` ASC) VISIBLE,
  INDEX `fk_venta_reporte_venta1_idx` (`idventa` ASC) VISIBLE,
  CONSTRAINT `fk_venta_reporte_reporte1`
    FOREIGN KEY (`idreporte`)
    REFERENCES `reporte` (`idreporte`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_venta_reporte_venta1`
    FOREIGN KEY (`idventa`)
    REFERENCES `venta` (`idventa`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
