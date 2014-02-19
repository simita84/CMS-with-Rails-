require 'test_helper'

class HomeTest < ActiveSupport::TestCase
    
#checking Home Model for invalid input storage
    test "test_updateHome_with_Missing_Credentials" do

    @home = Home.find(853297589)
 	@home.update_attributes(:title=>"Moms&Tots", :content=>" ")
                                     
	  refute @home.valid?

 end



test "test_create_Home_with_Missing_Credentials" do

    @home = Home.new(:title=>" ", :content=>" ")
                                     
	  refute @home.valid?

 end
 test "test_create_Home_with_Valid_Credentials" do

    @home = Home.new(:title=>"Moms & Tots of SylVan ", :content=>"We are a community")
                                     
	  assert @home.valid?

 end
end
