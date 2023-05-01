class PostsController < ApplicationController
  before_action :authenticate_account!, except: [:index]

  def index
    @posts = Post.order(created_at: :desc)
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