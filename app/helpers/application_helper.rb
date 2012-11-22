module ApplicationHelper
  def serialize_resource(resource)
    if resource.respond_to? :each
      ActiveModel::ArraySerializer.new(resource).as_json.to_json
    else
      resource.serialize_to_json
    end
  end
end
