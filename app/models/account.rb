class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true

  


  # Relationships
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followee
  has_many :followers, through: :passive_follows, source: :follower

  def following?(other_account)
    self.following.include?(other_account)
  end

  def followers_count
    followers.count
  end

  def following_count
    following.count
  end

  def sign_up_params
    params.require(:account).permit(:username, :first_name, :last_name, :bio, :profile_image, :email, :password, :password_confirmation)
  end
  
  def account_update_params
    params.require(:account).permit(:username, :first_name, :last_name, :bio, :profile_image, :email, :password, :password_confirmation, :current_password)
  end
end
