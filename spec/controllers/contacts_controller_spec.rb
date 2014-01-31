require 'spec_helper'

describe ContactsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'showContact'" do
    it "returns http success" do
      get 'showContact'
      response.should be_success
    end
  end

  describe "GET 'newContact'" do
    it "returns http success" do
      get 'newContact'
      response.should be_success
    end
  end

  describe "GET 'editContact'" do
    it "returns http success" do
      get 'editContact'
      response.should be_success
    end
  end

  describe "GET 'deleteContact'" do
    it "returns http success" do
      get 'deleteContact'
      response.should be_success
    end
  end

end
