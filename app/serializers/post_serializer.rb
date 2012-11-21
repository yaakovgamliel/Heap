class PostSerializer < ApplicationSerializer
  attributes :title, :body, :created_at, :previous, :next
end
