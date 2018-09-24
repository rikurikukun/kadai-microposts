class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :likes
  has_many :peter, through: :likes, source: :user
  
  validates :user_id, presence: true
  validates :content,presence: true, length: { maximum: 255 }
end
