class PostSerializer < ApplicationSerializer
  attributes :title, :body, :created_at, :previous, :next, :heaplog_id, :posted_at, :updated_at, :created_at
  has_one :heaplog

  def heaplog_id
    object.try(:heaplog).try(:id)
  end
end
