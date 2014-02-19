require 'spec_helper'

describe "StaticPages" do
  describe "GET /home" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end




  describe "Home Page" do

  	it "should have 'About Us' " do

  		visit '/member/home'
  		page.should have_selector('h1',:text=>'About Us')
		page.should have_selector('p')
        page.should have_content(' © ClubbyKids 2014')
  	end
   end

end
