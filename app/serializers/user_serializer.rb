class UserSerializer < ApplicationSerializer
  attributes :name, :nickname, :location, :image, :description, :extra_url, :url
  has_many :heaplogs, embed: :ids

  def url
    user_url(object)
  end
end
