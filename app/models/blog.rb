# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :imgurl, presence: true, format: { with: /\.(gif|jpg|png|jpeg|img)\Z/i }

  def has_valid_title?
    title.length > 3
  end
end
