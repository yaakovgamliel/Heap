class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  def self.responder
    SerializingResponder
  end

  private

  def not_found(message="Not Found")
    raise ActionController::RoutingError.new message
  end
end
