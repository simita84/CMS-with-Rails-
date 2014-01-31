require 'spec_helper'

describe ItemsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'listItems'" do
    it "returns http success" do
      get 'listItems'
      response.should be_success
    end
  end

  describe "GET 'listItem'" do
    it "returns http success" do
      get 'listItem'
      response.should be_success
    end
  end

  describe "GET 'newItem'" do
    it "returns http success" do
      get 'newItem'
      response.should be_success
    end
  end

  describe "GET 'editItem'" do
    it "returns http success" do
      get 'editItem'
      response.should be_success
    end
  end

  describe "GET 'deleteItem'" do
    it "returns http success" do
      get 'deleteItem'
      response.should be_success
    end
  end

end
