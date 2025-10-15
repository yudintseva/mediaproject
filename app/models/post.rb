class Post < ApplicationRecord
  enum :status, { draft: 0, published: 1 }, default: :draft

  belongs_to :user
  belongs_to :category
  has_many :attachments, dependent: :destroy
  has_many :comments,    dependent: :destroy
  has_many :likes,       dependent: :destroy

  validates :title, :slug, presence: true
  validates :slug, uniqueness: true

  scope :published, -> { where(status: :published) }

  before_validation -> { self.slug ||= title.to_s.parameterize }, on: :create
  # самый удобный порядок — по дате публикации, если её нет — по дате создания
scope :recent, -> { order(Arel.sql("COALESCE(published_at, created_at) DESC")) }

end
