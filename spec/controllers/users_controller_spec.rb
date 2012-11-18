require 'spec_helper'

describe UsersController do
  let(:users) do
    Array.new(10) { Fabricate(:user) }
  end
  before { users }

  describe "#index" do
    it "returns valid JSON" do
      get :index, format: 'json'
      expect { JSON.parse(response.body) }.not_to raise_error
    end

    it "returns a list of users" do
      get :index, format: 'json'
      response.body.should eq(UserIndexPresenter.create(User.all).to_json)
    end
  end

  describe "#show" do
    it "returns valid JSON" do
      get :show, format: 'json', id: users.first.to_param
      expect { JSON.parse(response.body) }.not_to raise_error
    end

    it "returns a user" do
      get :show, format: 'json', id: users.first.to_param
      response.body.should eq(UserPresenter.new(users.first).to_json)
    end
  end
end
