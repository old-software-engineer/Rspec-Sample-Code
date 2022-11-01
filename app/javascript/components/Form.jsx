import React, { Component } from 'react'

export class Form extends Component {
  // Setting state for title, body and image url of blog 
    constructor(props) {
        super(props);
        this.state = {title: "", body:"", imgurl:""};
        this.updateStateTitle = this.updateStateTitle.bind(this) 
        this.updateStateBody = this.updateStateBody.bind(this) 
        this.updateStateImgurl = this.updateStateImgurl.bind(this) 
    }

    // function to set blog title
    updateStateTitle(title){ 
      this.setState({title :title }) 
    } 
    // function to set blog body
    updateStateBody(body){ 
      this.setState({body :body}) 
    } 
    // function to set blog image url
    updateStateImgurl(imgurl){ 
        this.setState({imgurl :imgurl}) 
      } 

      
      render() {
        // sends form data to the api with post request to create new blog
        let handleSubmit = async(e)=>{
           e.preventDefault();
           console.log( this.state.title)
           try {
            let res = await fetch("api/v1/blogs/create", {
              method: "POST",
              headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
              },      
              body: JSON.stringify({
                title: this.state.title,
                body: this.state.body,
                imgurl: this.state.imgurl
              }),
            });
            if (res.status === 200) {
              console.log(res,"Success")
              document.location.href="/";
            } else {
              console.log(res,"Something went wrong")
            }
           }catch (err) {
            console.log(err);
          }
           console.log("form submit")
           console.log(this.state.title)

           };
        return (
          // Form to create new blog
          <div className='container my-3'>
        <form onSubmit={handleSubmit}>
        <div className="mb-3">
            <label htmlFor="formGroupExampleInput" className="form-label">Enter Blog Title</label>
             <input type="text" value={this.state.title} onChange={(e) => this.updateStateTitle(e.target.value)} className="form-control" id="blogTitle" placeholder="Title" />
        </div>
        <div className="mb-3">
            <label htmlFor="formGroupExampleInput2" className="form-label">Enter Blog Content</label>
            <input type="text" value={this.state.body} onChange={(e) => this.updateStateBody(e.target.value)} className="form-control" id="blogBody" placeholder="Body" />
        </div>
        <div className="mb-3">
            <label htmlFor="formGroupExampleInput2" className="form-label">Enter Blog Image URL</label>
            <input type="text" value={this.state.imgurl} onChange={(e) => this.updateStateImgurl(e.target.value)} className="form-control" id="blogImgurl" placeholder="Image Url" />
        </div>
        <button type="submit" className="btn btn-primary">Create Blog</button>
        </form>
      </div>
    )
  }
}

export default Form