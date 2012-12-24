class HeaplogSerializer < ApplicationSerializer
  attributes :name, :description, :short_name, :url, :banner_url
  has_one :user, key: :user_id
  has_many :posts, key: :posts

  def url
    user_log_url(object, user: object.user)
  end

  def posts
    object.posts.in_reverse_chronological_order
  end
end
