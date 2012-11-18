class UserIndexPresenter < ApplicationPresenter
  def default_serialiser_fields
    [:name, :nickname, :image]
  end

  def serialiser_extras
    {url: user_url(delegate)}
  end
end
