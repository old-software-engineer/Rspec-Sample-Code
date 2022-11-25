# frozen_string_literal: true

require 'json'
require 'rails_helper'
RSpec.describe 'Api::V1::Blogs' do
  file = File.read('/home/codegarage/Workspace/Rspec-Sample-Code/spec/requests/api/v1/blog_params.json')

  let!(:blogs) { create(:blog) }
  let(:data_hash) { JSON.parse(file) }
  let(:changed_title) { { 'title' => data_hash['change_title']['title'], 'body' => data_hash['blog_all']['body'], 'imgurl' => data_hash['blog_all']['imgurl'] } }
  let(:changed_body) { { 'title' => data_hash['blog_all']['title'], 'body' => data_hash['change_body']['body'], 'imgurl' => data_hash['blog_all']['imgurl'] } }
  let(:changed_imgurl) { { 'title' => data_hash['blog_all']['title'], 'body' => data_hash['blog_all']['body'], 'imgurl' => data_hash['change_url']['imgurl'] } }

  describe 'GET /api/v1/blogs' do
    it 'index' do
      get api_v1_blogs_index_path
      expect(response).to have_http_status(:ok)
    end

    it 'check data on index' do
      get api_v1_blogs_index_path
      total = Blog.all
      expect(response.body).to match total.to_json
    end
  end

  describe 'POST /api/v1/blogs/create' do
    it 'create blog without params' do
      post api_v1_blogs_create_path
      expect(response).to have_http_status(:internal_server_error)
    end

    it 'create blog with title only' do
      post api_v1_blogs_create_path, params: data_hash['only_title']
      expect(response).to have_http_status(:internal_server_error)
    end

    it 'create blog with description only' do
      post api_v1_blogs_create_path, params: data_hash['only_body']
      expect(response).to have_http_status(:internal_server_error)
    end

    it 'create blog with url only' do
      post api_v1_blogs_create_path, params: data_hash['only_imgurl']
      expect(response).to have_http_status(:internal_server_error)
    end

    it 'create blog with all params' do
      post api_v1_blogs_create_path, params: data_hash['blog_all']
      expect(response).to have_http_status(:ok)
    end

    it 'blog count after create' do
      expect do
        post api_v1_blogs_create_path, params: data_hash['blog_all']
      end.to change(Blog, :count).by(1)
    end

    it 'check data after create' do
      post api_v1_blogs_create_path, params: data_hash['blog_all']
      data = JSON.parse(response.body, symbolize_names: true)
      blog = { 'title' => data[:blog][:title], 'body' => data[:blog][:body], 'imgurl' => data[:blog][:imgurl] }
      expect(blog).to eq(data_hash['blog_all'])
    end

    it 'create blog with invalid image url' do
      post api_v1_blogs_create_path, params: data_hash['invalid_url']
      expect(response).to have_http_status(:internal_server_error)
    end
  end

  describe 'GET /api/v1/blogs/:id' do
    it 'show' do
      get api_v1_path(blogs.id)
      expect(response).to have_http_status(:ok)
    end

    it 'responds with a 404 if the page is not found' do
      get api_v1_path('abcd')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT/PATCH /api/v1/blogs/:id' do
    it 'update blog title' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_title']
      expect(response).to have_http_status(:ok)
    end

    it 'blog title after update' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_title']
      data = JSON.parse(response.body, symbolize_names: true)
      blog = { 'title' => data[:blog][:title], 'body' => data[:blog][:body], 'imgurl' => data[:blog][:imgurl] }
      expect(blog).to eq(changed_title)
    end

    it 'update blog body' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_body']
      expect(response).to have_http_status(:ok)
    end

    it 'blog body after update' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_body']
      data = JSON.parse(response.body, symbolize_names: true)
      blog = { 'title' => data[:blog][:title], 'body' => data[:blog][:body], 'imgurl' => data[:blog][:imgurl] }
      expect(blog).to eq(changed_body)
    end

    it 'update correct blog image url' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_url']
      expect(response).to have_http_status(:ok)
    end

    it 'blog image url after update' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_url']
      data = JSON.parse(response.body, symbolize_names: true)
      blog = { 'title' => data[:blog][:title], 'body' => data[:blog][:body], 'imgurl' => data[:blog][:imgurl] }
      expect(blog).to eq(changed_imgurl)
    end

    it 'update incorrect blog image url' do
      patch "/api/v1/blogs/#{blogs.id}", params: data_hash['change_incorrect_url']
      expect(response).to have_http_status(:internal_server_error)
    end
  end

  describe 'DELETE /api/v1/blogs/:id' do
    it 'delete blog' do
      delete "/api/v1/blogs/#{blogs.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'blogs count after delete' do
      expect do
        delete "/api/v1/blogs/#{blogs.id}"
      end.to change(Blog, :count).by(-1)
    end
  end
end
