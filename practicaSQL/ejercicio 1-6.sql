CREATE TABLE comiqueria (
	nombre_comiqueria varchar(255) PRIMARY KEY, -- ya que es un nombre clave
  	forma_contributiva varchar(255) CHECK ( forma_contributiva in ('esquema piramidal', 
                                                                   'monotributo',
                                                                   'cooperativa',
                                                                   'empresa')),
 	ciudad varchar(255), -- ya que es el nombre de una ciudad 
  	direccion varchar(255), -- ya que guarda la direccion como cadena de texto
  	piso integer, -- ya que guarda el numero del piso 
  	local varchar(255) -- ya que guarda el nombre del local
  	CONSTRAINT comiqueria_unica UNIQUE (ciudad, direccion, piso, local)
);

CREATE TABLE editorial (
	nombre_editorial varchar(255) PRIMARY KEY, -- ya que es un nombre clave
  	jefe varchar(255), -- ya que guarda el nombre del jefe
  	nro_empleados integer CHECK (nro_empleados >= 0), -- ya que guarda el numero de empleados
  	al_dia_con_afip bool -- ya que guarda si estan o no al dia con la afip
);

CREATE TABLE comic (
	nombre varchar(255), --ya que es un nombre
  	tomo integer, -- ya que guarda el tomo del comic
  	demografia varchar(255) CHECK ( demografia in ('shonen', 'seinen', 'shoujo', 'josei')),
  	origen varchar(255), -- ya que guarda el nombre de la comiqueria de donde viene
  	edicion varchar(255), -- ya que guarda el nombre de la editorial
  	CONSTRAINT comic_pk PRIMARY KEY (nombre, tomo),
  	FOREIGN KEY (edicion) REFERENCES editorial(nombre_editorial)
);

CREATE TABLE venta (
	nombre varchar(255), -- ya que guarda el nombre del comic vendido
  	tomo integer, -- ya que guarda el tomo del comic vendido
  	nombre_comiqueria varchar(255), --ya que guarda el nombre de la comiqueria
  	fecha date, -- ya que guarda la fecha de la venta
  	cantidad_comprada integer, -- ya que guarda la cantidad de comics vendida
  	forma_pago varchar(255) CHECK (forma_pago IN ('transferencia', 'efectivo')),
  	CONSTRAINT venta_pk PRIMARY KEY (nombre, tomo, nombre_comiqueria, fecha),
  	CONSTRAINT venta_fk FOREIGN KEY (nombre, tomo) REFERENCES comic(nombre, tomo),
  	FOREIGN KEY nombre_comiqueria REFERENCES comiqueria(nombre_comiqueria)
);