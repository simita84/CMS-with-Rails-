require 'spec_helper'

describe RecipesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'listRecipes'" do
    it "returns http success" do
      get 'listRecipes'
      response.should be_success
    end
  end

  describe "GET 'newRecipe'" do
    it "returns http success" do
      get 'newRecipe'
      response.should be_success
    end
  end

  describe "GET 'editRecipe'" do
    it "returns http success" do
      get 'editRecipe'
      response.should be_success
    end
  end

  describe "GET 'deleteRecipe'" do
    it "returns http success" do
      get 'deleteRecipe'
      response.should be_success
    end
  end

end
