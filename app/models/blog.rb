# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :imgurl, presence: true, format: { with: /\.(gif|jpg|png|jpeg|img)\Z/i }

  def has_valid_title?
    title.length > 3
  end

  def short_blog?
    body.length < 50
  end
end
