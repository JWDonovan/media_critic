# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title,         null: false
      t.integer :release_year, null: false

      t.timestamps null: false
    end
  end
end
