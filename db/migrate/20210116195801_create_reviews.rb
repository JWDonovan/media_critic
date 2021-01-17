# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title,   null: false
      t.decimal :rating, null: false

      t.timestamps null: false
    end

    add_foreign_key :reviews, :movies
  end
end
