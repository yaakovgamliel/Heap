require 'spec_helper'

describe Heaplog do
  subject { Fabricate(:heaplog) }
  let(:user) { subject.user }

  describe '#stub' do
    it "generates a token for each new post" do
      Token.stub(:generate).and_return('unique_token')
      subject.stub.should eq('unique_token')
    end
  end

  describe '#name' do
    it "generates a name by default" do
      subject.name.should eq("#{user.name.s} heap")
    end
  end
end
