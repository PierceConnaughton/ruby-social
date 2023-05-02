class LikesController < ApplicationController
    include Turbo::StreamsHelper

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(account: current_account)

    respond_to do |format|
        format.turbo_stream
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end
end
