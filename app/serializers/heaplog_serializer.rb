class HeaplogSerializer < ApplicationSerializer
  attributes :name, :description, :short_name, :url
  has_one :user
  
  def url
    heaplog_url(object)
  end
end
