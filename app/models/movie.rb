class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
end