require 'spec_helper'

describe PublicController do
render_views

	 
describe "GET 'index'" do
    it "returns http success" do
      visit 'index'
      response.should be_success
       response.should render_template :index
      page.should have_selector('h2')
      page.should have_selector('p')
      page.should have_content(' © ClubbyKids 2014')


    end
  end


describe "GET 'login'" do
    it "returns http success" do
      get 'login'
     response.should be_success
     response.should render_template :login

      
    end
  end

describe "GET 'Products/All reviews'" do
    it "returns http success" do
      get 'listProducts'
     response.should be_success  
      response.should render_template :listProducts  
    end
  end
 

describe "GET 'listRecipes'" do
    it "returns http success" do
      get 'listRecipes'
     response.should be_success   
      response.should render_template :listRecipes 
    end
  end



describe "GET 'listItems'" do
    it "returns http success" do
      get 'listItems'
     response.should be_success   
      response.should render_template :listItems 
    end
  end

describe "GET 'listContacts'" do
    it "returns http success" do
      get 'listContacts'
     response.should be_success   
      response.should render_template :listContacts 
    end
  end


describe "GET 'SignUp/Member Registation page'" do
    it "returns http success" do
      get 'new'
     response.should be_success   
      response.should render_template :new 
    end
  end

  

end
