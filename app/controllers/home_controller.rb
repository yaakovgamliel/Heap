class HomeController < ApplicationController
  def index
    redirect_to user_summary_url(current_user || User.default)
  end
end
