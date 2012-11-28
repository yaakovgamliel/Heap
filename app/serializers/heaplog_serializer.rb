class HeaplogSerializer < ApplicationSerializer
  attributes :name, :description, :short_name, :url, :user_id
  has_one :user

  def user_id
    object.try(:user).try(:id)
  end
  
  def url
    user_log_url(object, user: object.user)
  end
end
