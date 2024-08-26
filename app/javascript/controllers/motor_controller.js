import { Controller } from "@hotwired/stimulus"
import Msip__Motor from "../msip/motor"

// Conecta con data-controller="sivel2-gen--motor"
export default class extends Controller {
  static targets = ["idcaso"]

  connect() {
    console.log("conectado con motor controller sivel2-gen")
    Msip__Motor.configurarElementosTomSelect()
  }

  contar_automatico(){
    const form = document.querySelector('form');
    const action = form.action;
    const formData = new FormData(form);
    let data = new URLSearchParams(formData).toString();
    data += '&commit=Contar';
    const root = window
    if (!root.dant || root.dant !== data) {
      msip_enviarautomatico_formulario(form, 'POST', 'script', true, 'Contar');
    }
    root.dant = data;
  }

}
