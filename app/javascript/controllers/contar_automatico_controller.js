import { Controller } from "@hotwired/stimulus"
import Msip__Motor from "../msip/motor"

// Conecta con data-controller="sivel2-gen--contar-automatico"
export default class extends Controller {
  connect() {
    console.log("conectado con contar automatico controller")
  }

  contar(){
    const form = document.querySelector('form');
    const action = form.action;
    const formData = new FormData(form);
    let data = new URLSearchParams(formData).toString();
    data += '&commit=Contar';
    if (!window.dant || window.dant !== data) {
      Msip__Motor.enviarAutomaticoFormulario(form, 'POST', 'script', true, 'Contar');
    }
    window.dant = data;
  }

}
