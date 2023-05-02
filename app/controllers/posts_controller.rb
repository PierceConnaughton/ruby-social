class PostsController < ApplicationController
  before_action :authenticate_account!, except: [:index]

  def index
    following_ids = current_account.following.pluck(:id)
    @posts_following = Post.where(account_id: following_ids).order(created_at: :desc)
    @posts_not_following = Post.where.not(account_id: following_ids).order(created_at: :desc)
    @comment = Comment.new
  end
  
  

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  

  def create
    @post = current_account.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post created successfully'
    else
      flash[:error] = 'Unable to create post.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
