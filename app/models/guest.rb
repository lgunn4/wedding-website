# app/models/guest.rb
class Guest < ApplicationRecord
  has_many :song_requests, dependent: :destroy
  has_one :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :song_requests, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :at_least_one_song_request

  private

  def at_least_one_song_request
    errors.add(:song_request, 'At least one song request is required') if song_requests.empty?
  end
end
