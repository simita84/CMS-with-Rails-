
require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
             #------------tests for  Admin Model Validation ----------#

    
#checking Admin Model for invalid input storage
    test "test_updateAdmin_with_Missing_Credentials" do

    @admin = Admin.find(464178056)
 	@admin.update_attributes(:username=>"simi.tresa.antony",:first_name=>"",:last_name=>"Raj" ,
 								:password=>"1234S")
                                     
	
	                     refute @admin.valid?

 end



end