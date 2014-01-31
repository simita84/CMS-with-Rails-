require 'spec_helper'

describe HomesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'showHome'" do
    it "returns http success" do
      get 'showHome'
      response.should be_success
    end
  end

  describe "GET 'newHome'" do
    it "returns http success" do
      get 'newHome'
      response.should be_success
    end
  end

  describe "GET 'editHome'" do
    it "returns http success" do
      get 'editHome'
      response.should be_success
    end
  end

  describe "GET 'deleteHome'" do
    it "returns http success" do
      get 'deleteHome'
      response.should be_success
    end
  end

end
