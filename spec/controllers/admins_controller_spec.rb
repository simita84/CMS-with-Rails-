require 'spec_helper'

describe AdminsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'listAdmin'" do
    it "returns http success" do
      get 'listAdmin'
      response.should be_success
    end
  end

  describe "GET 'newAdmin'" do
    it "returns http success" do
      get 'newAdmin'
      response.should be_success
    end
  end

  describe "GET 'editAdmin'" do
    it "returns http success" do
      get 'editAdmin'
      response.should be_success
    end
  end

  describe "GET 'deleteAdmin'" do
    it "returns http success" do
      get 'deleteAdmin'
      response.should be_success
    end
  end

  describe "GET 'listMembers'" do
    it "returns http success" do
      get 'listMembers'
      response.should be_success
    end
  end

  describe "GET 'newMember'" do
    it "returns http success" do
      get 'newMember'
      response.should be_success
    end
  end

  describe "GET 'editMember'" do
    it "returns http success" do
      get 'editMember'
      response.should be_success
    end
  end

  describe "GET 'deletMember'" do
    it "returns http success" do
      get 'deletMember'
      response.should be_success
    end
  end

end
