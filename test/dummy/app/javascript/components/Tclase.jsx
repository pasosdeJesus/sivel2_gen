import React, {useState, Fragment} from 'react'
import ReactDOM from 'react-dom'

class Tclase extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      clase: '',
      tclase: ''
    }
    this.manejaCambio = this.manejaCambio.bind(this);
  }

  manejaCambio(event) {
    var ce = {}
    ce[event.target.name] = event.target.value
    this.setState(ce)
  }

  enviarDatos (event) {
    event.preventDefault();
  }

  render() {
    return (
      <Fragment>
      <label htmlFor="clase">Centro poblado</label>
      <select 
      className="form-control" 
      id="clase"
      name="clase"
      onChange={this.manejaCambio} >
      <option>Mosquera</option>
      <option>Madrid</option>
      <option>Facatativa</option>
      </select>
      <label htmlFor="tclase">Tipo de centro poblado</label>
      <select className="form-control" 
      id="tclase"
      name="tclase"
      onChange={this.manejaCambio} >
      <option>Cabecera Municipal</option>
      <option>Centro poblado</option>
      </select>
      <p>{JSON.stringify(this.state)}</p>
      </Fragment>
    )
  }

}

export default Tclase
