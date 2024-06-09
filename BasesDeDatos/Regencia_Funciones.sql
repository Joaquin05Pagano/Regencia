--------------------------------Tabla Alumnos--------------------------------

-- obtener_alumno_dni
delimiter //

create function obtener_alumno_dni(nombre_alumno varchar(100))
returns bigint
begin
    declare dni bigint;
    select dni_alumnos into dni from alumnos where nombre_alumnos = nombre_alumno;
    return dni;
end//

delimiter ;

-- obtener_nombre_alumno
delimiter //

create function obtener_nombre_alumno(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre varchar(100);
    select nombre_alumnos into nombre from alumnos where dni_alumnos = dni_alumno;
    return nombre;
end//

delimiter ;

-- obtener_fecha_nacimiento_alumno
delimiter //

create function obtener_fecha_nacimiento_alumno(dni_alumno bigint)
returns date
begin
    declare fecha_nacimiento date;
    select fecha_naci_alumnos into fecha_nacimiento from alumnos where dni_alumnos = dni_alumno;
    return fecha_nacimiento;
end//

delimiter ;

-- obtener_direccion_alumno
delimiter //

create function obtener_direccion_alumno(dni_alumno bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    select direccion_alumnos into direccion from alumnos where dni_alumnos = dni_alumno;
    return direccion;
end//

delimiter ;

-- obtener_localidad_alumno
delimiter //

create function obtener_localidad_alumno(dni_alumno bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    select localidad_alumnos into localidad from alumnos where dni_alumnos = dni_alumno;
    return localidad;
end//

delimiter ;

-- obtener_codigo_postal_alumno
delimiter //

create function obtener_codigo_postal_alumno(dni_alumno bigint)
returns int
begin
    declare cod_postal int;
    select cod_postal_alumnos into cod_postal from alumnos where dni_alumnos = dni_alumno;
    return cod_postal;
end//

delimiter ;

-- obtener_telefono_alumno
delimiter //

create function obtener_telefono_alumno(dni_alumno bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    select tel_alumnos into telefono from alumnos where dni_alumnos = dni_alumno;
    return telefono;
end//

delimiter ;

-- obtener_gmail_alumno
delimiter //

create function obtener_gmail_alumno(dni_alumno bigint)
returns varchar(100)
begin
    declare gmail varchar(100);
    select gmail_alumnos into gmail from alumnos where dni_alumnos = dni_alumno;
    return gmail;
end//

delimiter ;


--------------------------------Tabla tutores--------------------------------
-- obtener_dni_alumno_hijo
delimiter //

create function obtener_dni_alumno_hijo(dni_tutor bigint)
returns bigint
begin
    declare dni_hijo bigint;
    select dni_alumno_hijo into dni_hijo from tutores where dni_tutor = dni_tutor;
    return dni_hijo;
end//

delimiter ;

-- obtener_nombre_alumno_hijo 
delimiter //

create function obtener_nombre_alumno_hijo(dni_tutor bigint)
returns varchar(100)
begin
    declare nombre_alumno_hijo varchar(100);
    select nombre_alumnos_hijo into nombre_alumno_hijo from tutores where dni_tutor = dni_tutor;
    return nombre_alumno_hijo;
end//

delimiter ;

-- obtener_dni_tutor 
delimiter //

create function obtener_dni_tutor(dni_alumno_hijo bigint)
returns bigint
begin
    declare dni_tutor bigint;
    select dni_tutor into dni_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return dni_tutor;
end//

delimiter ;

-- obtener_nombre_tutor
delimiter //

create function obtener_nombre_tutor(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare nombre_tutor varchar(100);
    select nombre_tutor into nombre_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return nombre_tutor;
end//

delimiter ;

-- obtener_fecha_nacimiento_tutor
delimiter //

create function obtener_fecha_nacimiento_tutor(dni_alumno_hijo bigint)
returns date
begin
    declare fecha_nacimiento date;
    select fecha_naci_tutor into fecha_nacimiento from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return fecha_nacimiento;
end//

delimiter ;

-- obtener_direccion_tutor
delimiter //

create function obtener_direccion_tutor(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    select direccion_tutor into direccion from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return direccion;
end//

delimiter ;

-- obtener_localidad_tutor
delimiter //

create function obtener_localidad_tutor(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    select localidad_tutor into localidad from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return localidad;
end//

delimiter ;

-- obtener_telefono_tutor
delimiter //

create function obtener_telefono_tutor(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    select tel_tutor into telefono from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return telefono;
end//

delimiter ;



--------------------------------Tabla Inasistencias--------------------------------

-- obtener_dni_alumno_por_inasistencia
delimiter //

create function obtener_dni_alumno_por_inasistencia(codigo_inasistencia bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumnos_inasistencias into dni_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return dni_alumno;
end//

delimiter ;

-- obtener_nombre_alumno_por_inasistencia
delimiter //

create function obtener_nombre_alumno_por_inasistencia(codigo_inasistencia bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    select nombre_alumno_inasistencias into nombre_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return nombre_alumno;
end//

delimiter ;

-- obtener_cantidad_inasistencias
delimiter //

create function obtener_cantidad_inasistencias(dni_alumno bigint)
returns bigint
begin
    declare cantidad_inasistencias bigint;
    select sum(cantidad_inasistencias) into cantidad_inasistencias from inasistencias where dni_alumnos_inasistencias = dni_alumno;
    return cantidad_inasistencias;
end//

delimiter ;



--------------------------------Tabla Curso--------------------------------


-- obtener_dni_alumno_por_curso
delimiter //

create function obtener_dni_alumno_por_curso(aula_curso bigint, anio_curso bigint, division_curso bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumno_curso into dni_alumno from curso where aula_curso = aula_curso and anio_curso = anio_curso and division_curso = division_curso;
    return dni_alumno;
end//

delimiter ;

-- obtener_aula_por_alumno_curso
delimiter //

create function obtener_aula_por_alumno_curso(dni_alumno bigint)
returns bigint
begin
    declare aula bigint;
    select aula_curso into aula from curso where dni_alumno_curso = dni_alumno;
    return aula;
end//

delimiter ;

-- obtener_anio_por_alumno_curso
delimiter //

create function obtener_anio_por_alumno_curso(dni_alumno bigint)
returns bigint
begin
    declare anio bigint;
    select anio_curso into anio from curso where dni_alumno_curso = dni_alumno;
    return anio;
end//

delimiter ;

-- obtener_division_por_alumno_curso
delimiter //

create function obtener_division_por_alumno_curso(dni_alumno bigint)
returns bigint
begin
    declare division bigint;
    select division_curso into division from curso where dni_alumno_curso = dni_alumno;
    return division;
end//

delimiter ;

-- obtener_preceptor_por_alumno_curso
delimiter //

create function obtener_preceptor_por_alumno_curso(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre_preceptor varchar(100);
    select preceptor_curso into nombre_preceptor from curso where dni_alumno_curso = dni_alumno;
    return nombre_preceptor;
end//

delimiter ;


--------------------------------Tabla Faltas--------------------------------

-- codigo_falta
drop function if exists obtener_codigo_falta;

delimiter //

create function obtener_codigo_falta(dni_alumno bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta into codigo_falta from faltas where dni_alumno_falta = dni_alumno;
    return codigo_falta;
end//

delimiter ;

-- dni_alumno_falta
delimiter //

create function obtener_dni_alumno_por_falta(codigo_falta bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumno_falta into dni_alumno from faltas where codigo_falta = codigo_falta;
    return dni_alumno;
end//

delimiter ;

-- alumno_falta
delimiter //

create function obtener_nombre_alumno_por_falta(codigo_falta bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    select alumno_falta into nombre_alumno from faltas where codigo_falta = codigo_falta;
    return nombre_alumno;
end//

delimiter ;

-- fecha_falta
delimiter //

create function obtener_fecha_falta(codigo_falta bigint)
returns date
begin
    declare fecha_falta date;
    select fecha_falta into fecha_falta from faltas where codigo_falta = codigo_falta;
    return fecha_falta;
end//

delimiter ;

-- motivo_falta
delimiter //

create function obtener_motivo_falta(codigo_falta bigint)
returns varchar(100)
begin
    declare motivo varchar(100);
    select motivo_falta into motivo from faltas where codigo_falta = codigo_falta;
    return motivo;
end//

delimiter ;

-- descripcion_falta
delimiter //

create function obtener_descripcion_falta(codigo_falta bigint)
returns text
begin
    declare descripcion text;
    select descripcion_falta into descripcion from faltas where codigo_falta = codigo_falta;
    return descripcion;
end//

delimiter ;



--------------------------------Tabla solicitud_sancion--------------------------------

-- codigo_falta_solicitud
delimiter //

create function obtener_codigo_falta_por_solicitud(codigo_solicitud bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_solicitud into codigo_falta from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return codigo_falta;
end//

delimiter ;

-- nomdocente_solicitud
delimiter //

create function obtener_nom_docente_por_solicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare nombre_docente varchar(100);
    select nomdocente_solicitud into nombre_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return nombre_docente;
end//

delimiter ;

-- cargo_solicitud
delimiter //

create function obtener_cargo_docente_por_solicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare cargo_docente varchar(100);
    select cargo_solicitud into cargo_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return cargo_docente;
end//

delimiter ;

-- fecha_solicitud
delimiter //

create function obtener_fecha_solicitud(codigo_solicitud bigint)
returns date
begin
    declare fecha_solicitud date;
    select fecha_solicitud into fecha_solicitud from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return fecha_solicitud;
end//

delimiter ;


--------------------------------Tabla observaciones--------------------------------

-- codigo_falta_observaciones

delimiter //

create function obtener_codigo_falta_por_observaciones(codigo_observaciones bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_observaciones into codigo_falta from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return codigo_falta;
end//

delimiter ;

-- observacion_observaciones

delimiter //

create function obtener_observacion_por_codigo(codigo_observaciones bigint)
returns text
begin
    declare observacion text;
    select observacion_observaciones into observacion from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return observacion;
end//

delimiter ;

-- codigo_falta_grado

delimiter //

create function obtener_codigo_falta_por_grado(codigo_grado bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_grado into codigo_falta from grados where codigo_falta_grado = codigo_grado;
    return codigo_falta;
end//

delimiter ;

-- instancia_grado

delimiter //

create function obtener_instancia_grado(codigo_grado bigint)
returns varchar(100)
begin
    declare instancia_grado varchar(100);
    select instancia_grado into instancia_grado from grados where codigo_falta_grado = codigo_grado;
    return instancia_grado;
end//

delimiter ;

-- consideracion_alternativa_grado

delimiter //

create function obtener_consideracion_alternativa_grado(codigo_grado bigint)
returns varchar(100)
begin
    declare consideracion_alternativa varchar(100);
    select consideracion_alternativa_grado into consideracion_alternativa from grados where codigo_falta_grado = codigo_grado;
    return consideracion_alternativa;
end//

delimiter ;

--------------------------------tabla notificaion_tutores--------------------------------

-- codigo_falta_notificacion

delimiter //

create function obtener_codigo_falta_por_notificacion(codigo_notificacion bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_notificacion into codigo_falta from notificacion_padres where codigo_falta_notificacion = codigo_notificacion;
    return codigo_falta;
end//

delimiter ;

-- fecha_notificacion_a

delimiter //

create function obtener_fecha_notificacion_por_codigo(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    select fecha_notificacion_a into fecha_notificacion from notificacion_padres where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion;
end//

delimiter ;

-- dni_padre_notificacion

delimiter //

create function obtener_dni_padre_por_notificacion(codigo_notificacion bigint)
returns bigint
begin
    declare dni_padre bigint;
    select dni_padre_notificacion into dni_padre from notificacion_padres where codigo_falta_notificacion = codigo_notificacion;
    return dni_padre;
end//

delimiter ;

-- nombre_padre_notificacion

delimiter //

create function obtener_nombre_padre_por_notificacion(codigo_notificacion bigint)
returns varchar(100)
begin
    declare nombre_padre varchar(100);
    select nombre_padre_notificacion into nombre_padre from notificacion_padres where codigo_falta_notificacion = codigo_notificacion;
    return nombre_padre;
end//

delimiter ;

-- fecha_notificacion_pm

delimiter //

create function obtener_fecha_notificacion_padres(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    select fecha_notificacion_pm into fecha_notificacion from notificacion_padres where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion;
end//

delimiter ;
