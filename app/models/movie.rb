class Movie < ApplicationRecord
  has_rich_text :synopsis
  has_one_attached :poster

  validates :title, :release_year, presence: true
end