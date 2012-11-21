class UserSerializer < ApplicationSerializer
  attributes :name, :nickname, :location, :image, :description, :extra_url, :url

  def url
    user_url(object)
  end
end
