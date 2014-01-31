require 'spec_helper'

describe ProductsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'listProducts'" do
    it "returns http success" do
      get 'listProducts'
      response.should be_success
    end
  end

  describe "GET 'newProduct'" do
    it "returns http success" do
      get 'newProduct'
      response.should be_success
    end
  end

  describe "GET 'editProduct'" do
    it "returns http success" do
      get 'editProduct'
      response.should be_success
    end
  end

  describe "GET 'deleteProduct'" do
    it "returns http success" do
      get 'deleteProduct'
      response.should be_success
    end
  end

end
