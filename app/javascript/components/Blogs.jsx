import React, { Component } from 'react'
import Blog from './Blog'
import { Link } from 'react-router-dom'

export class Blogs extends Component {

    constructor(){
        super();
        this.state = {
            blogs: []

        }
    }

    // Fetches data from api and sets component state
    async componentDidMount(){
        let url = "api/v1/blogs/index";
        let data = await fetch(url);
        let parsedData = await data.json()
        this.setState({blogs: parsedData})
    }

  render() {
    return (
      // Render all blogs and butoon to create new blog
      <div className='container my-3'>
        <h1>ExtraOrdinarily Ordinary Blogs</h1>
        <div className='row'>
        {this.state.blogs.map((element)=>{
            return <div className='col-md-4' key={element.id}>
                <Blog title = {element.title}  body= {element.body} imgurl= {element.imgurl} id={element.id} />
            </div> 
        })}
        </div>
        <button className='btn btn-dark'>
        <Link  to="/newblog">Add New Blog</Link>
        </button>
      </div>
      
    )
  }
}

export default Blogs