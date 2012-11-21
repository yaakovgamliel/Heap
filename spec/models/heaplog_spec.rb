require 'spec_helper'

describe Heaplog do
  subject { Fabricate(:heaplog) }
  let(:user) { subject.user }

  describe '#name' do
    it "generates a name by default" do
      subject.name.should eq("#{user.name.s} heap")
    end
  end

  describe '#short_name' do
    it "generates a short name by default" do
      subject.short_name.should eq(subject.name.to_url)
    end
  end

  describe '.with_short_name' do
    it 'finds a heaplog by short name' do
      Heaplog.with_short_name(subject.short_name).should eq(subject)
    end
  end
end
