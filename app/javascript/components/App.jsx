import React, { Component } from 'react'
import Blogs from './Blogs'
import Navbar from './Navbar'
import Form from './Form';
import ShowBlog from "./ShowBlog";
import EditBlog from './EditBlog';
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link
} from "react-router-dom";

export class App extends Component {
  render() {
    return (
        // React routes using react router dom
        <Router>
        <Navbar />
        <div className='conatiner my-3'>
        <Routes>
        <Route exact path="/newblog" element={<Form />}>
        </Route>
        <Route exact path="/" element={<Blogs />}>
        </Route>
        <Route  path="/show/:id" element={<ShowBlog />}>
        </Route>
        <Route  path="/edit/:id" element={<EditBlog />}>
        </Route>
        </Routes>
      </div>
      </Router>
    )
  }
}

export default App