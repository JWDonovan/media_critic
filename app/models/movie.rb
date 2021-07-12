# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  # accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :reviews, reject_if: proc { |attributes| attributes['title'].blank? }

  has_rich_text :synopsis
  has_one_attached :poster

  validates :title, :release_year, presence: true

  # add average review method, order by highest review scope, and url to match
  def self.default_scope
    order('created_at DESC')
  end

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end
end
