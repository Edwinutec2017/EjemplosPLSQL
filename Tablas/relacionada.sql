/*creacion de tablas relacionadas*/
create table MUNICIPIOS(
id_municipios int not null,
nombre_municipios varchar(200) not null,
id_departamento_municipio int not null,
CONSTRAINT PK_MUNICIPIO PRIMARY KEY (id_municipios),
CONSTRAINT FK_DEPARTAMENTO FOREIGN KEY (id_departamento_municipio) REFERENCES DEPARTAMENTO(id_departamento)
);
/**/