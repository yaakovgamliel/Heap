class Heaplog
  include Mongoid::Document
  include Mongoid::Timestamps
  include JsonSerializingModel

  belongs_to :user
  has_many   :posts

  field :name, type: String, default: -> { "#{user.name.s} heap" }
  field :description, type: String
  field :short_name, type: String, default: -> { name.to_url }
  field :banner_url, type: String

  field :public, type: Boolean, default: true

  index({short_name: 1}, {unique: true})

  validates_uniqueness_of :short_name

  def self.with_short_name(short_name)
    where(short_name: short_name).last
  end

  def to_param
    short_name
  end
end
