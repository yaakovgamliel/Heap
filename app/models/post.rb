class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning

  field :title, type: String
  field :stub,  type: String, default: -> { Token.generate }
  field :body,  type: String

  def self.in_reverse_chronological_order
    asc :created_at
  end

  def self.before(post)
    where(:created_at.lt => post.created_at).desc(:created_at)
  end

  def self.after(post)
    where(:created_at.gt => post.created_at).asc(:created_at)
  end

  def next
    Post.after(self).first
  end

  def previous
    Post.before(self).first
  end

  def to_param
    stub
  end
end
