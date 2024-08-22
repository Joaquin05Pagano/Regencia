drop database mecanica;

create database mecanica;

use mecanica;

create table alumnos (
    dni_alumnos bigint not null unique,
    nombre_alumnos varchar(100) not null,
    fecha_naci_alumnos date not null,
    direccion_alumnos varchar(100) not null,
    localidad_alumnos varchar(100) not null,
    cod_postal_alumnos int not null,
    tel_alumnos varchar(100) not null,
    gmail_alumnos varchar(100) not null,
    constraint pk_dni primary key (dni_alumnos)
);

create table tutores (
    dni_alumno_hijo bigint not null unique,
    nombre_alumnos_hijo varchar(100) not null,
    dni_tutor bigint not null unique,
    nombre_tutor varchar(100) not null,
    fecha_naci_tutor date not null,
    tel_tutor varchar(100) not null,
    direccion_tutor varchar(100) not null,
    localidad_tutor varchar(100) not null,
    gmail_tutor varchar(100) not null,
    constraint pk_dni primary key (tutor)
    foreign key (dni_alumno_hijo), 
    references alumnos (dni_alumnos)
);

create table inasistencias (
    dni_alumnos_inasistencias bigint not null unique,
    nombre_alumno_inasistencias varchar(100) not null,
    cantidad_inasistencias bigint not null,
    constraint pk_inasistencias primary key (dni_alumnos_inasistencias),
    foreign key (dni_alumnos_inasistencias), 
    references alumnos (dni_alumnos)
);

create table cursos (
    dni_alumno_curso bigint not null unique,
    aula_curso bigint not null,
    anio_curso bigint not null,
    division_curso bigint not null,
    preceptor_curso varchar(100) not null,
    constraint pk_dni primary key (aula_curso),
    foreign key (dni_alumno_curso),
    references alumnos (dni_alumnos)
);

create table faltas (
    codigo_falta bigint not null unique,
    dni_alumno_falta bigint not null unique,
    alumno_falta varchar(100) not null,
    fecha_falta date not null,
    motivo_falta varchar(100) not null,
    descripcion_falta text,
    constraint pk_dni primary key (codigo_falta),
    foreign key (dni_alumno_falta), 
    references alumnos (dni_alumnos)
);

create table observaciones (
    codigo_falta_observaciones bigint not null unique,
    observacion_observaciones text,
    constraint pk_observaciones primary key (codigo_falta_observaciones),
    foreign key (codigo_falta_observaciones),
    references faltas (codigo_falta)
);

create table grados (
    codigo_falta_grado bigint not null unique,
    instancia_grado varchar(100) not null,
    consideracion_alternativa_grado varchar(100) not null,
    constraint pk_grado primary key (codigo_falta_grado),
    foreign key (codigo_falta_grado),
    references faltas (codigo_falta)
);

create table notificaion_tutores (
    codigo_falta_notificacion bigint not null unique,
    fecha_notificacion_a date not null,
    dni_tutor_notificacion bigint not null unique,
    nombre_tutor_notificacion varchar(100) not null,
    fecha_notificacion_pm date not null,
    constraint pk_notificaion_tutores primary key (codigo_falta_notificacion),
    foreign key (codigo_falta_notificacion) 
    references faltas (codigo_falta), 
    foreign key (dni_tutor_notificacion),
    references tutores (dni_tutor)
);

create table regente (
    dni_regente bigint not null unique,
    nombre_regente varchar(100) not null,
    fecha_naci_regente date not null,
    direccion_regente varchar(100) not null,
    localidad_regente varchar(100) not null,
    cod_postal_regente int not null,
    tel_regente varchar(100) not null,
    gmail_regente varchar(100) not null,
);