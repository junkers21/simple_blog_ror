class Post < ApplicationRecord
  has_one_attached :picture

  validates :title, :author, :content, presence: true
  validates :title, :author, length: {minimum: 2}
  validates :title, :author, length: {maximum: 50}
  validates :content, length: {minimum: 50}
  validates :content, length: {maximum: 2000}
  validates :picture, attached: true, size: { less_than: 100.megabytes , message: 'is too large' }, content_type: [:png, :jpg, :jpeg]

  def title
    self[:title]
  end
  def author
    self[:author]
  end
  def content
    self[:content]
  end
  def get_picture_url
    Rails.application.routes.url_helpers.url_for(picture)
  end
end
