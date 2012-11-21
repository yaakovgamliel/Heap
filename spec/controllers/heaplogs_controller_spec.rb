require 'spec_helper'

describe HeaplogsController do
  let(:heaplogs) do
    Array.new(10) { Fabricate(:heaplog) }
  end
  before { heaplogs }
  subject { JSON.parse(response.body) }

  describe "#index" do
    it "returns valid JSON" do
      get :index, format: 'json'
      expect { subject }.not_to raise_error
    end

    it "returns a list of heaplogs" do
      get :index, format: 'json'
      subject['heaplogs'].map { |u| u['id'] }.should eq(Heaplog.all.map(&:to_param))
    end
  end

  describe "#show" do
    it "returns valid JSON" do
      get :show, format: 'json', id: heaplogs.first.to_param
      expect { subject }.not_to raise_error
    end

    it "returns a user" do
      get :show, format: 'json', id: heaplogs.first.to_param
      subject['heaplog']['id'].should eq(heaplogs.first.to_param)
    end
  end
end
