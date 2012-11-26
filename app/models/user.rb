class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include JsonSerializingModel

  has_many :authorisations
  has_many :heaplogs

  field :provided,    type: Hash,   default: -> { Hash.new }
  field :name,        type: String, default: -> { provided['name'] }
  field :nickname,    type: String, default: -> { provided['nickname'] }
  field :location,    type: String, default: -> { provided['location'] }
  field :image,       type: String, default: -> { provided['image'] }
  field :description, type: String, default: -> { provided['description'] }
  field :extra_url,   type: String, default: -> { (provided['urls']||{})['Website'] }

  index({nickname: 1}, {unique: true})

  validates_uniqueness_of :nickname

  def self.with_nickname(nickname)
    where(nickname: nickname)
  end

  def self.create_from_hash!(hash)
    create provided: hash['info']
  end

  def self.default
    where(nickname: 'heap').last
  end

  def to_param
    nickname
  end

  def create_heaplog(attrs={})
    Heaplog.where(user: self).create(attrs)
  end
end
