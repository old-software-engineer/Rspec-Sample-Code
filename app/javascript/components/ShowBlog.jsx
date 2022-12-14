  import React, { Component } from 'react'
import {Link} from 'react-router-dom'
export class ShowBlog extends Component {

    
    constructor(){
        super();
        this.state = {
            blog: {}

        }
    }
    
    // Fetches data from api and sets the state
    async componentDidMount() {
        const  id  = window.location.href.split('/')[4]
        let url = `http://localhost:3000/api/v1/blogs/${id}`;
        let data = await fetch(url);
        let parsedData = await data.json()
        this.setState( parsedData )
      }

  render() {
        
    // Redirects the user to home page
    let handleBtb = (e) => {
        e.preventDefault();
        document.location.href="/";
    }

    // Deletes the selected blog
    let handleDelete = (e) => {
        e.preventDefault();
        fetch(`http://localhost:3000/api/v1/blogs/${window.location.href.split('/')[4]}`, { method: 'DELETE' })
        .then(() => document.location.href="/");
    } 

 

    return (
      // Shows the selected blog
      <div className='container my-3'>
         <img src={this.state.blog.imgurl} width={250} height={250} alt="..." />
         <h1>{this.state.blog.title}</h1>
         <p>{this.state.blog.body}</p>
         <button className='btn btn-primary mx-3' onClick={handleBtb}>Back to Blogs</button>
         <button className='btn btn-primary mx-3' onClick={handleDelete}>Delete this Blog</button>
         <button className='btn btn-success mx-3' ><Link  to={{
                      pathname: `/edit/${window.location.href.split('/')[4]}`
                    }}>Edit Blog </Link></button>
        </div>
    )
  }
}

export default ShowBlog;