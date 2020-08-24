import React, {useState, Fragment} from 'react'
import ReactDOM from 'react-dom'

const UbiForm = () => {
  
  const [datos, setDatos] = useState({
    nombre: '',
    apellido: '',
    pais: '',
    departamento: ''
  })
 
  const handleInputChange = (event) => {
    setDatos({
      ...datos,
      [event.target.name] : event.target.value
    })
  }

  const enviarDatos = (event) => {
    event.preventDefault();
  }

  return (
    <Fragment>
      <h1> Contador de ejemplo </h1>
      <form onSubmit={enviarDatos}>
        <div className="row">
          <div className="col-md-3">
            <label htmlFor="nombre">Nombre</label>
            <input 
              placeholder="Ingrese Nombre" 
              id="nombre"
              name="nombre"
              className="form-control"
              onChange={handleInputChange}
            ></input>
          </div>
          <div className="col-md-3">
            <label htmlFor="apellido">Apellido</label>
            <input 
              placeholder="Ingrese Apellido" 
              id="apellido"
              name="apellido"
              className="form-control"
              onChange={handleInputChange}
            ></input>
          </div>
        </div>
        <div className="row">
          <div className="col-md-3">
            <label htmlFor="pais">País</label>
            <select 
              className="form-control" 
              id="pais"
              name="pais"
              onChange={handleInputChange}
              >
              <option>Colombia</option>
              <option>Venezuela</option>
              <option>Perú</option>
              <option>Ecuador</option>
              <option>Panamá</option>
            </select>
          </div>
          <div className="col-md-3">
            <label htmlFor="departamento">Departamento</label>
            <select 
              className="form-control" 
              id="departamento"
              name="departamento"
              onChange={handleInputChange}
              >
              <option>Valle</option>
              <option>Cauca</option>
              <option>Nariño</option>
            </select>
          </div>
        </div>
        <div className="row">
          <div className="col-md-3">
            <button className="btn btn-primary" type="submit">Agregar</button>
          </div>
        </div>
      </form>
    </Fragment>
  )
}

export default UbiForm
