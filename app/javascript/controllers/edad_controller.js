import { Controller } from "@hotwired/stimulus"
// Calcula edad, edadactual y rango dada fecha de nacimiento o viceversa


// Conecta con data-controller="sivel2-gen--edad"
export default class Sivel2Gen__EdadController extends Controller {


  static MESES = ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic']


  static partirFechaLocalizada(fechaLocalizada, formato) {
    let anio = 1900
    let dia = 15
    let mes = 6
    if (formato == 'dd/M/yyyy' || formato == 'dd-M-yyyy') {
      anio = +fechaLocalizada.slice(7,11)
      dia = +fechaLocalizada.slice(0,2)
      let nmes = fechaLocalizada.slice(3,6)
      if (typeof nmes != 'undefined' && 
        Sivel2Gen__EdadController.MESES.includes(nmes.toLowerCase())) {
        mes = Sivel2Gen__EdadController.MESES.indexOf(nmes.toLowerCase()) + 1
      } else {
        mes = 6
      }
    } else {
      if (typeof fechaLocalizada == 'string') {
        anio = +fechaLocalizada.slice(0,4)
        mes = +fechaLocalizada.slice(5,7)
        dia = +fechaLocalizada.slice(8,10)
      } else {
        anio = 1900
        mes = 1
        dia = 1
      }
    }
    return [anio, mes, dia]
  }


  static targets = [
    "anionac",
    "dianac",
    "edad",
    "edadactual",
    "mesnac",
    "rangoedad"
  ]

  connect() {
    console.log("Conexion de controlador edades establecida")
  }

  obtenerNumeroMes(nombreMes) {
    return Sivel2Gen__EdadController.MESES.indexOf(nombreMes.toLowerCase());
  }


  actualizarEdad(event){
    let anio = parseInt(this.anionacTarget.value);
    let mes = parseInt(this.mesnacTarget.value) - 1;
    let dia = parseInt(this.dianacTarget.value);

    if (isNaN(mes)) {
      mes = 0
    }
    if (isNaN(dia)) {
      dia = 1
    }
    let formatoFecha = window.formato_fecha;
    let campoFechaCaso = document.querySelector('#caso_fecha_localizada');
    if (campoFechaCaso == null) {
      campoFechaCaso = document.querySelector('#caso_fecha');
      formatoFecha = "yyyy-mm-dd"
    }
    if (campoFechaCaso == null) {
      alert("No se encontró campo con la fecha del caso");
    }
    let anioCaso, mesCaso, diaCaso;
    [anioCaso, mesCaso, diaCaso] = Sivel2Gen__EdadController.partirFechaLocalizada(
      campoFechaCaso.value, formatoFecha
    );
    const hoy = new Date();

    let fechaCaso = new Date(anioCaso, mesCaso, diaCaso);
    let fechaNacimiento = new Date(anio, mes, dia);
    // El campo cambiado fue edad
    if (event.target.dataset['sivel2Gen-EdadTarget'] == 'edad') {
      let edad = parseInt(this.edadTarget.value)
      anio = fechaCaso.getFullYear() - edad
      mes = 0
      dia = 1
      this.anionacTarget.value = anio
    }
    // El campo cambiado fue edadactual
    if (event.target.dataset['sivel2Gen-EdadTarget'] == 'edadactual') {
      let edadactual = parseInt(this.edadactualTarget.value)
      anio = hoy.getFullYear() - edadactual
      mes = 0
      dia = 1
      this.anionacTarget.value = anio
    }
    fechaNacimiento = new Date(anio, mes, dia);
    let edadactual = hoy.getFullYear() - anio;
    let edad = fechaCaso.getFullYear() - anio;

    if (hoy.getMonth() < fechaNacimiento.getMonth() ||
      (hoy.getMonth() === fechaNacimiento.getMonth() &&
        hoy.getDate() < fechaNacimiento.getDate())
    ) {
      edadactual--;
    }
    if (fechaCaso.getMonth() < fechaNacimiento.getMonth() ||
      (fechaCaso.getMonth() === fechaNacimiento.getMonth() &&
        fechaCaso.getDate() < fechaNacimiento.getDate())
    ) {
      edad--;
    }
    if (edad > 0) {
      this.edadTarget.value = edad;
    } else {
      this.edadTarget.value = 0;
    }
    if (this.hasEdadactualTarget) {
      if (edadactual > 0 ) {
        this.edadactualTarget.value = edadactual;
      } else {
        this.edadactualTarget.value = 0;
      }
    }

    const opcionesRangoedad = this.rangoedadTarget.options;
    for (let i = 0; i < opcionesRangoedad.length; i++) {
      let opcion = this.rangoedadTarget.options[i].text;
      let rango = opcion.match(/\d+/g).map(Number);
      if (rango.length == 2 && edadactual >= rango[0] &&
        edadactual <= rango[1]) {
        this.rangoedadTarget.selectedIndex = i;
        break;
      }
      if (rango.length == 1 && edadactual >= rango[0]) {
        this.rangoedadTarget.selectedIndex = i;
        break;
      }
    }
  }

  blanquearFechanac(){
    if (event.target.dataset['sivel2Gen-EdadTarget'] == 'rangoedad') {
      this.edadTarget.value = null
      this.edadactualTarget.value = null
    }
    if (event.target.dataset['sivel2Gen-EdadTarget'] == 'edad') {
      this.rangoedadTarget.value = null
      this.edadactualTarget.value = null
    }
    if (event.target.dataset['sivel2Gen-EdadTarget'] == 'edadactual') {
      this.edadTarget.value = null
      this.rangoedadTarget.value = null
    }
    this.anionacTarget.value = null
  }
}
