class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning

  belongs_to :heaplog

  field :title,     type: String
  field :stub,      type: String, default: -> { Token.generate }
  field :body,      type: String
  field :posted_at, type: DateTime

  def self.in_reverse_chronological_order
    desc :created_at
  end

  def self.before(post)
    where(:created_at.lt => post.created_at).desc(:created_at)
  end

  def self.after(post)
    where(:created_at.gt => post.created_at).asc(:created_at)
  end

  def self.with_stub(stub)
    where(:stub => stub).last
  end

  def next
    @next ||= Post.after(self).first
  end

  def previous
    @previous ||= Post.before(self).first
  end

  def to_param
    stub
  end
end
