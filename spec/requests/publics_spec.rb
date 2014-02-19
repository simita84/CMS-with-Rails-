require 'spec_helper'
describe "Public Page" do
  describe "Home Page" do

  	it "should have selector ==> h2" do

  		visit '/home'
  		page.should have_selector('h2')
  	end
   end

end