class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy

  def sign_up_params
    params.require(:account).permit(:username, :first_name, :last_name, :bio, :profile_image, :email, :password, :password_confirmation)
  end
  
  def account_update_params
    params.require(:account).permit(:username, :first_name, :last_name, :bio, :profile_image, :email, :password, :password_confirmation, :current_password)
  end
end
