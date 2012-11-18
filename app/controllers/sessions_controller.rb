class SessionsController < ApplicationController
  respond_to :json

  def create
    auth = request.env['omniauth.auth']
    Rails.logger.debug "Auth: #{auth['info']}"
    unless @auth = Authorisation.find_from_hash(auth)
      @auth = Authorisation.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user

    respond_with UserPresenter.new(current_user)
  end

  def destroy
    self.current_user = nil
    redirect_to root_url
  end
end
