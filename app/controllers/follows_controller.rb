class FollowsController < ApplicationController
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
end
  