-- Persona
INSERT INTO `marketplacebd`.`persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `foto`, `correo`) VALUES ('1', 'Paul', 'Ga1', '123', 'not', 'asd@gmail.com');
INSERT INTO `marketplacebd`.`persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `foto`, `correo`) VALUES ('2', 'Lherner', 'Ga2', '456', 'not', 'asd2@gmail.com');
INSERT INTO `marketplacebd`.`persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `foto`, `correo`) VALUES ('3', 'Susan', 'Ga3', '789', 'not', 'asd3@gmail.com');
INSERT INTO `marketplacebd`.`persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `foto`, `correo`, `numero_ruc`) VALUES ('4', 'Comprador', 'Compa1', '312', 'not', 'asd4@gmail.com', 'RUC123458');
INSERT INTO `marketplacebd`.`persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `foto`, `correo`, `numero_ruc`) VALUES ('5', 'Comprador2', 'Compa2', '231', 'not', 'asd5@gmail.com', 'RUC123459');

-- Producto
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('1', 'P1', 'PoloP1', 'Polo blanco', '20', '5', 'https://cutt.ly/IhwAUQa');
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('2', 'P2', 'PoloP2', 'Polo negro', '30', '10', 'https://cutt.ly/9hwAIZW');
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('3', 'L1', 'Camisa1', 'Camisa a cuadros', '40', '20', 'https://cutt.ly/HhwAO4t');
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('4', 'L2', 'Camisa2', 'Camisa a rayas', '60', '6', 'https://cutt.ly/nhwAPCx');
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('5', 'S1', 'Zapato1', 'Zapato blanco', '80', '15', 'https://cutt.ly/NhwAD90');
INSERT INTO `marketplacebd`.`producto` (`idproducto`, `codigo`, `nombre`, `descripcion`, `precio_unitario`, `cantidad`, `url`) VALUES ('6', 'S2', 'Zapato2', 'Zapato negro', '100', '20', 'https://cutt.ly/RhwAGrx');

-- seguimiento
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('1', 'Pago pendiente');
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('2', 'Pago comprobado');
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('3', 'Salida de tienda');
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('4', 'Pedido en transporte');
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('5', 'Llegada a ciudad destino');
INSERT INTO `marketplacebd`.`seguimiento` (`id_seguimiento`, `tipo_seguimiento`) VALUES ('6', 'Entrega completada');


-- Pedido
INSERT INTO `marketplacebd`.`pedido` (`idpedido`, `codigo`, `fecha`, `direccion_entrega`, `cantidad_producto`, `precio_producto`, `precio_ofertado`, `descuento_producto`, `idproducto`, `idpersona`, `idseguimiento`) VALUES ('1', 'A1', '2020-01-01 10:10:10', 'Jr. Osvaldo', '4', '70', '60', '10', '1','4', '1');
INSERT INTO `marketplacebd`.`pedido` (`idpedido`, `codigo`, `fecha`, `direccion_entrega`, `cantidad_producto`, `precio_producto`, `precio_ofertado`, `descuento_producto`, `idproducto`, `idpersona`, `idseguimiento`) VALUES ('2', 'A2', '2020-01-01 10:10:10', 'Jr. Osvaldo', '2', '60', '50', '10', '2','4', '2');
INSERT INTO `marketplacebd`.`pedido` (`idpedido`, `codigo`, `fecha`, `direccion_entrega`, `cantidad_producto`, `precio_producto`, `precio_ofertado`, `descuento_producto`, `idproducto`, `idpersona`, `idseguimiento`) VALUES ('3', 'B1', '2020-02-02 10:10:10', 'Jr. Libertad', '6', '50', '40', '10', '3','5', '3');
INSERT INTO `marketplacebd`.`pedido` (`idpedido`, `codigo`, `fecha`, `direccion_entrega`, `cantidad_producto`, `precio_producto`, `precio_ofertado`, `descuento_producto`, `idproducto`, `idpersona`, `idseguimiento`) VALUES ('4', 'B2', '2020-02-02 10:10:10', 'Jr. Libertad', '5', '40', '20', '20', '4','5', '1');



-- Producto favorito
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('1', '1', '1');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('2', '3', '2');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('3', '3', '3');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('4', '5', '3');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('5', '5', '4');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('6', '6', '1');
INSERT INTO `marketplacebd`.`producto_favorito` (`idproductofavorito`, `producto_idproducto`, `persona_idpersona`) VALUES ('7', '6', '3');



-- Pagar pedidos
UPDATE `marketplacebd`.`pedido` SET `estado_pedido` = '1' WHERE (`idpedido` = '1');
UPDATE `marketplacebd`.`pedido` SET `estado_pedido` = '1' WHERE (`idpedido` = '2');

-- actualizar pedido con factura a NULL
UPDATE `marketplacebd`.`pedido` SET `idfactura` = NULL WHERE (`idpedido` = '1');
UPDATE `marketplacebd`.`pedido` SET `idfactura` = NULL WHERE (`idpedido` = '2');
