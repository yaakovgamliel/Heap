class PostPresenter < Struct.new(:post)
  include ApplicationPresenter

  def as_json
    result = {}

    [:title, :stub, :body, :created_at].each do |key|
      result[key] = post.send(key)
    end

    result.merge \
      url:        post_url(post),
      previous:   PostIndexPresenter.new(post.previous),
      next:       PostIndexPresenter.new(post.next)
  end

end
