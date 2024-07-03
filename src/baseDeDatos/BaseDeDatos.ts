import mysql from 'mysql2/promise';
import { RowDataPacket } from 'mysql2'

// Clase BaseDeDatos para manejar conexiones y consultas a la base de datos
class BaseDeDatos {
  private pool: mysql.Pool;

  // Constructor que inicializa una conexión al pool de la base de datos
  constructor() {
    this.pool = mysql.createPool({
      host: 'ip',          // Dirección del servidor de la base de datos
      user: 'usuario',     // Usuario de la base de datos
      password: '',        // Contraseña del usuario
      database: 'regencia' // Nombre de la base de datos
    });
  }

  // Método para establecer una conexión con la base de datos
  async conectar() {
    // Crear una conexión desde el pool
    return this.pool.getConnection();
  }

  // Método para cerrar la conexión con la base de datos
  async desconectar() {
    // Finaliza todas las conexiones en el pool
    await this.pool.end();
  }

  // Método para obtener todos los datos de una tabla específica
  async obtenerDatos(tabla: string): Promise<mysql.RowDataPacket[]> {
    // Obtener conexión desde el pool
    const connection = await this.conectar();

    try {
      // Ejecutar la consulta para obtener todos los datos de la tabla especificada
      const [rows] = await connection.query(`SELECT * FROM ${tabla}`);
      return rows as RowDataPacket[];
    } finally {
      // Liberar la conexión
      connection.release();
    }
  }
}

// Uso de la clase BaseDeDatos
(async () => {
  const db = new BaseDeDatos(); // Crear una instancia de la clase BaseDeDatos
  await db.conectar(); // Conectar a la base de datos

  try {
    // Obtener datos de la tabla 'alumnos' y mostrarlos
    const tabla = await db.obtenerDatos('tabla');
    console.log('Tabla:', tabla);

  } catch (error) {
    // Manejo de errores al obtener datos
    console.error('Error al obtener datos:', error);
  } finally {
    // Desconectar de la base de datos
    await db.desconectar();
  }
})();
