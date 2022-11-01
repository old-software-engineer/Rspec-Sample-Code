# frozen_string_literal: true

# Create blog table migration
class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :imgurl

      t.timestamps
    end
  end
end
