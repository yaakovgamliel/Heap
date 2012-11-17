class PostIndexPresenter < Struct.new(:post)
  include ApplicationPresenter

  def self.create(scope)
    Enumerator.new do |y|
      scope.each do |post|
        y << self.new(post)
      end
    end
  end

  def as_json(*opts)
    { 
      title:      post.title, 
      stub:       post.stub, 
      url:        post_url(post),
      created_at: post.created_at
    }
  end
end
