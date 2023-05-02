class Post < ApplicationRecord
  belongs_to :account
  has_one_attached :image
  has_many :likes
  has_many :comments, dependent: :destroy

  def likes_count
    likes.count
  end

  def comments_count
    comments.count
  end

end
