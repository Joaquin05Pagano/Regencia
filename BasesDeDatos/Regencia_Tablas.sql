-- Elimina la base de datos 'mecanica' si ya existe para evitar conflictos
DROP DATABASE mecanica;

-- Crea la base de datos 'mecanica'
CREATE DATABASE mecanica;

-- Selecciona la base de datos 'mecanica' para trabajar en ella
USE mecanica;

-- =======================
-- Tabla: alumnos
-- =======================
-- Almacena información personal de los alumnos.
CREATE TABLE alumnos (
    dni_alumnos BIGINT NOT NULL UNIQUE,  -- Documento de identidad del alumno (único)
    nombre_alumnos VARCHAR(100) NOT NULL,  -- Nombre completo del alumno
    fecha_naci_alumnos DATE NOT NULL,  -- Fecha de nacimiento del alumno
    direccion_alumnos VARCHAR(100) NOT NULL,  -- Dirección de residencia
    localidad_alumnos VARCHAR(100) NOT NULL,  -- Localidad del alumno
    cod_postal_alumnos INT NOT NULL,  -- Código postal de la localidad
    tel_alumnos VARCHAR(100) NOT NULL,  -- Teléfono de contacto
    gmail_alumnos VARCHAR(100) NOT NULL,  -- Correo electrónico
    CONSTRAINT pk_dni PRIMARY KEY (dni_alumnos)  -- Clave primaria: dni del alumno
);

-- =======================
-- Tabla: tutores
-- =======================
-- Registra a los tutores de los alumnos.
CREATE TABLE tutores (
    dni_alumno_hijo BIGINT NOT NULL UNIQUE,  -- Documento del alumno (único)
    nombre_alumnos_hijo VARCHAR(100) NOT NULL,  -- Nombre del alumno
    dni_tutor BIGINT NOT NULL UNIQUE,  -- Documento del tutor (único)
    nombre_tutor VARCHAR(100) NOT NULL,  -- Nombre del tutor
    fecha_naci_tutor DATE NOT NULL,  -- Fecha de nacimiento del tutor
    tel_tutor VARCHAR(100) NOT NULL,  -- Teléfono de contacto del tutor
    direccion_tutor VARCHAR(100) NOT NULL,  -- Dirección de residencia del tutor
    localidad_tutor VARCHAR(100) NOT NULL,  -- Localidad del tutor
    gmail_tutor VARCHAR(100) NOT NULL,  -- Correo electrónico del tutor
    CONSTRAINT pk_dni PRIMARY KEY (tutor),  -- Clave primaria: dni del tutor
    FOREIGN KEY (dni_alumno_hijo) REFERENCES alumnos (dni_alumnos)  -- Clave foránea: referencia al alumno
);

-- =======================
-- Tabla: inasistencias
-- =======================
-- Registra las inasistencias de los alumnos.
CREATE TABLE inasistencias (
    dni_alumnos_inasistencias BIGINT NOT NULL UNIQUE,  -- Documento del alumno (único)
    nombre_alumno_inasistencias VARCHAR(100) NOT NULL,  -- Nombre del alumno
    cantidad_inasistencias BIGINT NOT NULL,  -- Cantidad de inasistencias acumuladas
    CONSTRAINT pk_inasistencias PRIMARY KEY (dni_alumnos_inasistencias),  -- Clave primaria: dni del alumno
    FOREIGN KEY (dni_alumnos_inasistencias) REFERENCES alumnos (dni_alumnos)  -- Clave foránea
);

-- =======================
-- Tabla: cursos
-- =======================
-- Almacena los cursos asignados a los alumnos.
CREATE TABLE cursos (
    dni_alumno_curso BIGINT NOT NULL UNIQUE,  -- Documento del alumno (único)
    aula_curso BIGINT NOT NULL,  -- Número del aula
    anio_curso BIGINT NOT NULL,  -- Año del curso
    division_curso BIGINT NOT NULL,  -- División del curso
    preceptor_curso VARCHAR(100) NOT NULL,  -- Nombre del preceptor del curso
    CONSTRAINT pk_dni PRIMARY KEY (aula_curso),  -- Clave primaria: número de aula
    FOREIGN KEY (dni_alumno_curso) REFERENCES alumnos (dni_alumnos)  -- Clave foránea
);

