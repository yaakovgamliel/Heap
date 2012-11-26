class UsersController < ApplicationController
  respond_to :json

  def index
    @scope = User.all
    @scope = @scope.with_nickname(params[:nickname]) if params[:nickname]

    @users = @scope
    respond_with @users
  end

  def show
    @user = User.with_nickname(params[:id]).last
    respond_with @user
  end
end
