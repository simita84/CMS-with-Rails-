require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
#Creating Member with valid attributes
  
  test "test_NewMemberCreation_with_valid" do

     @member = Member.new(:username=>"someone@gmail.com",:first_name=>"SIMI" ,
                     :last_name=>"RAJ" ,:password=>"123456S")

                     assert @member.valid?
  end
   
  test "test_NewMemberCreation_with_missing_credentials" do
    
    @member = Member.new(:username=>"  ",:first_name=>"SIMI" ,
                    :last_name=>"RAJ" ,:password=>"123456S")
  
                    refute @member.valid?       
   end
   
   test "test_NewMemberCreation_with_duplicate_username" do

    @member = Member.create(:username=>"someone@gmail.com",:first_name=>"SIMI" ,
                     :last_name=>"RAJ" ,:password=>"123456S")
                     @member.save
                    @member2 = Member.new(:username=>"someone@gmail.com",:first_name=>"sss" ,
                                        :last_name=>"ssRAJ" ,:password=>"123456S")                
                     refute @member2.valid?

 end
    
     #test "test_UpdateMember_with_missing_username" do
     #  @member = Member.create(:username=>"someone",:first_name=>"SIMI" ,
             #          :last_name=>"RAJ" ,:password=>"123456S")
             #    @member.save
    #  @member.update_attributes(:username=>"",:first_name="some",:last_name=>"one")
      #   refute @member.valid?
  #  end
    
    


test "test_MemberLogin_With_Valid_Credentials" do

    @member=Member.authorize(:username=>"simi.tresa.antony@gmail.com",:password=>"secret")

                      assert @member.valid?
end

test "test_MemberLogin_With_InValid_Credentials" do

    @member=Member.authorize(:username=>"simi@gmail.com",:password=>"secret")

                      refute @member.valid?
end




end
 

