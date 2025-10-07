CREATE TABLE restaurante (
	razon_social VARCHAR(255) PRIMARY KEY,
  	fundacion TIMESTAMP,
   	cant_estrellas INTEGER
);

CREATE TABLE maestro (
	nombre VARCHAR(255),
  	restaurante VARCHAR(255),
  	fecha_nac TIMESTAMP,
  	tiempo_profesional INTEGER,
  	CONSTRAINT maestro_pk PRIMARY KEY (nombre, restaurante),
  	CONSTRAINT maestro_fk FOREIGN KEY (restaurante) REFERENCES restaurante(razon_social)
);

CREATE TABLE participante(
	apodo VARCHAR(255),
  	edad INTEGER,
  	ciudad VARCHAR(255),
  	maestro VARCHAR(255),
  	restaurante VARCHAR(255),
 	CONSTRAINT participante_pk PRIMARY KEY (apodo, maestro, restaurante),
  	CONSTRAINT participante_fk FOREIGN KEY (maestro, restaurante) REFERENCES maestro(nombre, restaurante)
);

CREATE TABLE programa(
	numero INTEGER PRIMARY KEY,
  	fecha DATE DEFAULT CURRENT_TIMESTAMP,
  	hora_inicio TIME,
   	grabacion INTEGER
);

CREATE TABLE plato(
    plato VARCHAR(255),
    apodo VARCHAR(255),
    maestro VARCHAR(255),
    razon_social VARCHAR(255),
    tipo VARCHAR(255),
    es_vegano BOOLEAN,
    numero INTEGER,
    CONSTRAINT plato_pk PRIMARY KEY (plato, apodo, maestro, razon_social),
    FOREIGN KEY (apodo) REFERENCES participante(apodo),
    FOREIGN KEY (maestro, razon_social) REFERENCES maestro(nombre, restaurante),
    FOREIGN KEY (numero) REFERENCES programa(numero)
);