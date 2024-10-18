# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :rsvp

  validates :street, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end
