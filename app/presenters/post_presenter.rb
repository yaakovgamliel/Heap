class PostPresenter < ApplicationPresenter
  def default_serialiser_fields
    [:title, :stub, :body, :created_at]
  end

  def serialiser_extras
    { url:        post_url(delegate) }.tap do |h|
      h[:previous] = PostIndexPresenter.new(delegate.previous) if delegate.previous
      h[:next]     = PostIndexPresenter.new(delegate.next) if delegate.next
    end
  end
end
