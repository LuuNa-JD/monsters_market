class Monster < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
end
