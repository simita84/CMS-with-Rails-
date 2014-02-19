require 'spec_helper'

describe "Member Page" do
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



  # Test for member Sign-up
  describe "Member signup page" do
  	subject { page }
    #user = "blah"
    before {visit '/public/new'}

    it { should have_selector('h2', :text => "Join Clubby Kids") }   
    end  

  # Test for member sign-in page
    

    describe "Member sigin page" do
  	subject { page }
    #user = "blah"
    before {visit '/public/login'}

    it { should have_selector('h3', :text => "Login") }   
    end 

 # Test for member-signin

    describe "Member signin attempt" do
    	#subject { page }
      #before do
  	#subject { page }
    #user = "blah"
     #before {visit '/member/home'}
  
    it "signs in member" do
      visit '/public/login'

    	fill_in "username", with: "rajmj83@gmail.com"
    	fill_in "password", with: "secret"
      click_button "Sign In"    
     #  end

    current_path.should eq('/member/home')
    page.should have_content("You re logged in to Clubby kids")
    #it { should have_selector('h1', text:'About Us') }
    
   end
 end
    

     

end
