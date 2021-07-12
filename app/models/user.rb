# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :reviews

  devise :database_authenticatable,
         :registerable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  # validates :password, length: { minimum: 10, maximum: 128 }
  # validates :admin, inclusion: { in: [true, false] }

  def self.from_google(email:, provider:, uid:)
    create_with(uid: uid, provider: provider, password: Devise.friendly_token[0, 20]).find_or_create_by!(email: email)
  end
end
