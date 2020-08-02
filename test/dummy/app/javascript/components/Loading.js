import React, { Component } from 'react'
import Loader from 'react-loader-spinner';

export default class Loading extends Component {
    render() {
        return (
          <div className="loading-icon">
            <div
              style={{
                width: "100%",
                  height: "100",
                  display: "flex",
                  justifyContent: "center",
                  alignItems: "center"
              }}
              >
            <Loader type="ThreeDots" color="#266dd3" height="100" width="100" />
            </div>
          </div>
        )
    }
}
