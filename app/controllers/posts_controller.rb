class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.in_reverse_chronological_order
    respond_with PostIndexPresenter.create(@posts)
  end

  def show
    @post = Post.with_stub(params[:id])
    respond_with PostPresenter.new(@post)
  end

end
