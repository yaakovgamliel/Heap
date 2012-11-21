class HeaplogSerializer < ApplicationSerializer
  attributes :name, :description, :short_name, :url
  
  def url
    heaplog_url(object)
  end
end
