class ProfileController < ApplicationController
  before_action :authenticate_account!

  def show
    @account = Account.find_by(username: params[:username])
    @posts = @account.posts.order(created_at: :desc) if @account
  end
  

  def edit
    @account = current_account
  end

  def update
    @account = current_account
    if @account.update(account_params)
      flash[:success] = "Profile updated successfully"
      redirect_to profile_path(@account)
    else
      render 'edit'
    end
  end

  private

  def account_params
    params.require(:account).permit(:accountname, :first_name, :last_name, :bio, :profile_image)
  end
end
