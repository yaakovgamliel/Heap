module ApplicationHelper
  def serialize_resource(resource)
    if resource.respond_to? :each
      resource.compact!
      if resource.all?(&:nil?)
        '{}'
      else
        ActiveModel::ArraySerializer.new(resource, root: resource.first.class.to_s.underscore.pluralize).as_json.to_json
      end
    else
      resource.serialize_to_json
    end
  end
end
