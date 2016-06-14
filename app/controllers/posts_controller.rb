class PostsController < ApplicationController
  before_filter :authorize, :except => [:login, :verify]
#--------------------------------------------------
  def index
      @posts = Post.all
  end
#--------------------------------------------------
  def new
      @post = Post.new
  end
#--------------------------------------------------
  def edit
    @post = Post.find(params[:id])
  end
#--------------------------------------------------
  def update
      post = Post.find(params[:id])
      if post.update(post_params)
        flash[:notice] = "Post successfully updated"
        redirect_to '/'
      else
        redirect_to '/posts/new'
      end
  end
#--------------------------------------------------
  def destroy
    post = Post.find(params[:id])
    if post.delete
      flash[:notice] = "Post successfully deleted"
      redirect_to '/'
    else
      redirect_to '/'
    end
  end
#--------------------------------------------------
  def create
      post = Post.new(post_params)
      post.user = current_user
      post.save
      if post.save
        flash[:notice] = "Post successfully created"
        redirect_to '/'
      else
        redirect_to '/login'
      end
  end
#--------------------------------------------------
  def post_params
    params.require(:post).permit(:title, :content, :image, :category)
  end
end
