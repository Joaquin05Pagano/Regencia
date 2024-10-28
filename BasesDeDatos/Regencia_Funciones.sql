-------------------------------- Tabla Alumnos --------------------------------

-- Función para obtener el DNI del alumno dado su nombre.
delimiter //
create function obtenerdnialumno(nombre_alumno varchar(100))
returns bigint
begin
    declare dni bigint;
    -- Se selecciona el DNI del alumno de la tabla 'alumnos' donde el nombre coincide.
    select dni_alumnos into dni from alumnos where nombre_alumnos = nombre_alumno;
    return dni; -- Se retorna el DNI obtenido.
end//
delimiter ;

-- Función para obtener el nombre del alumno dado su DNI.
delimiter //
create function obtenernombrealumno(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre varchar(100);
    -- Se selecciona el nombre del alumno de la tabla 'alumnos' donde el DNI coincide.
    select nombre_alumnos into nombre from alumnos where dni_alumnos = dni_alumno;
    return nombre; -- Se retorna el nombre obtenido.
end//
delimiter ;

-- Función para obtener la fecha de nacimiento del alumno dado su DNI.
delimiter //
create function obtenerfechanacimientoalumno(dni_alumno bigint)
returns date
begin
    declare fecha_nacimiento date;
    -- Se selecciona la fecha de nacimiento del alumno de la tabla 'alumnos' donde el DNI coincide.
    select fecha_naci_alumnos into fecha_nacimiento from alumnos where dni_alumnos = dni_alumno;
    return fecha_nacimiento; -- Se retorna la fecha de nacimiento obtenida.
end//
delimiter ;

-- Función para obtener la dirección del alumno dado su DNI.
delimiter //
create function obtenerdireccionalumno(dni_alumno bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    -- Se selecciona la dirección del alumno de la tabla 'alumnos' donde el DNI coincide.
    select direccion_alumnos into direccion from alumnos where dni_alumnos = dni_alumno;
    return direccion; -- Se retorna la dirección obtenida.
end//
delimiter ;

-- Función para obtener la localidad del alumno dado su DNI.
delimiter //
create function obtenerlocalidadalumno(dni_alumno bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    -- Se selecciona la localidad del alumno de la tabla 'alumnos' donde el DNI coincide.
    select localidad_alumnos into localidad from alumnos where dni_alumnos = dni_alumno;
    return localidad; -- Se retorna la localidad obtenida.
end//
delimiter ;

-- Función para obtener el código postal del alumno dado su DNI.
delimiter //
create function obtenercodigopostalatualumno(dni_alumno bigint)
returns int
begin
    declare cod_postal int;
    -- Se selecciona el código postal del alumno de la tabla 'alumnos' donde el DNI coincide.
    select cod_postal_alumnos into cod_postal from alumnos where dni_alumnos = dni_alumno;
    return cod_postal; -- Se retorna el código postal obtenido.
end//
delimiter ;

-- Función para obtener el teléfono del alumno dado su DNI.
delimiter //
create function obtenertelefonoalumno(dni_alumno bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    -- Se selecciona el teléfono del alumno de la tabla 'alumnos' donde el DNI coincide.
    select tel_alumnos into telefono from alumnos where dni_alumnos = dni_alumno;
    return telefono; -- Se retorna el teléfono obtenido.
end//
delimiter ;

-- Función para obtener el Gmail del alumno dado su DNI.
delimiter //
create function obtenergmailalumno(dni_alumno bigint)
returns varchar(100)
begin
    declare gmail varchar(100);
    -- Se selecciona el correo electrónico del alumno de la tabla 'alumnos' donde el DNI coincide.
    select gmail_alumnos into gmail from alumnos where dni_alumnos = dni_alumno;
    return gmail; -- Se retorna el Gmail obtenido.
end//
delimiter ;

-------------------------------- Tabla Padres Alumnos --------------------------------

-- Función para obtener el DNI del hijo a partir del DNI del tutor.
delimiter //
create function obtenerdnialumnohijo(dni_tutor bigint)
returns bigint
begin
    declare dni_hijo bigint;
    -- Se selecciona el DNI del hijo de la tabla 'tutores' donde el DNI del tutor coincide.
    select dni_alumno_hijo into dni_hijo from tutores where dni_tutor = dni_tutor;
    return dni_hijo; -- Se retorna el DNI del hijo obtenido.
end//
delimiter ;

-- Función para obtener el nombre del hijo a partir del DNI del tutor.
delimiter //
create function obtenernombrealumnohijo(dni_tutor bigint)
returns varchar(100)
begin
    declare nombre_alumno_hijo varchar(100);
    -- Se selecciona el nombre del hijo de la tabla 'tutores' donde el DNI del tutor coincide.
    select nombre_alumnos_hijo into nombre_alumno_hijo from tutores where dni_tutor = dni_tutor;
    return nombre_alumno_hijo; -- Se retorna el nombre del hijo obtenido.
end//
delimiter ;

-- Función para obtener el DNI del padre a partir del DNI del hijo.
delimiter //
create function obtenerdnipadre(dni_alumno_hijo bigint)
returns bigint
begin
    declare dni_tutor bigint;
    -- Se selecciona el DNI del tutor de la tabla 'tutores' donde el DNI del hijo coincide.
    select dni_tutor into dni_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return dni_tutor; -- Se retorna el DNI del padre obtenido.
end//
delimiter ;

-- Función para obtener el nombre del padre a partir del DNI del hijo.
delimiter //
create function obtenernombrepadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare nombre_tutor varchar(100);
    -- Se selecciona el nombre del tutor de la tabla 'tutores' donde el DNI del hijo coincide.
    select nombre_tutor into nombre_tutor from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return nombre_tutor; -- Se retorna el nombre del padre obtenido.
end//
delimiter ;

-- Función para obtener la fecha de nacimiento del padre a partir del DNI del hijo.
delimiter //
create function obtenerfechanacimientopadre(dni_alumno_hijo bigint)
returns date
begin
    declare fecha_nacimiento date;
    -- Se selecciona la fecha de nacimiento del tutor de la tabla 'tutores' donde el DNI del hijo coincide.
    select fecha_naci_padre into fecha_nacimiento from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return fecha_nacimiento; -- Se retorna la fecha de nacimiento del padre obtenida.
end//
delimiter ;

-- Función para obtener la dirección de la madre/padre a partir del DNI del hijo.
delimiter //
create function obtenerdireccionmadrepadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare direccion varchar(100);
    -- Se selecciona la dirección de la madre/padre de la tabla 'tutores' donde el DNI del hijo coincide.
    select direccion_madre_padre into direccion from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return direccion; -- Se retorna la dirección obtenida.
end//
delimiter ;

-- Función para obtener la localidad de la madre/padre a partir del DNI del hijo.
delimiter //
create function obtenerlocalidadmadrepadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare localidad varchar(100);
    -- Se selecciona la localidad de la madre/padre de la tabla 'tutores' donde el DNI del hijo coincide.
    select localidad_madre_padre into localidad from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return localidad; -- Se retorna la localidad obtenida.
end//
delimiter ;

-- Función para obtener el teléfono del padre a partir del DNI del hijo.
delimiter //
create function obtenertelefonopadre(dni_alumno_hijo bigint)
returns varchar(100)
begin
    declare telefono varchar(100);
    -- Se selecciona el teléfono del tutor de la tabla 'tutores' donde el DNI del hijo coincide.
    select tel_padre into telefono from tutores where dni_alumno_hijo = dni_alumno_hijo;
    return telefono; -- Se retorna el teléfono obtenido.
end//
delimiter ;


-------------------------------- Tabla Inasistencias --------------------------------

-- Función para obtener el DNI del alumno a partir del código de inasistencia.
delimiter //
create function obtenerdnialumnoporinasistencia(codigo_inasistencia bigint)
returns bigint
begin
    declare dni_alumno bigint;
    -- Se selecciona el DNI del alumno de la tabla 'inasistencias' donde el código de inasistencia coincide.
    select dni_alumnos_inasistencias into dni_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return dni_alumno; -- Se retorna el DNI obtenido.
end//
delimiter ;

-- Función para obtener el nombre del alumno a partir del código de inasistencia.
delimiter //
create function obtenernombrealumnoporinasistencia(codigo_inasistencia bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    -- Se selecciona el nombre del alumno de la tabla 'inasistencias' donde el código de inasistencia coincide.
    select nombre_alumno_inasistencias into nombre_alumno from inasistencias where codigo_inasistencia = codigo_inasistencia;
    return nombre_alumno; -- Se retorna el nombre obtenido.
end//
delimiter ;

-- Función para obtener la cantidad de inasistencias de un alumno dado su DNI.
delimiter //
create function obtenercantidadinasistencias(dni_alumno bigint)
returns bigint
begin
    declare cantidad_inasistencias bigint;
    -- Se suma la cantidad de inasistencias de la tabla 'inasistencias' donde el DNI del alumno coincide.
    select sum(cantidad_inasistencias) into cantidad_inasistencias from inasistencias where dni_alumnos_inasistencias = dni_alumno;
    return cantidad_inasistencias; -- Se retorna la cantidad total de inasistencias.
end//
delimiter ;

-------------------------------- Tabla Curso --------------------------------

-- Función para obtener el DNI del alumno a partir del aula, año y división del curso.
delimiter //
create function obtenerdnialumnoporcurso(aula_curso bigint, anio_curso bigint, division_curso bigint)
returns bigint
begin
    declare dni_alumno bigint;
    -- Se selecciona el DNI del alumno de la tabla 'cursos' donde coinciden aula, año y división.
    select dni_alumno_curso into dni_alumno from cursos where aula_curso = aula_curso and anio_curso = anio_curso and division_curso = division_curso;
    return dni_alumno; -- Se retorna el DNI obtenido.
end//
delimiter ;

-- Función para obtener el aula del alumno dado su DNI.
delimiter //
create function obteneraulaporalumnocurso(dni_alumno bigint)
returns bigint
begin
    declare aula bigint;
    -- Se selecciona el aula del curso del alumno de la tabla 'cursos' donde el DNI coincide.
    select aula_curso into aula from cursos where dni_alumno_curso = dni_alumno;
    return aula; -- Se retorna el aula obtenida.
end//
delimiter ;

-- Función para obtener el año del curso del alumno dado su DNI.
delimiter //
create function obteneranioporalumnocurso(dni_alumno bigint)
returns bigint
begin
    declare anio bigint;
    -- Se selecciona el año del curso del alumno de la tabla 'cursos' donde el DNI coincide.
    select anio_curso into anio from cursos where dni_alumno_curso = dni_alumno;
    return anio; -- Se retorna el año obtenido.
end//
delimiter ;

-- Función para obtener la división del curso del alumno dado su DNI.
delimiter //
create function obtenerdivisionporalumnocurso(dni_alumno bigint)
returns bigint
begin
    declare division bigint;
    -- Se selecciona la división del curso del alumno de la tabla 'cursos' donde el DNI coincide.
    select division_curso into division from cursos where dni_alumno_curso = dni_alumno;
    return division; -- Se retorna la división obtenida.
end//
delimiter ;

-- Función para obtener el nombre del preceptor del curso del alumno dado su DNI.
delimiter //
create function obtenerpreceptorporalumnocurso(dni_alumno bigint)
returns varchar(100)
begin
    declare nombre_preceptor varchar(100);
    -- Se selecciona el nombre del preceptor del curso del alumno de la tabla 'cursos' donde el DNI coincide.
    select preceptor_curso into nombre_preceptor from cursos where dni_alumno_curso = dni_alumno;
    return nombre_preceptor; -- Se retorna el nombre del preceptor obtenido.
end//
delimiter ;



-------------------------------- Tabla Faltas --------------------------------

-- Función para obtener el código de falta a partir del DNI del alumno.
drop function if exists obtenercodigofalta;
delimiter //
create function obtenercodigofalta(dni_alumno bigint)
returns bigint
begin
    declare codigo_falta bigint;
    -- Se selecciona el código de falta de la tabla 'faltas' donde el DNI del alumno coincide.
    select codigo_falta into codigo_falta from faltas where dni_alumno_falta = dni_alumno;
    return codigo_falta; -- Se retorna el código de falta obtenido.
end//
delimiter ;

-- Función para obtener el DNI del alumno a partir del código de falta.
delimiter //
create function obtenerdnialumnoporfalta(codigo_falta bigint)
returns bigint
begin
    declare dni_alumno bigint;
    -- Se selecciona el DNI del alumno de la tabla 'faltas' donde el código de falta coincide.
    select dni_alumno_falta into dni_alumno from faltas where codigo_falta = codigo_falta;
    return dni_alumno; -- Se retorna el DNI obtenido.
end//
delimiter ;

-- Función para obtener el nombre del alumno a partir del código de falta.
delimiter //
create function obtenernombrealumnoporfalta(codigo_falta bigint)
returns varchar(100)
begin
    declare nombre_alumno varchar(100);
    -- Se selecciona el nombre del alumno de la tabla 'faltas' donde el código de falta coincide.
    select alumno_falta into nombre_alumno from faltas where codigo_falta = codigo_falta;
    return nombre_alumno; -- Se retorna el nombre del alumno obtenido.
end//
delimiter ;

-- Función para obtener la fecha de la falta a partir del código de falta.
delimiter //
create function obtenerfechafalta(codigo_falta bigint)
returns date
begin
    declare fecha_falta date;
    -- Se selecciona la fecha de la falta de la tabla 'faltas' donde el código de falta coincide.
    select fecha_falta into fecha_falta from faltas where codigo_falta = codigo_falta;
    return fecha_falta; -- Se retorna la fecha de falta obtenida.
end//
delimiter ;

-- Función para obtener el motivo de la falta a partir del código de falta.
delimiter //
create function obtenermotivofalta(codigo_falta bigint)
returns varchar(100)
begin
    declare motivo varchar(100);
    -- Se selecciona el motivo de la falta de la tabla 'faltas' donde el código de falta coincide.
    select motivo_falta into motivo from faltas where codigo_falta = codigo_falta;
    return motivo; -- Se retorna el motivo de la falta obtenido.
end//
delimiter ;

-- Función para obtener la descripción de la falta a partir del código de falta.
delimiter //
create function obtenerdescripcionfalta(codigo_falta bigint)
returns text
begin
    declare descripcion text;
    -- Se selecciona la descripción de la falta de la tabla 'faltas' donde el código de falta coincide.
    select descripcion_falta into descripcion from faltas where codigo_falta = codigo_falta;
    return descripcion; -- Se retorna la descripción de la falta obtenida.
end//
delimiter ;

-------------------------------- Tabla Solicitud Sanción --------------------------------

-- Función para obtener el código de falta a partir del código de solicitud.
delimiter //
create function obtenercodigofaltaporsolicitud(codigo_solicitud bigint)
returns bigint
begin
    declare codigo_falta bigint;
    -- Se selecciona el código de falta de la tabla 'solicitud_sancion' donde el código de solicitud coincide.
    select codigo_falta_solicitud into codigo_falta from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return codigo_falta; -- Se retorna el código de falta obtenido.
end//
delimiter ;

-- Función para obtener el nombre del docente a partir del código de solicitud.
delimiter //
create function obtenernomdocenteporsolicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare nombre_docente varchar(100);
    -- Se selecciona el nombre del docente de la tabla 'solicitud_sancion' donde el código de solicitud coincide.
    select nomdocente_solicitud into nombre_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return nombre_docente; -- Se retorna el nombre del docente obtenido.
end//
delimiter ;

-- Función para obtener el cargo del docente a partir del código de solicitud.
delimiter //
create function obtenercargodocenteporsolicitud(codigo_solicitud bigint)
returns varchar(100)
begin
    declare cargo_docente varchar(100);
    -- Se selecciona el cargo del docente de la tabla 'solicitud_sancion' donde el código de solicitud coincide.
    select cargo_solicitud into cargo_docente from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return cargo_docente; -- Se retorna el cargo del docente obtenido.
end//
delimiter ;

-- Función para obtener la fecha de la solicitud a partir del código de solicitud.
delimiter //
create function obtenerfechasolicitud(codigo_solicitud bigint)
returns date
begin
    declare fecha_solicitud date;
    -- Se selecciona la fecha de la solicitud de la tabla 'solicitud_sancion' donde el código de solicitud coincide.
    select fecha_solicitud into fecha_solicitud from solicitud_sancion where codigo_falta_solicitud = codigo_solicitud;
    return fecha_solicitud; -- Se retorna la fecha de la solicitud obtenida.
end//
delimiter ;

-------------------------------- Tabla Observaciones --------------------------------

-- Función para obtener el código de falta a partir del código de observaciones.
delimiter //
create function obtenercodigofaltaporobservaciones(codigo_observaciones bigint)
returns bigint
begin
    declare codigo_falta bigint;
    -- Se selecciona el código de falta de la tabla 'observaciones' donde el código de observaciones coincide.
    select codigo_falta_observaciones into codigo_falta from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return codigo_falta; -- Se retorna el código de falta obtenido.
end//
delimiter ;

-- Función para obtener la observación a partir del código de observaciones.
delimiter //
create function obtenerobservacionporcodigo(codigo_observaciones bigint)
returns text
begin
    declare observacion text;
    -- Se selecciona la observación de la tabla 'observaciones' donde el código de observaciones coincide.
    select observacion_observaciones into observacion from observaciones where codigo_falta_observaciones = codigo_observaciones;
    return observacion; -- Se retorna la observación obtenida.
end//
delimiter ;

-- Función para obtener el código de falta a partir del código de grado.
delimiter //
create function obtenercodigo_faltaporgado(codigo_grado bigint)
returns bigint
begin
    declare codigo_falta bigint;
    -- Se selecciona el código de falta de la tabla 'grados' donde el código de grado coincide.
    select codigo_falta_grado into codigo_falta from grados where codigo_falta_grado = codigo_grado;
    return codigo_falta; -- Se retorna el código de falta obtenido.
end //
delimiter ;

-- Función para obtener la instancia de grado a partir del código de grado.
delimiter //
create function obtenerinstanciagrado(codigo_grado bigint)
returns varchar(100)
begin
    declare instancia_grado varchar(100);
    -- Se selecciona la instancia de grado de la tabla 'grados' donde el código de grado coincide.
    select instancia_grado into instancia_grado from grados where codigo_falta_grado = codigo_grado;
    return instancia_grado; -- Se retorna la instancia de grado obtenida.
end //
delimiter ;

-- Función para obtener la consideración alternativa del grado a partir del código de grado.
delimiter //
create function obtenerconsideracionalternativagrado(codigo_grado bigint)
returns varchar(100)
begin
    declare consideracion_alternativa varchar(100);
    -- Se selecciona la consideración alternativa de grado de la tabla 'grados' donde el código de grado coincide.
    select consideracion_alternativa_grado into consideracion_alternativa from grados where codigo_falta_grado = codigo_grado;
    return consideracion_alternativa; -- Se retorna la consideración alternativa obtenida.
end //
delimiter ;


-------------------------------- Tabla Notificación Tutores --------------------------------

-- Función para obtener el código de falta a partir del código de notificación.
delimiter //
create function obtenercodigofaltapornotificacion(codigo_notificacion bigint)
returns bigint
begin
    declare codigo_falta bigint;
    -- Se selecciona el código de falta de la tabla 'notificaion_tutores' donde el código de notificación coincide.
    select codigo_falta_notificacion into codigo_falta from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return codigo_falta; -- Se retorna el código de falta obtenido.
end//
delimiter ;

-- Función para obtener la fecha de notificación a partir del código de notificación.
delimiter //
create function obtenerfechanotificacionporcodigo(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    -- Se selecciona la fecha de notificación de la tabla 'notificaion_tutores' donde el código de notificación coincide.
    select fecha_notificacion_a into fecha_notificacion from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion; -- Se retorna la fecha de notificación obtenida.
end//
delimiter ;

-- Función para obtener el DNI del padre a partir del código de notificación.
delimiter //
create function obtenerdnipadrepornotificacion(codigo_notificacion bigint)
returns bigint
begin
    declare dni_tutor bigint;
    -- Se selecciona el DNI del tutor de la tabla 'notificaion_tutores' donde el código de notificación coincide.
    select dni_tutor_notificacion into dni_tutor from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return dni_tutor; -- Se retorna el DNI del tutor obtenido.
end//
delimiter ;

-- Función para obtener el nombre del padre a partir del código de notificación.
delimiter //
create function obtenenombrepadrepornotificacion(codigo_notificacion bigint)
returns varchar(100)
begin
    declare nombre_tutor varchar(100);
    -- Se selecciona el nombre del tutor de la tabla 'notificaion_tutores' donde el código de notificación coincide.
    select nombre_tutor into nombre_tutor from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return nombre_tutor; -- Se retorna el nombre del tutor obtenido.
end//
delimiter ;

-- Función para obtener la fecha de notificación para padres a partir del código de notificación.
delimiter //
create function obtenerfechanotificacionpadres(codigo_notificacion bigint)
returns date
begin
    declare fecha_notificacion date;
    -- Se selecciona la fecha de notificación para padres de la tabla 'notificaion_tutores' donde el código de notificación coincide.
    select fecha_notificacion_pm into fecha_notificacion from notificaion_tutores where codigo_falta_notificacion = codigo_notificacion;
    return fecha_notificacion; -- Se retorna la fecha de notificación para padres obtenida.
end//
delimiter ;
