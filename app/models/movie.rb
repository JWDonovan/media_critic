# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  # accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :reviews, reject_if: proc { |attributes| attributes['title'].blank? }

  has_rich_text :synopsis
  has_one_attached :poster

  validates :title, :release_year, presence: true

  def self.default_scope
    order('created_at DESC')
  end

  def self.highest_rated
    Movie.all.sort_by { |movie| movie.average_rating }.reverse
  end

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end
end
