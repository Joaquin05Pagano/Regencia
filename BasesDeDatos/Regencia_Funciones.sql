--------------------------------Tabla Alumnos--------------------------------

--obetener alumnos
delimiter //

create function ObtenerDniAlumno(nombre_alumno varchar(100))
returns bigint
begin
    declare dni bigint;
    select dni_alumnos into dni from alumnos where nombre_alumnos = nombre_alumno;
    return dni;
end//

delimiter ;


--Obtenernombrealumno

delimiter //

create function ObtenerNombreAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre varchar(100);
    select nombre_alumnos into nombre from alumnos where dni_alumnos = dni_alumno;
    return nombre;
end//

delimiter ;

--Obtenerfechanacimientoalumno
delimiter //

create function ObtenerFechaNacimientoAlumno(dni_alumno bigint)
returns date
begin
    declare fecha_nacimiento date;
    select fecha_naci_alumnos into fecha_nacimiento from alumnos where dni_alumnos = dni_alumno;
    return fecha_nacimiento;
end//

delimiter ;


--Obtenerdireccionalumno

delimiter //

create function ObtenerDireccionAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    select direccion_alumnos into direccion from alumnos where dni_alumnos = dni_alumno;
    return direccion;
end//

delimiter ;


--Obtenerlocalidadalumno

delimiter //

create function ObtenerLocalidadAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    select localidad_alumnos into localidad from alumnos where dni_alumnos = dni_alumno;
    return localidad;
end//

delimiter ;

--Obtenercodigopostalatualumno

delimiter //

create function ObtenerCodigoPostalAlumno(dni_alumno bigint)
returns int
begin
    declare cod_postal int;
    select cod_postal_alumnos into cod_postal from alumnos where dni_alumnos = dni_alumno;
    return cod_postal;
end//

delimiter ;

--Obtenertelefonoalumno

delimiter //

create function ObtenerTelefonoAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    select tel_alumnos into telefono from alumnos where dni_alumnos = dni_alumno;
    return telefono;
end//

delimiter ;


--Obtenergmailalumno

delimiter //

create function ObtenerGmailAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare gmail varchar(100);
    select gmail_alumnos into gmail from alumnos where dni_alumnos = dni_alumno;
    return gmail;
end//

delimiter ;


--------------------------------Tabla Padres Alumnos--------------------------------
--dni_Alumno_hijo

delimiter //

create function ObtenerDniAlumnoHijo(dni_tutor bigint)
returns bigint
begin
    declare dni_hijo bigint;
    select dni_alumno_hijo into dni_hijo from tutores where dni_tutor = dni_tutor;
    return dni_hijo;
end//

delimiter ;

--nombre_Alumnos_hijo 
delimiter //

create function ObtenerNombreAlumnoHijo(dni_tutor bigint)
returns varchar(100)
begin
    declare nombre_alumno_hijo varchar(100);
    select nombre_alumnos_hijo into nombre_alumno_hijo from tutores where dni_tutor = dni_tutor;
    return nombre_alumno_hijo;
end//

delimiter ;


--dni_padre 

delimiter //

create function ObtenerDniPadre(dni_alumno_hijo bigint)
returns bigint
begin
    declare dni_tutor bigint;
    select dni_tutor into dni_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return dni_tutor;
end//

delimiter ;


--nombre_Padre 
delimiter //

create function ObtenerNombrePadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare nombre_tutor varchar(100);
    select nombre_tutor into nombre_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return nombre_tutor;
end//

delimiter ;



--fecha_naci_Padre 
delimiter //

create function ObtenerFechaNacimientoPadre(dni_alumno_hijo bigint)
returns date
begin
    declare fecha_nacimiento date;
    select fecha_naci_padre into fecha_nacimiento from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return fecha_nacimiento;
end//

delimiter ;


--direccion_madre_padre

delimiter //

create function ObtenerDireccionMadrePadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    select direccion_madre_Padre into direccion from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return direccion;
end//

delimiter ;



--localidad_madre_Padre
delimiter //

create function ObtenerLocalidadMadrePadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    select localidad_madre_padre into localidad from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return localidad;
end//

