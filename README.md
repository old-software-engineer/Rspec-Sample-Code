# Rspec-Sample-Code

Simple blog app created with React.js and Ruby on Rails with Rspec test cases for controller and model.

## Technologies

Project is created with:

- React 18.2.0
- Node 6.0.0
- Ruby 3.1.2
- Rails 7.0.4
- RSpec 3.11
- Factories

## Setup

To run this project, install it locally:

```
$ cd ../<directory name>
$ npm install
$ rails db:create
$ rails db:migrate
$ rails s
```

In order to run test case for Blog model run:

```
$ bundle exec rspec ./spec/models/blog_spec.rb
```

In order to run test case for Blog controller run:

```
$ bundle exec rspec ./spec/requests/api/v1/blogs_spec.rb
```

## Screenshots

### Blog Listing

![Index](https://user-images.githubusercontent.com/15182066/207579239-c235fa0a-4ef6-493e-8e2f-605f72f6e685.png)

### Show Blog

![Showblog](https://user-images.githubusercontent.com/15182066/207579428-69556d81-0461-4a88-a56a-2d4d51a91e18.png)

## About

Rspec-Sample-Code is simple web apllication which implements basic CRUD operations on blogs,
using React.js for the frontend and Ruby on Rails for the backend and have rspec test cases for the controller and model.

## About Rspec

RSpec is a Behavior driven development tool. What this means is that, tests written in RSpec focus on the “behavior” of an application being tested.

**Screenshots**

### Sucessful Run Of Test Case's For Blog Model

In the ./spec/models/blog_spec.rb data sent passes all the test cases.

![model rspec](https://user-images.githubusercontent.com/15182066/207582704-f753a7f4-0580-4a9a-be57-b91e7978b044.png)

### Sucessful Run Of Test Case's For Blog Controller

In the ./spec/requests/api/v1/blogs_spec.rb data sent passes all the test cases.

![controller rspec](https://user-images.githubusercontent.com/15182066/207582776-15b3ad8f-9dbe-42c6-9d53-29d939de7529.png)

### Failed Test Case For Blog Model

In the ./spec/models/blog*spec.rb if we remove the not* from line 28 we get the error Imgurl is invalid and the test case fails.

![error rspec model](https://user-images.githubusercontent.com/15182066/207584273-8a2decb5-ea36-4867-b620-738eb50f9e2b.png)

### Failed Test Case For Blog Controller

In the ./spec/requests/api/v1/blogs_spec.rb if we change the expected status code of the response to 200 in line 68 then we get the failed test case of creating an empty blog.

![error rspec controller](https://user-images.githubusercontent.com/15182066/207584363-626a10a0-c9d0-4872-ae4e-e440eec7e453.png)

## Flow

**Rails Flow**:

In the rails setup there is a single route for our landing page which is empty. The controller has a single index action.
This controller’s only function is to provide a direct route from Rails to React, which is why we’re only setting the index method.

**API Controller**:
The blog api controller consists of seprate actions for CRUD and the response is rendered in json.

**React Flow**:

Add the following line of code to the < head> tag of app/views/layouts/application.html.erb file:
< %= javascript_pack_tag 'index' %>
This will add the JavaScript pack to our application header, which will cause all the JavaScript files, including React ones, to be executed within the index page.

index.jsx imbeds a div container in our empty page with react App component. This will initiate our react app.

The App.jsx consists of all the routes of our react app and the components corresponding to the routes.

(In all components Bootstrap is being used for styling.)

**Other components**:

**Navbar**: Navbar consists of a simple bootstrap navbar with title of the app.

**Blogs**: Blogs fetches and maps through the data from the api and sends it as props to Blog component.All the blogs are rendered inside this component. It also contains a button to create new blog.

**Blog**: Blog component display individual blog as a card using props.

**ShowBlog**: ShowBlog component displays individual blogs in seprate page and contains buttons to edit and delete the blog.

**EditBlog**: EditBlog renders a form to edit the selected blog and sends a PATCH request to the rails API.

**Form**: Form renders a bootstrap form to create new blog and sends a POST request to the API.

## Gems

**React-Rails**: React-Rails gem is used in this aap to implement React.

**Webpacker**: Webpacker gem is a tool that integrates Webpack with a Rails application. It makes it easy to configure and develop JavaScript-like applications and optimize them for the production environment.

**Rubocop-rails**: Rubocop uses the official ruby style guide and helps create a clean and readable codebase.

**RSpec 3.11**: RSpec Rails defines ten different types of specs for testing different parts of a typical Rails application

**Factory Bot Rails**: factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies and support for multiple factories for the same class including factory inheritance.

## Add New Components

To add new component create a new jsx file inside app/javascript/components with component name starting with capital letter. Import the file where you want to render the component.

## Linting And Formatting

### Rubocop

- RuboCop is a Ruby code style checking and code formatting tool.
