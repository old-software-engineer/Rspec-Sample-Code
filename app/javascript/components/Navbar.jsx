import React, { Component } from 'react'

export default class Navbar extends Component {
  render() {
    return (
      // Navigation bar
      <div>
       <nav className="navbar navbar-dark bg-dark">
         <div className="container-fluid">
         <a className="navbar-brand" href="/">ExtraOrdinary Blogs</a>
         </div>
       </nav>
      </div>
    )
  }
}
