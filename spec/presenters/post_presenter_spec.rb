require 'spec_helper'

describe PostPresenter do
  let (:post) { Fabricate(:post) }

  describe '#as_json' do
    subject { PostPresenter.new(post).as_json }

    it "returns a hash" do
      subject.should be_a(Hash)
    end

    describe "attributes" do

      it "contains a title" do
        subject[:title].should eq(post.title)
      end

      it "contains a stub" do
        subject[:stub].should_not be_nil
      end

      it "contains a URL" do
        subject[:url].should == "http://logheap.io/posts/#{post.stub}"
      end

      it "contains a created at time" do
        subject[:created_at].should eq(post.created_at)
      end

      it "contains a body" do
        subject[:body].should_not be_nil
      end

      context "when there is an older post" do
        let(:older_post) { Fabricate(:post, created_at: 1.day.ago) }
        before { older_post }

        it "links to previous post" do
          subject[:previous].should be_a(PostIndexPresenter)
        end
      end

      context "when there is a newer post" do
        let(:newer_post) { Fabricate(:post, created_at: 1.day.from_now) }
        before { newer_post }

        it "links to next post" do
          subject[:next].should be_a(PostIndexPresenter)
        end
      end
    end
  end
end
