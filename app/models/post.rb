class Post < ApplicationRecord
  belongs_to :account
  has_one_attached :image
  has_many :likes

  def likes_count
    likes.count
  end

end
