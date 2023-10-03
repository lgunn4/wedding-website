# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :song_requests
end
