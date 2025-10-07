CREATE TABLE alumno (
	legajo INTEGER PRIMARY KEY, -- ya que es un numero entero unico
  	nombre VARCHAR(255), -- ya que es un nombre
  	dni CHAR(8) UNIQUE,
    telefono CHAR(10), 
  	fecha_nacimiento DATE -- ya que es una fecha 
);

CREATE TABLE comision (
	numero INTEGER, -- ya que es un numero entero 
  	materia VARCHAR(255), -- ya que es el nombre de la materia 
  	nombre_profesor VARCHAR(255) UNIQUE, -- ya que es el nombre del profesor
  	CONSTRAINT comision_pk PRIMARY KEY (numero, materia)
);

CREATE TABLE pregunta (
	consigna VARCHAR(255), -- ya que guarda el nombre de la consigna 
  	numero INTEGER, -- ya que guarda el numero de la comision
  	materia VARCHAR(255), -- ya que guarda el nombre de la materia
  	tema VARCHAR(50) CHECK (tema IN ('matematica','lengua','geografia','historia')),
  	dificultad VARCHAR(255), -- ya que guarda el nombre de la dificultad
	CONSTRAINT pregunta_pk PRIMARY KEY (consigna, numero, materia),
  	FOREIGN KEY (numero,materia) REFERENCES comision(numero, materia)
);

CREATE TABLE respuesta (
	legajo INTEGER, -- ya que es un numero entero
  	consigna VARCHAR(255), -- ya que guarda el numero de la consigna
  	numero INTEGER, -- ya que guarda el numero de la comision
  	materia VARCHAR(255), -- ya que guarda el nombre de la materia 
  	legajo_docente INTEGER, -- ya que guarda el numero de legajo
  	opcion VARCHAR(255),
  	puntaje DECIMAL(5,2) CHECK (puntaje >= 0 AND puntaje <= 100),
  
  	CONSTRAINT respuesta_pk PRIMARY KEY (legajo, consigna, numero, materia, legajo_docente),
  	FOREIGN KEY (legajo) REFERENCES alumno(legajo),
  	FOREIGN KEY (consigna, numero, materia) REFERENCES pregunta(consigna, numero, materia)
);