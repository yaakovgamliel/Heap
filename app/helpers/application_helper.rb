module ApplicationHelper
  def serialize_resource(resource)
    if resource.respond_to? :each
      ActiveModel::ArraySerializer.new(resource, root: resource.first.class.to_s.underscore.pluralize).as_json.to_json
    else
      resource.serialize_to_json
    end
  end
end