-- =======================
-- Tabla: faltas
-- =======================
-- Registra las faltas individuales de los alumnos.
CREATE TABLE faltas (
    codigo_falta BIGINT NOT NULL UNIQUE,  -- Código único de la falta
    dni_alumno_falta BIGINT NOT NULL UNIQUE,  -- Documento del alumno (único)
    alumno_falta VARCHAR(100) NOT NULL,  -- Nombre del alumno
    fecha_falta DATE NOT NULL,  -- Fecha de la falta
    motivo_falta VARCHAR(100) NOT NULL,  -- Motivo de la falta
    descripcion_falta TEXT,  -- Descripción adicional de la falta
    CONSTRAINT pk_dni PRIMARY KEY (codigo_falta),  -- Clave primaria: código de la falta
    FOREIGN KEY (dni_alumno_falta) REFERENCES alumnos (dni_alumnos)  -- Clave foránea
);

-- =======================
-- Tabla: observaciones
-- =======================
-- Almacena observaciones relacionadas con las faltas.
CREATE TABLE observaciones (
    codigo_falta_observaciones BIGINT NOT NULL UNIQUE,  -- Código de la falta (único)
    observacion_observaciones TEXT,  -- Observación sobre la falta
    CONSTRAINT pk_observaciones PRIMARY KEY (codigo_falta_observaciones),  -- Clave primaria: código de la falta
    FOREIGN KEY (codigo_falta_observaciones) REFERENCES faltas (codigo_falta)  -- Clave foránea
);

-- =======================
-- Tabla: grados
-- =======================
-- Registra el estado o instancia de cada falta.
CREATE TABLE grados (
    codigo_falta_grado BIGINT NOT NULL UNIQUE,  -- Código de la falta (único)
    instancia_grado VARCHAR(100) NOT NULL,  -- Instancia de la falta
    consideracion_alternativa_grado VARCHAR(100) NOT NULL,  -- Consideración adicional sobre la falta
    CONSTRAINT pk_grado PRIMARY KEY (codigo_falta_grado),  -- Clave primaria: código de la falta
    FOREIGN KEY (codigo_falta_grado) REFERENCES faltas (codigo_falta)  -- Clave foránea
);

-- =======================
-- Tabla: notificaion_tutores
-- =======================
-- Registra las notificaciones enviadas a los tutores.
CREATE TABLE notificaion_tutores (
    codigo_falta_notificacion BIGINT NOT NULL UNIQUE,  -- Código de la falta (único)
    fecha_notificacion_a DATE NOT NULL,  -- Fecha de la notificación inicial
    dni_tutor_notificacion BIGINT NOT NULL UNIQUE,  -- Documento del tutor (único)
    nombre_tutor_notificacion VARCHAR(100) NOT NULL,  -- Nombre del tutor
    fecha_notificacion_pm DATE NOT NULL,  -- Fecha de seguimiento o segunda notificación
    CONSTRAINT pk_notificaion_tutores PRIMARY KEY (codigo_falta_notificacion),  -- Clave primaria: código de la falta
    FOREIGN KEY (codigo_falta_notificacion) REFERENCES faltas (codigo_falta),  -- Clave foránea: falta relacionada
    FOREIGN KEY (dni_tutor_notificacion) REFERENCES tutores (dni_tutor)  -- Clave foránea: tutor notificado
);

-- =======================
-- Tabla: regente
-- =======================
-- Almacena los datos del regente.
CREATE TABLE regente (
    dni_regente BIGINT NOT NULL UNIQUE,  -- Documento del regente (único)
    nombre_regente VARCHAR(100) NOT NULL,  -- Nombre del regente
    fecha_naci_regente DATE NOT NULL,  -- Fecha de nacimiento del regente
    direccion_regente VARCHAR(100) NOT NULL,  -- Dirección del regente
    localidad_regente VARCHAR(100) NOT NULL,  -- Localidad de residencia
    cod_postal_regente INT NOT NULL,  -- Código postal
    tel_regente VARCHAR(100) NOT NULL,  -- Teléfono del regente
    gmail_regente VARCHAR(100) NOT NULL  -- Correo electrónico del regente
);
