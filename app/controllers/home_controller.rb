class HomeController < ApplicationController
  def index
    redirect_to user_summary_url(User.default)
  end
end
