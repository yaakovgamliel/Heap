class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id
  embed :ids, include: true

  def id
    object.id
  end
end
