class UsersController < ApplicationController
  respond_to :json, :html

  def index
    @scope = User.all
    @scope = @scope.with_nickname(params[:nickname]) if params[:nickname]

    @users = @scope
    respond_with @users
  end

  def show
    @user = User.with_nickname(params[:id]).last
    if @user
      respond_with @user
    else
      not_found "No such user @#{params[:id]}."
    end
  end
end
