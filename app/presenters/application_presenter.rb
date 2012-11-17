module ApplicationPresenter
  def self.included(base)
    base.send :include, Rails.application.routes.url_helpers
  end
end
