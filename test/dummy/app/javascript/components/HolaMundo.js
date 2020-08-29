import React from "react"
import PropTypes from "prop-types"
class HolaMundo extends React.Component {
  render () {
    return (
      <React.Fragment>
        Saludo: {this.props.saludo}
      </React.Fragment>
    );
  }
}

HolaMundo.propTypes = {
  saludo: PropTypes.string
};
export default HolaMundo
