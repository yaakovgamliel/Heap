class HeaplogsController < ApplicationController
  respond_to :json

  def index
    @heaplogs = Heaplog.all
    respond_with @heaplogs
  end

  def show
    @heaplog = Heaplog.with_short_name(params[:id])
    respond_with @heaplog
  end
end
