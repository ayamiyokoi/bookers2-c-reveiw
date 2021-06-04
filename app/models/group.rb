class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :events, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  attachment :group_image, destroy: false
end
