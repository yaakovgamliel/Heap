class Authorisation
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :provider, type: String
  field :uid,      type: String

  validates_presence_of :user, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_from_hash(hash)
    where(provider: hash['provider']).where(uid: hash['uid']).last
  end

  def self.create_from_hash(hash, user=nil)
    user ||= User.create_from_hash!(hash)
    Authorisation.create user: user, provider: hash['provider'], uid: hash['uid']
  end
end
