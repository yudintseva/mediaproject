class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
  before_validation -> { self.slug ||= name.to_s.parameterize }, on: :create
end
