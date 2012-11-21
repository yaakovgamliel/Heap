class UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.with_nickname(params[:id])
    respond_with @user
  end
end
