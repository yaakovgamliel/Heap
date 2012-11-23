class HomeController < ApplicationController
  def index
    redirect_to User.default
  end
end
