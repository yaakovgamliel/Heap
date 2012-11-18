class PostIndexPresenter < ApplicationPresenter
  def default_serialiser_fields
    [:title, :stub, :created_at]
  end

  def serialiser_extras
    { url: post_url(delegate) }
  end
end
