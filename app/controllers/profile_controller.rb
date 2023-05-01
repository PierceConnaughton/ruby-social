class ProfileController < ApplicationController
  before_action :authenticate_account!

  def show
    @account = Account.find_by(username: params[:username])
    @posts = @account.posts.order(created_at: :desc) if @account
    if @account.username.nil?
      # handle the case when the account does not have a username
      # you can redirect to an error page or display a default username
      @username = "Unknown user"
    else
      @username = @account.username
    end
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

  def follow
    followee = Account.find_by(username: params[:username])
    current_account.following << followee
    redirect_to profile_show_path(followee.username)
  end

  def unfollow
    followee = Account.find_by(username: params[:username])
    current_account.active_follows.find_by(followee_id: followee.id).destroy
    redirect_to profile_show_path(followee.username)
    
  end

  private

  def account_params
    params.require(:account).permit(:accountname, :first_name, :last_name, :bio, :profile_image)
  end
end
