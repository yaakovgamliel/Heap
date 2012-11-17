require 'spec_helper'

describe Post do
  describe '#stub' do
    it "generates a token for each new post" do
      Token.stub(:generate).and_return('unique_token')
      subject.stub.should eq('unique_token')
    end
  end

  context "when there is a newer post" do
    before do
      @newer_post = Post.create title: 'Newer post', created_at: 1.day.from_now
      @post       = Post.create title: 'Post title'
    end
    subject { @post }

    describe '#next' do
      it "returns the next newer post" do
        subject.next.should eq(@newer_post)
      end
    end

    describe '#previous' do
      it "returns nil" do
        subject.previous.should be_nil
      end
    end
  end

  context "when there only a single post" do
    before do
      @post       = Post.create title: 'Post title'
    end
    subject { @post }

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
    before do
      @post       = Post.create title: 'Post title'
      @older_post = Post.create title: 'Older post', created_at: 1.day.ago
    end
    subject { @post }

    describe '#next' do
      it "returns nil" do
        subject.next.should be_nil
      end
    end

    describe '#previous' do
      it "returns the older post" do
        subject.previous.should eq(@older_post)
      end
    end
  end

  context "with three different posts" do
    before do
      @first  = Post.create created_at: 2.days.ago
      @second = Post.create created_at: 1.day.ago
      @third  = Post.create
    end

    describe '.in_reverse_chronological_order' do
      it "returns the newest post first" do
        Post.in_reverse_chronological_order.first.should eq(@first)
      end

      it "returns the oldest post last" do
        Post.in_reverse_chronological_order.last.should eq(@third)
      end
    end

    describe '.before' do
      it "returns the ealier posts" do
        Post.before(@third).to_a.should eq([@second, @first])
      end
    end

    describe '.after' do
      it "returns the later posts" do
        Post.after(@first).to_a.should eq([@second, @third])
      end
    end
  end
end
