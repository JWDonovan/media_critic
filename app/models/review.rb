class Review < ApplicationRecord
  belongs_to :movie
  
  has_rich_text :content

  validates :title, :rating, presence: true
end