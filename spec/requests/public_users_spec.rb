require 'spec_helper'

describe "PublicUsers" do
   

	

   describe "SignUp" do

   describe "failure" do

  	it "should not create a member user" do

        visit '/public/new'
        fill_in "member_first_name" ,:with =>""
        fill_in "member_last_name" ,:with =>""
		fill_in "member_username" , :with =>""
		fill_in "member_password" ,:with =>""
		click_button
		response.should render_template('public/new')
		response.should render('shared/member_error_messages_html.erb') 
										end

						end



		describe "success" do

  	it "should create a member user" do

  		 
        visit '/public/new'
        fill_in "First name" ,:with =>"some"
        fill_in "Last name" ,:with =>"one"
		fill_in "member_username",:with =>"some@gmail.com"
		fill_in "Password" ,:with =>"secret"
		click_button
		response.should render_template('public/index')
		page.should have_selector('div.flash.success',:content=>"Please confirm your 
						email address by clicking the link that we just send to you in email")
										 
 
										end #end of it
						end #end of decribe


 	 end #end of sign up


#------------password reset
 # describe "Home Page" do

  #	it "should have selector ==> h2" do

  #		visit '/home'
  #		page.should have_selector('h2')
 # 	end
  # end


# Test for password reset for non-exiting user.
  #describe "Password reset page" do
   # it "emails user when requesting password reset" do
    #user = "blah"
    #  visit '/public/login'
    #  click_link "password"
    #  fill_in "Username", :with => "rajmj83@gmail.com"
    #  click_button "Reset Password"
    #  current_path.should eq(root_path)
      #page.should have_content("Sorry our records indicate that you are not registered yet. Please signup")
    #last_email.to.should include(user.email)
    #end  
  #end



   end #end of pubic users

   







