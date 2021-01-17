# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title,     null: false
      t.decimal :rating,   null: false
      t.references :movie, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
