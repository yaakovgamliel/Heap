class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.in_reverse_chronological_order
    respond_with PostIndexPresenter.create(@posts)
  end

end
