class UserSerializer < ApplicationSerializer
  attributes :name, :nickname, :location, :image, :description, :extra_url, :url
  has_many :heaplogs

  def url
    user_summary_url(user: user)
  end
end
