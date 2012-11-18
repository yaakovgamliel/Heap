require 'spec_helper'

describe PostsController do
  let(:posts) { (0..2).map { Fabricate(:post) } }

  describe '#index' do
    before { posts }

    it "returns valid JSON" do
      get :index, format: 'json'
      expect { JSON.parse(response.body) }.not_to raise_error
    end

    it "returns a list of posts" do
      get :index, format: 'json'
      response.body.should eq(PostIndexPresenter.create(Post.in_reverse_chronological_order).to_json)
    end
  end

  describe "#show" do
    before { posts }

    it "returns valid JSON" do
      get :show, format: 'json', id: posts.first.to_param
      expect { JSON.parse(response.body) }.not_to raise_error
    end

    it "returns a post" do
      get :show, format: 'json', id: posts.first.to_param
      response.body.should eq(PostPresenter.new(posts.first).to_json)
    end
  end

end
