require 'spec_helper'

describe PostsController do
  let(:posts) { (0..5).map { Fabricate(:post) } }
  subject { JSON.parse(response.body) }

  describe '#index' do
    before { posts }

    it "returns valid JSON" do
      get :index, format: 'json'
      expect { subject }.not_to raise_error
    end

    it "returns a list of posts" do
      get :index, format: 'json'
      subject['posts'].map{ |p| p['id'] }.should eq(Post.in_reverse_chronological_order.map { |p| p.id.to_s })
    end
  end

  describe "#show" do
    before { posts }

    it "returns valid JSON" do
      get :show, format: 'json', id: posts.first.to_param
      expect { subject }.not_to raise_error
    end

    it "returns a post" do
      get :show, format: 'json', id: posts.first.to_param
      subject['post']['id'].should eq(posts.first.id.to_s)
    end
  end

end
