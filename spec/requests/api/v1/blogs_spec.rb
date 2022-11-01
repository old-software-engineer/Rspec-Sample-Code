# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Blogs', type: :request do
  describe 'GET /api/v1/blogs' do
    it 'index' do
      get api_v1_blogs_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/blogs/create' do
    it 'create blog without params' do
      post api_v1_blogs_create_path
      expect(response.status).to eq(500)
    end
    it 'create blog with title only' do
      post api_v1_blogs_create_path(title: 'title only')
      expect(response.status).to eq(500)
    end
    it 'create blog with description only' do
      post api_v1_blogs_create_path(body: 'body only')
      expect(response.status).to eq(500)
    end
    it 'create blog with url only' do
      post api_v1_blogs_create_path(imgurl: 'test.jpg')
      expect(response.status).to eq(500)
    end
    it 'create blog with all params' do
      post api_v1_blogs_create_path(title: 'title 1', body: 'body', imgurl: 'test.jpg')
      expect(response.status).to eq(200)
    end
    it 'create blog with extra params' do
      post api_v1_blogs_create_path(title: 'title 2', body: 'body', imgurl: 'test.jpg', extra: 'extra param')
      expect(response.status).to eq(200)
    end
    it 'create blog with invalid image url' do
      post api_v1_blogs_create_path(title: 'title', body: 'body', imgurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIL9S7PImqTRrGPGBHkGbK4nTzpEQxO5Gtv0IgYFzt&s')
      expect(response.status).to eq(500)
    end
  end

  describe ' PUT/PATCH /api/v1/blogs/:id' do
    let!(:blog) { Blog.create(title: 'sample title 1', body: 'sample body', imgurl: 'http://test.jpg') }
    it 'update blog title' do
      patch "/api/v1/blogs/#{blog.id}", params: { title: 'sample title 2' }
      expect(response.status).to eq(200)
    end
    it 'update blog body' do
      patch "/api/v1/blogs/#{blog.id}", params: { body: 'sample body 2' }
      expect(response.status).to eq(200)
    end
    it 'update correct blog image url' do
      patch "/api/v1/blogs/#{blog.id}", params: { imgurl: 'sample_image.jpg' }
      expect(response.status).to eq(200)
    end
    it 'update incorrect blog image url' do
      patch "/api/v1/blogs/#{blog.id}", params: { imgurl: 'sample body 2' }
      expect(response.status).to eq(500)
    end
  end

  describe "DELETE\t/api/v1/blogs/:id" do
    let!(:blog) { Blog.create(title: 'sample title 1', body: 'sample body', imgurl: 'http://test.jpg') }
    it 'delete blog' do
      delete "/api/v1/blogs/#{blog.id}", params: { title: 'sample title 2' }
      expect(response.status).to eq(200)
    end
  end
end
