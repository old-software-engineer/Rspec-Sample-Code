# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog do
  it 'check valid blog title' do
    blog1 = create(:blog)
    expect(blog1).to be_has_valid_title
  end

  it 'check invalid blog title' do
    blog2 = create(:not_approved_blog)
    expect(blog2).not_to be_has_valid_title
  end

  it 'create empty blog' do
    blog = build(:blog, title: nil, body: nil, imgurl: nil)
    expect(blog).not_to be_valid
  end

  it 'create blog with all correct params' do
    blog = create(:blog)
    expect(blog).to be_valid
  end

  it 'create blog with incorrect image url' do
    blog = build(:wrong_url_blog)
    expect(blog).not_to be_valid
  end

  it 'create blog with no title' do
    blog = build(:blog, title: nil)
    expect(blog).not_to be_valid
  end

  it 'create blog with no body' do
    blog = build(:blog, body: nil)
    expect(blog).not_to be_valid
  end

  it 'create blog with no image url' do
    blog = build(:blog, imgurl: nil)
    expect(blog).not_to be_valid
  end
end
