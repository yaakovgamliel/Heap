class PostsController < ApplicationController
  respond_to :json, :html

  def index
    @posts = Post.in_reverse_chronological_order
    respond_with @posts
  end

  def show
    @post = Post.with_token(params[:id])
    respond_with @post
  end

end
