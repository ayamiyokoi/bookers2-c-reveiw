class Event < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :group
end
