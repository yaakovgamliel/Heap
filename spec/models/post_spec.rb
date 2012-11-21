require 'spec_helper'

describe Post do
  describe '#token' do
    it "generates a token for each new post" do
      Token.stub(:generate).and_return('unique_token')
      subject.token.should eq('unique_token')
    end
  end

  context "when there is a newer post" do
    let(:post) { Fabricate(:post) }
    let(:newer_post) { Fabricate(:post, created_at: 1.day.from_now) }
    before { post; newer_post }
    subject { post }

    describe '#next' do
      it "returns the next newer post" do
        subject.next.should eq(newer_post)
      end
    end

    describe '#previous' do
      it "returns nil" do
        subject.previous.should be_nil
      end
    end
  end

  context "when there only a single post" do
    let(:post) { Fabricate(:post) }
    subject { post }

    describe '#next' do
      it "returns nil" do
        subject.next.should be_nil
      end
    end

    describe '#previous' do
      it "returns nil" do
        subject.previous.should be_nil
      end
    end
  end

  context "when there is an older post" do
    let(:post) { Fabricate(:post) }
    let(:older_post) { Fabricate(:post, created_at: 1.days.ago) }
    before { post ; older_post }
    subject { post }

    describe '#next' do
      it "returns nil" do
        subject.next.should be_nil
      end
    end

    describe '#previous' do
      it "returns the older post" do
        subject.previous.should eq(older_post)
      end
    end
  end

  context "with three different posts" do
    let(:posts) do
      (0..2).map { |i| Fabricate(:post, title: "Test post #{i}", created_at: i.days.from_now) }
    end
    before { posts }

    describe '.in_reverse_chronological_order' do
      it "returns the newest post first" do
        Post.in_reverse_chronological_order.
          first.should eq(posts.last)
      end

      it "returns the oldest post last" do
        Post.in_reverse_chronological_order.
          last.should eq(posts.first)
      end
    end

    describe '.before' do
      it "returns the ealier posts" do
        Post.before(posts.last).to_a.should eq(posts[0..1].reverse)
      end
    end

    describe '.after' do
      it "returns the later posts" do
        Post.after(posts.first).to_a.should eq(posts[1..2])
      end
    end
  end

  describe '.with_token' do
    subject { Post.with_token(post.token) }

    describe "when a post with matching token exists" do
      let(:post) { Fabricate(:post) }

      it "returns the post" do
        subject.should eq(post)
      end
    end

    describe "when no matching post exists" do
      let(:post) { stub(:post) }

      it "returns nil" do
        post.stub!(:token).and_return("foo")
        subject.should be_nil
      end
    end
  end
end
