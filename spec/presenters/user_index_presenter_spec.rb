require 'spec_helper'

describe UserIndexPresenter do
  describe '.create' do
    subject { UserIndexPresenter }

    it "decorates each post in scope" do
      subject.create([:user]).first.should be_a(subject)
    end
  end

  describe "#as_json" do
    let(:user) { Fabricate(:user) }
    subject { UserIndexPresenter.new(user).as_json }

    it "returns a hash" do
      subject.should be_a(Hash)
    end

    describe "attributes" do
      it "contains a name attribute" do
        subject[:name].should eq(user.name)
      end

      it "contains a nickname attribute" do
        subject[:nickname].should eq(user.nickname)
      end

      it "contains an image attribute" do
        subject[:image].should eq(user.image)
      end

      it "contains a url attribute" do
        subject[:url].should eq("http://logheap.io/users/#{user.stub}")
      end
    end
  end
end
