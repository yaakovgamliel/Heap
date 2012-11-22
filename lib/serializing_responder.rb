class SerializingResponder < ActionController::Responder
  def to_html
    render template: '/serializer', locals: { resource: @resource }
  end
end
