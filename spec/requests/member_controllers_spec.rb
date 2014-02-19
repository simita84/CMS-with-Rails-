require 'spec_helper'

describe "MemberControllers" do

#---------test for Home page--------------------------
  describe "Home Page" do

  	it "should have 'About Us' " do

  		visit '/member/home'
  		page.should have_selector('h1',:text=>'About Us')
		page.should have_selector('p')

      

  		 page.should have_content(' © ClubbyKids 2014')
  	end

     
   
   describe "Events Page" do


   	visit  '/member/events/'

   	page.should have_content('	Upcoming Events')
	page.should have_content(' Past events')
    page.should have_content(' © ClubbyKids 2014')
   
    end 
 
    describe "Reviews Page" do

     	   	visit  '/member/reviews/'

     	 page.should have_content(' © ClubbyKids 2014')
     
    end 

    describe "Recipe Page" do
    		visit  '/member/recipes/'
    	 page.should have_content(' © ClubbyKids 2014')
     
    end 
    describe "Items Page" do
    		visit  '/member/items/'
      page.should have_content(' © ClubbyKids 2014')
    end 

    describe "Contacts Page" do
    	visit  '/member/contacts/'
      page.should have_content(' © ClubbyKids 2014')
    end 

    describe "Manage Account  " do

    	visit  '/member/manageprofile/'
    	page.should have_content(' © ClubbyKids 2014')
     
    end 

  end
end
