import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edad"
export default class extends Controller {
  static targets = ["anionac", "mesnac", "dianac", "edad", "edadactual"]
  connect() {
    console.log("Conexion de controlador edades establecida")
  }
  actualizarEdad(){
    const targetPersona = event.target.closest(".div-edad")
    const anio = parseInt(targetPersona.querySelector('[data-edad-target="anionac"]').value);
    const mes = parseInt(targetPersona.querySelector('[data-edad-target="mesnac"]').value) - 1;
    const dia = parseInt(targetPersona.querySelector('[data-edad-target="dianac"]').value);

    const campo_fecha_caso = document.querySelector('#caso_fecha_localizada');
    const campo_edad = targetPersona.querySelector('[data-edad-target="edad"]');
    const campo_edadactual = targetPersona.querySelector('[data-edad-target="edadactual"]');

    const anio_caso = parseInt(campo_fecha_caso.value.split("/")[2])
    const mes_caso = parseInt(obtenerNumeroMes(campo_fecha_caso.value.split("/")[1]))
    const dia_caso = parseInt(campo_fecha_caso.value.split("/")[0])
    const fechaNacimiento = new Date(anio, mes, dia);
    const fechaCaso = new Date(anio_caso, mes_caso, dia_caso);
    const hoy = new Date();

    let edadactual = hoy.getFullYear() - fechaNacimiento.getFullYear();
    let edad = fechaCaso.getFullYear() - fechaNacimiento.getFullYear();

    if (
            hoy.getMonth() < fechaNacimiento.getMonth() ||
            (hoy.getMonth() === fechaNacimiento.getMonth() &&
                      hoy.getDate() < fechaNacimiento.getDate())
          ) {
            edadactual--;
          }
    if (
            hoy.getMonth() < fechaCaso.getMonth() ||
            (hoy.getMonth() === fechaCaso.getMonth() &&
                      hoy.getDate() < fechaCaso.getDate())
          ) {
            edad--;
          }
    if (edad > 0){
      campo_edad.value = edad;
    }
    if (edadactual > 0){
      campo_edadactual.value = edadactual;
    }

    function obtenerNumeroMes(nombreMes) {
      const meses = ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago',
      'sep', 'oct', 'nov', 'dic'];
        return meses.indexOf(nombreMes.toLowerCase());
        }
  }
  blanquearFechanac(){
    const targetPersona = event.target.closest(".div-edad")
    const campo_anionac = targetPersona.querySelector('[data-edad-target="anionac"]');
    const campo_mesnac = targetPersona.querySelector('[data-edad-target="mesnac"]');
    const campo_dianac = targetPersona.querySelector('[data-edad-target="dianac"]');

    campo_anionac.value = null
    campo_mesnac.value = null
    campo_dianac.value = null
  }
}
