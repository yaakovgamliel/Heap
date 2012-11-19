require 'spec_helper'

describe Ownerise do
  subject do
    stub(:fake_string).tap do |s|
      s.extend(Ownerise)
    end
  end

  context "when the string ends with an 's'" do
    before { subject.stub!(:to_s).and_return('James') }

    it "returns only an apostrophe at the end" do
      subject.ownerise.should eq("James'")
    end
  end

  context "when the string does not end with an 's'" do
    before { subject.stub!(:to_s).and_return('Jim') }

    it "returns an apostrophe-s at the end" do
      subject.ownerise.should eq("Jim's")
    end
  end
end
