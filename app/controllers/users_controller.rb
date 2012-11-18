class UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all
    respond_with UserIndexPresenter.create(@users)
  end

  def show
    @user = User.with_stub(params[:id])
    respond_with UserPresenter.new(@user)
  end
end
