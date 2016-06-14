class CommentsController < ApplicationController
#--------------------------------------------------
    def show
        @comments = Comment.where(:post_id => params[:id])
    end
#--------------------------------------------------
    def new
    end
#--------------------------------------------------
    def create
      comment = Comment.new(comment_params)
      comment.user = current_user
      comment.post_id = params[:hidden_post_id]

      comment.save
      if comment.save
        flash[:notice] = "Comment successfully created"
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end

#--------------------------------------------------
    def destroy
      comment = Comment.find(params[:id])
      if comment.delete
        flash[:notice] = "Comment successfully deleted"
        redirect_to '/'
      else
        redirect_to '/'
      end
    end
#--------------------------------------------------
def edit
    @comment = Comment.find(params[:id])
end
#--------------------------------------------------
  def update
    comment = Comment.find(params[:hidden_comment_id])
    if comment.update(comment_params)
      flash[:notice] = "Comment successfully updated"
      redirect_to '/'
    else
      redirect_to '/comments/new'
    end
  end
  #--------------------------------------------------
  def comment_params
    params.require(:comment).permit(:content, :like)
  end
end
