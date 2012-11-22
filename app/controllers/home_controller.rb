class HomeController < ApplicationController
  def index
    redirect_to User.default.heaplogs.first
  end
end
