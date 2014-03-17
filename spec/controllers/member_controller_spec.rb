require 'spec_helper'

describe MemberController do



describe "GET 'index'" do
    it "returns http success" do
      get '/member/home'
      response.should be_success
    end
  end







end



 