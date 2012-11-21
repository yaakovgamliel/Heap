class Heaplog
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many   :posts

  field :name, type: String, default: -> { "#{user.name.s} heap" }
  field :description, type: String
  field :short_name, type: String, default: -> { name.to_url }
  
  field :public, type: Boolean, default: true

  validates_uniqueness_of :short_name

  def self.with_short_name(short_name)
    where(short_name: short_name).last
  end

  def to_param
    short_name
  end

  def active_model_serializer
    HeaplogSerializer
  end
end
