class Heaplog
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many   :posts

  field :stub, type: String, default: -> { Token.generate }
  field :name, type: String, default: -> { "#{user.name.s} heap" }
  field :description, type: String
  
  field :public, type: Boolean, default: true
end
