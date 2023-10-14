# app/models/guest.rb
class Guest < ApplicationRecord
  has_many :song_requests, dependent: :destroy
  has_one :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :song_requests, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
