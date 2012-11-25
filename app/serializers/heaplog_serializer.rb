class HeaplogSerializer < ApplicationSerializer
  attributes :name, :description, :short_name, :url
  has_one :user
  
  def url
    user_log_url(object, user: object.user)
  end
end
