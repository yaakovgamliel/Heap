class ApplicationPresenter < Struct.new(:delegate)
  include Rails.application.routes.url_helpers

  def self.create(scope)
    Enumerator.new do |y|
      scope.each do |model|
        y << self.new(model)
      end
    end
  end

  def as_json(*opts)
    {}.tap do |h|
      default_serialiser_fields.each do |field|
        Rails.logger.debug("Sending #{field} to #{delegate}")
        h[field] = delegate.send(field)
      end
      h.merge! serialiser_extras
    end
  end

  def default_serialiser_fields
    raise NotImplementedError, "Class #{self.class} must implement #default_serialiser_fields"
  end

  def serialiser_extras
    {}
  end
end
