export default class Sivel2Gen__Motor{

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
   *  Sivel2Gen__Motor.funcionestatica(fl, formato)
   *
   * Para poderlo usar desde Javascript global con 
   * window.Sivel2Gen__Motor 
   * asegure que en app/javascript/application.js ejecuta:
   *
   * import Sivel2Gen__Motor from './controllers/sivel2_gen/motor.js'
   * window.Sivel2Gen__Motor = Msip__Motor
   *
   */

  // Se ejecuta cada vez que se carga una página que no está en cache
  // y tipicamente después de que se ha cargado la página y los recursos.
  static ejecutarAlCargarDocumentoYRecursos() {
    console.log("* Corriendo Sivel2Gen__Motor::ejecutarAlCargarDocumentoYRecursos()")
  }

  // Llamar cada vez que se cargue una página detectada con turbo:load
  // Tal vez en cache por lo que podría no haberse ejecutado iniciar 
  // nuevamente.
  // Podría ser llamada varias veces consecutivas por lo que debe detectarlo
  // para no ejecutar dos veces lo que no conviene.
  static ejecutarAlCargarPagina() {
    console.log("* Corriendo Sivel2Gen__Motor::ejecutarAlCargarPagina()")
  }

  // Llamada desde application.js tal vez antes de cargar el documento,
  // paquetes javascript y recursos sprockets
  static iniciar() {
    console.log("* Corriendo Sivel2Gen__Motor::iniciar()")
    // Para usar mapa sobre OpenStreetMap cargue leaflet antes de llamar
    // esta función an application.js asi:
    // import L from 'leaflet'
    // window.L = L
    // import 'leaflet.markercluster'
    if (typeof L != "undefined") {
      // Si uso import iconShadow from 'leaflet/dist/images/marker-shadow.png';
      // queda public/miruta/assets/marker-shadow-MEXDWUU7-a2d94406ba198f61f68...png
      // Más bien se configuró en el config/initializers/assets.rb del motor
      // para que sea incluido en aplicaciones y motores que incluyan este motor.
      // Como se copian con sprockets quedan con firma como las usadas a 
      // continuación:
      L.Icon.Default.mergeOptions({
        iconUrl: "../assets/leaflet/dist/images/marker-icon-3d253116ec4ba0e1f22a01cdf1ff7f120fa4d89a6cd0933d68f12951d19809b4.png",
        iconRetinaUrl: "../assets/leaflet/dist/images/marker-icon-2x-091245b393c16cdcefe54920aa7d3994a0683317ca9a58d35cbc5ec65996398c.png",
        shadowUrl: "../assets/leaflet/dist/images/marker-shadow-a2d94406ba198f61f68a71ed8f9f9c701122c0c33b775d990edceae4aece567f.png"
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
