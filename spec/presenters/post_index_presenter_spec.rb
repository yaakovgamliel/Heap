require 'spec_helper'

describe PostIndexPresenter do
  describe '.create' do
    subject { PostIndexPresenter }

    it "decorates each post in scope" do
      subject.create([:post]).first.should be_a(subject)
    end
  end

  describe '#as_json' do
    let(:post) { Fabricate(:post) }
    subject { PostIndexPresenter.new(post) }

    it "returns a hash" do
      subject.as_json.should be_a(Hash)
    end

    describe "attributes" do
      subject { PostIndexPresenter.new(post).as_json }

      it "contains a title attribute" do
        subject[:title].should eq(post.title)
      end

      it "contains a stub attribute" do
        subject[:stub].should_not be_nil
      end

      it "contains a URL attribute" do
        subject[:url].should eq("http://logheap.io/posts/#{post.stub}")
      end

      it "contains a created at time" do
        subject[:created_at].should eq(post.created_at)
      end
    end
  end
end
