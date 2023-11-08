import { Controller } from "@hotwired/stimulus"

// Conecta con data-controller="sivel2-gen--edad"
export default class extends Controller {
  static targets = ["anionac", "mesnac", "dianac", "edad", "edadactual"]
  connect() {
    console.log("Conexion de controlador edades establecida")
  }
  actualizarEdad(){
    const targetPersona = event.target.closest(".div-edad")
    let anio = parseInt(targetPersona.querySelector('[data-edad-target="anionac"]').value);
    let mes = parseInt(targetPersona.querySelector('[data-edad-target="mesnac"]').value) - 1;
    let dia = parseInt(targetPersona.querySelector('[data-edad-target="dianac"]').value);

    if(isNaN(mes)){
      mes = 0
    }
    if(isNaN(dia)){
      dia = 1
    }
    const campo_fecha_caso = document.querySelector('#caso_fecha_localizada');
    const campo_edad = targetPersona.querySelector('[data-edad-target="edad"]');
    const campo_edadactual = targetPersona.querySelector('[data-edad-target="edadactual"]');
    const campo_rangoedad = targetPersona.querySelector('[data-edad-target="rangoedad"]');

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
            fechaCaso.getMonth() < fechaNacimiento.getMonth() ||
            (fechaCaso.getMonth() === fechaNacimiento.getMonth() &&
                      fechaCaso.getDate() < fechaNacimiento.getDate())
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
    const opciones_rangoedad = campo_rangoedad.options;
    for (var i = 0; i < opciones_rangoedad.length; i++) {
      var opcion = campo_rangoedad.options[i].text;
      var rango = opcion.match(/\d+/g).map(Number);
      if (rango.length == 2 && edadactual >= rango[0] && edadactual <= rango[1]) {
            campo_rangoedad.selectedIndex = i;
            break;
      }
      if (rango.length == 1 && edadactual >= rango[0]) {
            campo_rangoedad.selectedIndex = i;
            break;
      }
    }
  }
  blanquearFechanac(){
    const targetPersona = event.target.closest(".div-edad")
    const campo_anionac = targetPersona.querySelector('[data-edad-target="anionac"]');
    const campo_mesnac = targetPersona.querySelector('[data-edad-target="mesnac"]');
    const campo_dianac = targetPersona.querySelector('[data-edad-target="dianac"]');
    const campo_rangoedad = targetPersona.querySelector('[data-edad-target="rangoedad"]');
    const campo_edad = targetPersona.querySelector('[data-edad-target="edad"]');
    const campo_edadactual = targetPersona.querySelector('[data-edad-target="edadactual"]');

    if(event.target.dataset.edadTarget == "rangoedad"){
      campo_edad.value = null
      campo_edadactual.value = null
    }
    if(event.target.dataset.edadTarget == "edad"){
      campo_rangoedad.value = null
      campo_edadactual.value = null
    }
    if(event.target.dataset.edadTarget == "edadactual"){
      campo_edad.value = null
      campo_rangoedad.value = null
    }
    campo_anionac.value = null
    campo_mesnac.value = null
    campo_dianac.value = null
  }
}