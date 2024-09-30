export default class Sivel2Gen__Motor {
  /* 
   * Librería de funciones comunes.
   * Aunque no es un controlador lo dejamos dentro del directorio
   * controllers para aprovechar método de msip para compartir controladores
   * Stimulus de motores.
   *
   * Como su nombre no termina en _controller no será incluido en 
   * controllers/index.js
   *
   * Desde controladores stimulus importelo con
   *
   *  import Sivel2Gen__Motor from "../sivel2_gen/motor"
   *
   * Use funciones por ejemplo con
   *
   *  Sivel2Gen__Motor.ejecutarAlCargarPagina()
   *
   * Para poderlo usar desde Javascript global con window.Sivel2Gen__Motor 
   * asegure que en app/javascript/application.js ejecuta:
   *
   * import Sivel2Gen__Motor from './controllers/sivel2_gen/motor.js'
   * window.Sivel2Gen__Motor = Sivel2Gen__Motor
   *
   */


  // Llamar cada vez que se cargue una página detectada con turbo:load
  // Tal vez en cache por lo que podría no haberse ejecutado iniciar 
  // nuevamente.
  // Podría ser llamada varias veces consecutivas por lo que debe detectarlo
  // para no ejecutar dos veces lo que no conviene.
  static ejecutarAlCargarPagina() {
    console.log("* Corriendo Sivel2Gen__Motor::ejecutarAlCargarPagina()")

    // En filtro avanzado del listado de casos maneja botón Limpiar
    if (document.getElementById('limpiar-campos-filtro')) {
      document.getElementById('limpiar-campos-filtro').addEventListener('click', function(e) {
        // Obtiene todos los campos con la clase 'chosen-select'
        const selectores = document.querySelectorAll('.chosen-select');
        selectores.forEach(select => {
          csDeseleccionarTodas(select.id);
        });
      });
    }

    Msip__Motor.configurarElementosTomSelect()

    // En filtro avanzado del listado de casos maneja botón Limpiar
    if (document.getElementById('limpiar-campos-filtro')) {
      document.getElementById('limpiar-campos-filtro').addEventListener('click', function(e) {
        // Obtiene todos los campos con la clase 'chosen-select'
        const selectores = document.querySelectorAll('.chosen-select');
        selectores.forEach(select => {
          csDeseleccionarTodas(select.id);
        });
      });
    }

  }

}
