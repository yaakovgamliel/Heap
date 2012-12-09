class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include JsonSerializingModel

  belongs_to :heaplog

  field :title,     type: String
  field :token,      type: String, default: -> { Token.generate }
  field :body,      type: String
  field :posted_at, type: DateTime, default: -> { updated_at }

  def self.in_reverse_chronological_order
    desc :created_at
  end

  def self.before(post)
    where(:created_at.lt => post.created_at).desc(:created_at)
  end

  def self.after(post)
    where(:created_at.gt => post.created_at).asc(:created_at)
  end

  def self.with_token(token)
    where(:token => token).last
  end

  def next
    @next ||= Post.after(self).first
  end

  def previous
    @previous ||= Post.before(self).first
  end

  def to_param
    token
  end
end
