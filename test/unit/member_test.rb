require 'test_helper'

class MemberTest < ActiveSupport::TestCase

             #------------tests for  Member Model Validation ----------#

#Creating Member with valid attributes
  
  test "test_NewMemberCreation_with_valid_Credentials" do

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

    @member = Member.new(:username=>"simi.tresa.antony@gmail.com",:first_name=>"Simi" ,
                     :last_name=>"Raj" ,:password=>"1234S")
                                     
                     refute @member.valid?

 end
    

    test "test_updateMember_with_Missing_Credentials" do

    @member = Member.find(820312697)
 @member.update_attributes(:username=>"simi.tresa.antony@gmail.com",:first_name=>"",:last_name=>"Raj" ,:password=>"1234S")
                                     
                     refute @member.valid?

 end

 

 end
