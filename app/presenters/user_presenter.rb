class UserPresenter < ApplicationPresenter
  def default_serialiser_fields
    [:stub, :name, :nickname, :location, :image, :description, :extra_url]
  end

  def serialiser_extras
    {url: user_url(delegate)}
  end
end
