class UserSerializer < ApplicationSerializer
  attributes :name, :nickname, :location, :image, :description, :extra_url, :url, :provider
  has_many :heaplogs

  def url
    user_summary_url(id: user)
  end
end
