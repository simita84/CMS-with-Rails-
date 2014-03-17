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

   

  describe "GET 'editAdmin'" do
    it "returns http success" do
      get 'editAdmin'
      response.should be_success
    end
  end

   
   
end
