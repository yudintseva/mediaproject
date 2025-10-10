class Post < ApplicationRecord
  belongs_to :category
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  
  scope :recent, -> { order(created_at: :desc) }
end
