# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  has_rich_text :content

  validates :title, :rating, presence: true
end
