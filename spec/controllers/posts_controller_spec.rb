require 'spec_helper'

describe PostsController do

  describe '#index' do
    before do
      @post = Post.create title: 'Test title'
    end

    it "returns valid JSON" do
      get :index, format: 'json'
      expect { JSON.parse(response.body) }.not_to raise_error
    end

    it "returns a list of hosts" do
      get :index, format: 'json'
      index = JSON.parse(response.body)
      index.all? { |p| p['stub'] == @post.stub }.should be_true
    end
  end

end
