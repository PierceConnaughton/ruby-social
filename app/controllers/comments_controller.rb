class CommentsController < ApplicationController
    before_action :authenticate_account!
  
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.build(comment_params)
        comment.account = current_account
        
        if comment.save
          redirect_to post, notice: "Comment created successfully."
        else
          render :new
        end
      end
      
    
      
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
        @comment = Comment.find(params[:id])
      
        if @comment.update(comment_params)
          redirect_to @comment.post, notice: "Comment updated successfully."
        else
          render :edit
        end
      end
      
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
  
      redirect_to @comment.post, notice: "Comment deleted successfully."
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
  