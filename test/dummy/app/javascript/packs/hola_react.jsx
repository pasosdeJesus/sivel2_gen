// Run this example by adding <%= javascript_pack_tag 'hola_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hola React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Hola = props => (
  <div>Hola {props.nombre}!</div>
)

Hola.defaultProps = {
  nombre: 'David'
}

Hola.propTypes = {
  nombre: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.hydrate(
    <Hola nombre="React" />,
    document.querySelector('div.caso_ubicacion_tclase'),
  )
})