delimiter ;


--tel_padre

delimiter //

create function ObtenerTelefonoPadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    select tel_padre into telefono from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return telefono;
end//

delimiter ;


--------------------------------Tabla Inasistencias--------------------------------

--dni_alumnos_inasistencias

delimiter //

create function ObtenerDniAlumnoPorInasistencia(codigo_inasistencia bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumnos_inasistencias into dni_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return dni_alumno;
end//

delimiter ;


--nombre_alumno_inasistencias

delimiter //

create function ObtenerNombreAlumnoPorInasistencia(codigo_inasistencia bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    select nombre_alumno_inasistencias into nombre_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return nombre_alumno;
end//

delimiter ;

--cantidad_inasistencias

delimiter //

create function ObtenerCantidadInasistencias(dni_alumno bigint)
returns bigint
begin
    declare cantidad_inasistencias bigint;
    select sum(cantidad_inasistencias) into cantidad_inasistencias from inasistencias where dni_alumnos_inasistencias = dni_alumno;
    return cantidad_inasistencias;
end//

delimiter ;


--------------------------------Tabla Curso--------------------------------


--dni_alumno_curso
delimiter //

create function ObtenerDniAlumnoPorCurso(aula_curso bigint, anio_curso bigint, division_curso bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumno_curso into dni_alumno from cursos where aula_curso = aula_curso and anio_curso = anio_curso and division_curso = division_curso;
    return dni_alumno;
end//

delimiter ;

--aula_curso
delimiter //

create function ObtenerAulaPorCursoAlumno(dni_alumno bigint)
returns bigint
begin
    declare aula bigint;
    select aula_curso into aula from cursos where dni_alumno_curso = dni_alumno;
    return aula;
end//

delimiter ;

--anio_curso
delimiter //

create function ObtenerAnioPorAlumnoCurso(dni_alumno bigint)
returns bigint
begin
    declare anio bigint;
    select anio_curso into anio from cursos where dni_alumno_curso = dni_alumno;
    return anio;
end//

delimiter ;


--division_curso
delimiter //

create function ObtenerDivisionPorCursoAlumno(dni_alumno bigint)
returns bigint
begin
    declare division bigint;
    select division_curso into division from cursos where dni_alumno_curso = dni_alumno;
    return division;
end//

delimiter ;


--preceptor_curso 
delimiter //

create function ObtenerPreceptorPorCursoAlumno(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre_preceptor varchar(100);
    select preceptor_curso into nombre_preceptor from cursos where dni_alumno_curso = dni_alumno;
    return nombre_preceptor;
end//

delimiter ;


--------------------------------Tabla Faltas--------------------------------

--codigo_falta 

delimiter //

create function ObtenerCodigoFalta(dni_alumno bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta into codigo_falta from faltas where dni_alumno_falta = dni_alumno;
    return codigo_falta;
end//

delimiter ;


--dni_alumno_falta 

delimiter //

create function ObtenerDniAlumnoPorFalta(codigo_falta bigint)
returns bigint
begin
    declare dni_alumno bigint;
    select dni_alumno_falta into dni_alumno from faltas where codigo_falta = codigo_falta;
    return dni_alumno;
end//

delimiter ;


--alumno_falta 

delimiter //

create function ObtenerNombreAlumnoPorFalta(codigo_falta bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    select alumno_falta into nombre_alumno from faltas where codigo_falta = codigo_falta;
    return nombre_alumno;
end//

delimiter ;


--fecha_falta  
delimiter //

create function ObtenerFechaFalta(codigo_falta bigint)
returns date
begin
    declare fecha_falta date;
    select fecha_falta into fecha_falta from faltas where codigo_falta = codigo_falta;
    return fecha_falta;
end//

delimiter ;

--motivo_falta 

delimiter //

create function ObtenerMotivoFalta(codigo_falta bigint)
returns varchar(100)
begin
    declare motivo varchar(100);
    select motivo_falta into motivo from faltas where codigo_falta = codigo_falta;
    return motivo;
end//

delimiter ;


--descripcion_falta

delimiter //

create function ObtenerDescripcionFalta(codigo_falta bigint)
returns text
begin
    declare descripcion text;
    select descripcion_falta into descripcion from faltas where codigo_falta = codigo_falta;
    return descripcion;
end//

delimiter ;


--------------------------------Tabla solicitud_sancion--------------------------------

--codigo_falta_solicitud

delimiter //

create function ObtenerCodigoFaltaPorSolicitud(codigo_solicitud bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_solicitud into codigo_falta from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return codigo_falta;
end//

delimiter ;



--nomdocente_solicitud

delimiter //

create function ObtenerNomDocentePorSolicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare nombre_docente varchar(100);
    select nomdocente_solicitud into nombre_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return nombre_docente;
end//

delimiter ;



--cargo_solicitud 

delimiter //

create function ObtenerCargodocentePorSolicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare cargo_docente varchar(100);
    select cargo_solicitud into cargo_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return cargo_docente;
end//

delimiter ;


--fecha_solicitud  

delimiter //

create function ObtenerFechaSolicitud(codigo_solicitud bigint)
returns date
begin
    declare fecha_solicitud date;
    select fecha_solicitud into fecha_solicitud from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return fecha_solicitud;
end//

delimiter ;


--------------------------------Tabla observaciones--------------------------------

--codigo_falta_observaciones

delimiter //

create function ObtenerCodigoFaltaPorObservaciones(codigo_observaciones bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_observaciones into codigo_falta from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return codigo_falta;
end//

delimiter ;



--observacion_observaciones

delimiter //

create function ObtenerObservacionporcodigo(codigo_observaciones bigint)
returns text
begin
    declare observacion text;
    select observacion_observaciones into observacion from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return observacion;
end//

delimiter ;




--codigo_falta_grado
delimiter //

create function ObtenerCodigoFaltaPorgado(codigo_grado bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_grado into codigo_falta from grados where codigo_falta_grado = codigo_grado;
    return codigo_falta;
end //

delimiter ;

select Obtenercodigo_faltaporgado(codigo_grado);



--instancia_grado

delimiter //

create function Obtenerinstanciagrado(codigo_grado bigint)
returns varchar(100)
begin
    declare instancia_grado varchar(100);
    select instancia_grado into instancia_grado from grados where codigo_falta_grado = codigo_grado;
    return instancia_grado;
end //

delimiter ;




--consideracion_alternativa_grado

delimiter //

create function Obtenerconsideracionalternativagrado(codigo_grado bigint)
returns varchar(100)
begin
    declare consideracion_alternativa varchar(100);
    select consideracion_alternativa_grado into consideracion_alternativa from grados where codigo_falta_grado = codigo_grado;
    return consideracion_alternativa;
end //

delimiter ;


--------------------------------tabla notificaion_tutores--------------------------------

--codigo_falta_notificacion

delimiter //

create function Obtenercodigofaltapornotificacion(codigo_notificacion bigint)
returns bigint
begin
    declare codigo_falta bigint;
    select codigo_falta_notificacion into codigo_falta from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return codigo_falta;
end //

delimiter ;



--fecha_notificacion_a

delimiter //

create function Obtenerfechanotificacionporcodigo(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    select fecha_notificacion_a into fecha_notificacion from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion;
end //

delimiter ;

--dni_padre_notificacion

delimiter //

create function Obtenerdnipadrepornotificacion(codigo_notificacion bigint)
returns bigint
begin
    declare dni_tutor bigint;
    select dni_tutor_notificacion into dni_tutor from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return dni_tutor;
end //

delimiter ;


--nombre_padre_notificacion

delimiter //

create function obtenenombrepadrepornotificacion(codigo_notificacion bigint)
returns varchar(100)
begin
    declare nombre_tutor varchar(100);
    select nombre_tutor into nombre_tutor from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return nombre_tutor;
end //

delimiter ;


--fecha_notificacion_pm
delimiter //

create function Obtenerfechanotificacionpadres(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    select fecha_notificacion_pm into fecha_notificacion from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion;
end //

delimiter ;
