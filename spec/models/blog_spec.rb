# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'check valid blog title' do
    blog = Blog.create(title: 'title', body: 'body', imgurl: 'https://encrypt.jpg')
    expect(blog).to be_has_valid_title
  end

  it 'check invalid blog title' do
    blog = Blog.create(title: 'ax', body: 'body', imgurl: 'https://encrypt.jpg')
    expect(blog).not_to be_has_valid_title
  end

  it 'check for short blog' do
    blog = Blog.create(title: 'ax', body: 'test body', imgurl: 'https://encrypt.jpg')
    expect(blog).to be_short_blog
  end

  it 'check for large blog' do
    blog = Blog.create(title: 'ax', body: "Lorem Ipsum is simply dummy text of the
    printing and typesetting industry. Lorem Ipsum has been the industry's standard
    dummy text ever since the 1500s, when an unknown printer took a galley of type
     and scrambled it to make a type specimen book. It has survived not only five", imgurl: 'https://encrypt.jpg')
    expect(blog).not_to be_short_blog
  end

  it 'create blog with title only' do
    blog = Blog.create(title: 'title only')
    expect(blog.id).to eq(nil)
  end

  it 'create blog with description only' do
    blog = Blog.create(body: 'body only')
    expect(blog.id).to eq(nil)
  end

  it 'create blog with image url only' do
    blog = Blog.create(imgurl: 'test.jpg')
    expect(blog.id).to eq(nil)
  end

  it 'create blog with all correct params' do
    blog = Blog.create(title: 'title 1', body: 'body', imgurl: 'test.jpg')
    expect(blog.id).not_to eq(nil)
  end

  it 'create blog with incorrect image url' do
    blog = Blog.create(title: 'title 1', body: 'body', imgurl: 'https://encrypted-tbn0.gstatic.')
    expect(blog.id).to eq(nil)
  end
end
