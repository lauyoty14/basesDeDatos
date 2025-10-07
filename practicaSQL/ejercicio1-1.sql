CREATE TABLE manada (
	region VARCHAR(255),
    origen VARCHAR(255),
    temperatura INTEGER,
    poblacion INTEGER,
    CONSTRAINT manda_pk PRIMARY KEY (region, origen)
);

alter TABLE manada add COLUMN temperatura DECIMAL(6,2);

CREATE TABLE lobo (
	nombre varchar(255),
  	peso INTEGER DEFAULT 0,
  	edad INTEGER,
  	region VARCHAR(255),
  	origen VARCHAR(255),
  	
   	CONSTRAINT lobo_pk PRIMARY KEY (nombre, region, origen),
    CONSTRAINT lobo_manada_fk FOREIGN KEY (region, origen) REFERENCES manada(region, origen)
);

CREATE TABLE rastreador (
	id serial PRIMARY KEY,
  	porcentaje_bateria DECIMAL(10,2)
)

CREATE TABLE encuentra (
	nombre VARCHAR(255),
  	region VARCHAR(255),
   	origen VARCHAR(255),
  	ID INTEGER,
  	fecha DATE DEFAULT CURRENT_TIMESTAMP,
  	CONSTRAINT encuentra_pk PRIMARY KEY (nombre, region, origen, id, fecha),
   	CONSTRAINT encuentra_lobo_fk FOREIGN KEY (nombre,region,origen) REFERENCES lobo(nombre, region, origen),
  	CONSTRAINT encuentra_rastreador_fk FOREIGN KEY (id) REFERENCES rastreador(id)
);