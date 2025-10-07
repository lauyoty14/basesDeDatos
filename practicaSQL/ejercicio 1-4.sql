CREATE TABLE local (
	ciudad VARCHAR(255), -- varchar para modelar el nombre de la ciudad
  	legajo_gerente INTEGER, -- para identificar al gerente
  	cant_pisos INTEGER, -- integer para modelar la cantidad de pisos
  	horario_cierre time,
  
  	CONSTRAINT local_pk PRIMARY KEY (ciudad, legajo_gerente)
);

CREATE TABLE factura(
	nombre VARCHAR(255), -- varchar para modelar el nombre de la factura
  	gusto VARCHAR(255), -- para modelar el nombre del gusto
  	peso INTEGER CHECK (peso > 0),
    ancho INTEGER CHECK (ancho > 0),
    alto INTEGER CHECK (alto > 0), 
  	tiene_crema BOOLEAN, -- para modelar si tiene crema o no 
  	tiene_ddl BOOLEAN, -- para modela si tiene ddl o no
  
  	CONSTRAINT factura_pk PRIMARY KEY (nombre, gusto)
);

CREATE TABLE pedido (
	cliente VARCHAR(255), -- para modelar el nombre del cliente 
  	nro_pedido INTEGER UNIQUE, -- para modelar el numero unico de cada pedido 
  	total_final INTEGER CHECK (total_final >= 0),
    total_IVA INTEGER CHECK (total_IVA >= 0),
  	fecha_entrega_estimada DATE, -- para modelar la fecha de entrega del pedido
  	seña INTEGER CHECK (seña >= 0),
  
  	CONSTRAINT pedido_pk PRIMARY KEY (cliente, nro_pedido)
);

CREATE TABLE incluye (
	nombre VARCHAR(255), -- para modelar el nombre de la factura
  	gusto VARCHAR(255), -- para modelar el gusto de la factura
  	cliente VARCHAR(255), -- para modelar el cliente del pedido 
	nro_pedido INTEGER,
  
  	CONSTRAINT incluye_pk PRIMARY KEY (nombre, gusto, cliente, nro_pedido),
  	FOREIGN KEY (nombre, gusto) REFERENCES factura(nombre, gusto),
  	FOREIGN KEY (cliente, nro_pedido) REFERENCES pedido(cliente, nro_pedido)
);

CREATE TABLE entrega (
  	ciudad VARCHAR(255), -- para modelar el nombre de la factura
  	cliente VARCHAR(255), -- para modelar el cliente del pedido 
	nro_pedido INTEGER,  -- para modelar el numero del pedido	
	gerente integer, -- para modelar el legajo del gerente 
  	fecha_entrega_pedido date, -- para modelar la fecha de entrega del pedido
  
  	CONSTRAINT entrega_pk PRIMARY KEY (cliente , nro_pedido, ciudad, gerente),
  	FOREIGN KEY (cliente, nro_pedido) REFERENCES pedido(cliente, nro_pedido),
  	FOREIGN KEY (ciudad, gerente) REFERENCES local (ciudad, legajo_gerente)
);