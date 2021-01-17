class Movie < ApplicationRecord
  has_many :reviews
  accepts_nested_attributes_for :reviews

  has_rich_text :synopsis
  has_one_attached :poster

  validates :title, :release_year, presence: true
end