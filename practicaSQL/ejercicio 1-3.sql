CREATE TABLE protector(
	pasaporte VARCHAR(255) PRIMARY KEY,
  	altura INTEGER,
  	peso INTEGER
);

CREATE TABLE herramienta(
	nombre varchar(255) PRIMARY KEY,
  	poder integer,
  	origen varchar(255),
  	pasaporte varchar(255),
  	CONSTRAINT herramienta_fk FOREIGN KEY (pasaporte) REFERENCES protector(pasaporte)
);

CREATE TABLE ciudad (
	nombre VARCHAR(255) PRIMARY key,
  	ubicacion VARCHAR(255),
  	poblacion INTEGER
);

CREATE TABLE protege(
	nombre VARCHAR(255),
  	pasaporte VARCHAR(255),
  	fecha DATE DEFAULT CURRENT_TIMESTAMP,
  	fue_exitoso BOOLEAN,
  
  	CONSTRAINT protege_pk PRIMARY KEY (nombre, pasaporte, fecha),
  	FOREIGN KEY (nombre) REFERENCES ciudad(nombre),
  	FOREIGN KEY (pasaporte) REFERENCES protector(pasaporte)
)