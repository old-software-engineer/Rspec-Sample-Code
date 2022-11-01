import React, { Component } from 'react'
import { Link } from 'react-router-dom'

export class Blog extends Component {
  render() {
    let {title, body, imgurl, id} = this.props
    return (
      // Displays a blog as card
      <div className="my-3">
            <div className="card" style={{width: "18rem"}}>
                <img src={imgurl} className="card-img-top" alt="..." />
                <div className="card-body">
                    <h5 className="card-title">{title}</h5>
                    <p className="card-text">{body}</p>
                    <button className='btn btn-dark'>
                    <Link  to={{
                      pathname: `/show/${id}`
                    }}>Show Blog </Link>
                    </button>
                </div>
            </div>
        </div>
    )
  }
}

export default Blog