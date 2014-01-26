require 'spec_helper'
describe "PublicPages" do
   
   subject { page }
   
  describe "Home page" do   
    before {visit home_path} 
    it { should have_selector('h2', text: 'About Us') }  
        
  end

end