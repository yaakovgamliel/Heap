require 'spec_helper'

describe UsersController do
  let(:users) do
    Array.new(10) { Fabricate(:user) }
  end
  before { users }
  subject { JSON.parse(response.body) }

  describe "#index" do
    it "returns valid JSON" do
      get :index, format: 'json'
      expect { subject }.not_to raise_error
    end

    it "returns a list of users" do
      get :index, format: 'json'
      subject['users'].map { |u| u['id'] }.should eq(User.all.map { |u| u.id.to_s })
    end
  end

  describe "#show" do
    it "returns valid JSON" do
      get :show, format: 'json', id: users.first.to_param
      expect { subject }.not_to raise_error
    end

    it "returns a user" do
      get :show, format: 'json', id: users.first.to_param
      subject['user']['id'].should eq(users.first.id.to_s)
    end
  end
end
