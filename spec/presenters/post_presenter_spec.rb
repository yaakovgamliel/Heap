require 'spec_helper'

describe PostPresenter do
  before do
    @post = Post.create title: 'Test title', body: 'Test body'
  end

  describe '.new' do
    subject { PostPresenter }

    it "decorates a post" do
      subject.new(@post).should be_a(subject)
    end
  end

  describe '#as_json' do
    subject { PostPresenter.new(@post) }

    it "returns a hash" do
      subject.as_json.should be_a(Hash)
    end

    describe "attributes" do
      subject { PostPresenter.new(@post).as_json }

      it "contains a title" do
        subject[:title].should eq('Test title')
      end

      it "contains a stub" do
        subject[:stub].should_not be_nil
      end

      it "contains a URL" do
        subject[:url].should == "http://logheap.io/posts/#{@post.stub}"
      end

      it "contains a created at time" do
        subject[:created_at].should eq(@post.created_at)
      end

      it "contains a body" do
        subject[:body].should_not be_nil
      end

      context "when there is an older post" do
        before do
          @older_post = Post.create title: 'Older title', created_at: 1.day.ago
        end

        it "links to previous post" do
          subject[:previous].should be_a(PostIndexPresenter)
        end
      end

      context "when there is a newer post" do
        before do
          @newer_post = Post.create title: 'New title', created_at: 1.day.from_now
        end

        it "links to next post" do
          subject[:next].should be_a(PostIndexPresenter)
        end
      end
    end
  end
end
