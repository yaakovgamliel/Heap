class PostSerializer < ApplicationSerializer
  attributes :title, :body, :created_at, :previous, :next, :heaplog_id
  has_one :heaplog

  def heaplog_id
    object.try(:heaplog).try(:to_param)
  end
end
