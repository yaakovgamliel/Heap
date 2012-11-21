class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id

  def id
    object.id
  end
end
