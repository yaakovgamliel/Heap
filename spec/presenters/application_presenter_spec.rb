require 'spec_helper'

describe ApplicationPresenter do
  let(:delegate) { stub(:delegate) }
  let(:subclass) { Class.new(ApplicationPresenter) }
  subject { subclass.new(delegate) }

  describe '.create' do
    it 'returns an Enumerator' do
      subclass.create([]).should be_a(Enumerator)
    end

    it 'iterates its argument' do
      scope = stub(:scope)
      scope.should_receive(:each)
      subclass.create(scope).first
    end

    it 'decorates the incoming scope' do
      scope = [:foo, :bar, :baz]
      subclass.create(scope).map(&:delegate).should eq(scope)
    end
  end

  describe '#default_serialiser_fields' do
    it "raises an exception when the subclass does not implement #default_serialiser_fields" do
      expect { subject.as_json }.to raise_error(NotImplementedError)
    end

    it "iterates the default serialiser fields result" do
      fields = stub(:fields)
      fields.should_receive(:each)
      subject.stub(:default_serialiser_fields).and_return(fields)
      subject.as_json
    end

    it "sends each of the default serialiser fields to the delegate" do
      delegate.should_receive(:foo)
      subject.stub!(:default_serialiser_fields).and_return([:foo])
      subject.as_json
    end
  end

  describe '#serialiser_extras' do
    before { subject.stub(:default_serialiser_fields).and_return([]) }

    it 'is merged into the results of #as_json' do
      extras = { foo: :bar, baz: :bar }
      subject.stub(:serialiser_extras).and_return(extras)
      subject.as_json.should include(extras)
    end
  end
end
