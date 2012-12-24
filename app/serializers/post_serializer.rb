class PostSerializer < ApplicationSerializer
  attributes :title, :body, :created_at, :previous, :next, :posted_at, :updated_at, :created_at
  has_one :heaplog, key: :heaplog_id
end
