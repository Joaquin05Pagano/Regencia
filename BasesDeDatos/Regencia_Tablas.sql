drop database if exists regencia;
create database regencia;
use regencia;

-- Creacion de usuarios
CREATE USER 'regente'@'localhost' IDENTIFIED BY 'password_regente';
CREATE USER 'viceregente'@'localhost' IDENTIFIED BY 'password_viceregente';
CREATE USER 'preceptor'@'localhost' IDENTIFIED BY 'password_preceptor';
CREATE USER 'profesor'@'localhost' IDENTIFIED BY 'password_profesor';

-- Asignacion de privilegios

-- Regente: todos los privilegios en la base de datos
GRANT ALL PRIVILEGES ON regencia.* TO 'regente'@'localhost';

-- Viceregente: todos los privilegios excepto GRANT OPTION
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON regencia.* TO 'viceregente'@'localhost';

-- Preceptores: privilegios de seleccion e insercion, especialmente en las tablas relacionadas con asistencia y cursos
GRANT SELECT, INSERT, UPDATE ON regencia.inasistencias TO 'preceptor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON regencia.cursos TO 'preceptor'@'localhost';
GRANT SELECT ON regencia.alumnos TO 'preceptor'@'localhost';

-- Profesores: privilegios de seleccion en las tablas de alumnos, cursos y faltas
GRANT SELECT ON regencia.alumnos TO 'profesor'@'localhost';
GRANT SELECT ON regencia.cursos TO 'profesor'@'localhost';
GRANT SELECT ON regencia.faltas TO 'profesor'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;


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
    dni_alumno_hijo bigint not null,
    nombre_alumnos_hijo varchar(100) not null,
    dni_tutor bigint not null unique,
    nombre_tutor varchar(100) not null,
    fecha_naci_tutor date not null,
    tel_tutor varchar(100) not null,
    direccion_tutor varchar(100) not null,
    localidad_tutor varchar(100) not null,
    gmail_tutor varchar(100) not null,
    constraint pk_dni_tutor primary key (dni_tutor),
    foreign key (dni_alumno_hijo) references alumnos (dni_alumnos)
);

create table inasistencias (
    dni_alumnos_inasistencias bigint not null,
    nombre_alumno_inasistencias varchar(100) not null,
    cantidad_inasistencias bigint not null,
    constraint pk_inasistencias primary key (dni_alumnos_inasistencias),
    foreign key (dni_alumnos_inasistencias) references alumnos (dni_alumnos)
);

create table cursos (
    dni_alumno_curso bigint not null,
    aula_curso bigint not null,
    anio_curso bigint not null,
    division_curso bigint not null,
    preceptor_curso varchar(100) not null,
    constraint pk_aula_curso primary key (aula_curso),
    foreign key (dni_alumno_curso) references alumnos (dni_alumnos)
);

create table faltas (
    codigo_falta bigint not null unique,
    dni_alumno_falta bigint not null,
    alumno_falta varchar(100) not null,
    fecha_falta date not null,
    motivo_falta varchar(100) not null,
    descripcion_falta text,
    constraint pk_codigo_falta primary key (codigo_falta),
    foreign key (dni_alumno_falta) references alumnos (dni_alumnos)
);

create table observaciones (
    codigo_falta_observaciones bigint not null unique,
    observacion_observaciones text,
    constraint pk_observaciones primary key (codigo_falta_observaciones),
    foreign key (codigo_falta_observaciones) references faltas (codigo_falta)
);

create table grados (
    codigo_falta_grado bigint not null unique,
    instancia_grado varchar(100) not null,
    consideracion_alternativa_grado varchar(100) not null,
    constraint pk_grado primary key (codigo_falta_grado),
    foreign key (codigo_falta_grado) references faltas (codigo_falta)
);

create table notificaion_tutores (
    codigo_falta_notificacion bigint not null unique,
    fecha_notificacion_a date not null,
    dni_tutor_notificacion bigint not null,
    nombre_tutor_notificacion varchar(100) not null,
    fecha_notificacion_pm date not null,
    constraint pk_notificaion_tutores primary key (codigo_falta_notificacion),
    foreign key (codigo_falta_notificacion) references faltas (codigo_falta),
    foreign key (dni_tutor_notificacion) references tutores (dni_tutor)
);
