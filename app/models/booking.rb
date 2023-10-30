
class Booking < ApplicationRecord
  belongs_to :monster, class_name: 'Monster', foreign_key: 'monster_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
