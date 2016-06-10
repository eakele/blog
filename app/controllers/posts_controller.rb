class PostsController < ApplicationController
  before_filter :authorize, :except => [:login, :verify]
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
end
