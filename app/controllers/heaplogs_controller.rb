class HeaplogsController < ApplicationController
  respond_to :json, :html

  before_filter :generate_scope

  def index
    @heaplogs = if params[:ids]
                  @scope.where(:_id.in => params[:ids])
                else
                  @scope.all
                end
    respond_with @heaplogs
  end

  def show
    @heaplog = @scope.with_short_name(params[:id])
    respond_with @heaplog
  end

  private

  def generate_scope
    @user = User.with_nickname(params[:user])
    @scope = if @user
               @user.heaplogs
             else
               Heaplog
             end
  end
end
