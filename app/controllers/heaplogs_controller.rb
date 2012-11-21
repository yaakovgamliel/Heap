class HeaplogsController < ApplicationController
  respond_to :json

  def index
    @heaplogs = if params[:ids]
                  Heaplog.where(:_id.in => params[:ids])
                else
                  Heaplog.all
                end
    respond_with @heaplogs
  end

  def show
    @heaplog = Heaplog.with_short_name(params[:id])
    respond_with @heaplog
  end
end
