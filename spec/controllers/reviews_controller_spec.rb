require 'spec_helper'

describe ReviewsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'listReviews'" do
    it "returns http success" do
      get 'listReviews'
      response.should be_success
    end
  end

  describe "GET 'newReview'" do
    it "returns http success" do
      get 'newReview'
      response.should be_success
    end
  end

  describe "GET 'editReview'" do
    it "returns http success" do
      get 'editReview'
      response.should be_success
    end
  end

  describe "GET 'deleteReview'" do
    it "returns http success" do
      get 'deleteReview'
      response.should be_success
    end
  end

end
