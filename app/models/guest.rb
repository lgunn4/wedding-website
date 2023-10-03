class Guest < ApplicationRecord
  has_many :song_requests
end
