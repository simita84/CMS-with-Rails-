require 'test_helper'

class ContactTest < ActiveSupport::TestCase
        #------------tests for  Contact Model Validation ----------#

    
#checking Contact Model for invalid input storage
    test "test_updateContact_with_Missing_Credentials" do

    @contact = Contact.find(853297589)
 	@contact.update_attributes(:name=>"Moms&Tots", :emailid=>" ")
                                     
	
	                     refute @contact.valid?

 end


 test "test_updateContact_with_Invalid_Email" do

    @contact = Contact.find(853297589)
 	@contact.update_attributes(:name=>"Moms&Tots", :emailid=>"1623M")
                                     
	
	                     refute @contact.valid?

 end
 
 
end