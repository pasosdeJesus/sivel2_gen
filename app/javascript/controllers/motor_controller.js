import { Controller } from "@hotwired/stimulus"
import Msip__Motor from "../msip/motor"

// Conecta con data-controller="sivel2-gen--motor"
export default class extends Controller {
  static targets = ["idcaso"]

  connect() {
    console.log("conectado con motor controller sivel2-gen")
    Msip__Motor.configurarElementosTomSelect()
  }



}
