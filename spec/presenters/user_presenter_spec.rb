require 'spec_helper'

describe UserPresenter do
  let(:user) { Fabricate(:user) }

  describe '#as_json' do
    subject { UserPresenter.new(user).as_json }

    it "returns a hash" do
      subject.should be_a(Hash)
    end

    describe 'attributes' do
      it "contains a stub" do
        subject[:stub].should eq(user.stub)
      end

      it "contains a name" do
        subject[:name].should eq(user.name)
      end

      it "contains a nickname" do
        subject[:nickname].should eq(user.nickname)
      end

      it "contains a location" do
        subject[:location].should eq(user.location)
      end

      it "contains an image" do
        subject[:image].should eq(user.image)
      end

      it "contains a description" do
        subject[:description].should eq(user.description)
      end

      it "contains an extra_url" do
        subject[:extra_url].should eq(user.extra_url)
      end

      it "contains a url" do
        subject[:url].should eq("http://logheap.io/users/#{user.stub}")
      end
    end
  end
end
