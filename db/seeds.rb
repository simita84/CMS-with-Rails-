# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create(    first_name: "MomsNdTots", 
                last_name: "BayArea" ,
                emailId: "momsntotsbayarea@gmail.com",
                username: "momsntotsbayarea",
                password: "secret")

Member.create(username: "simi.tresa.antony@gmail.com",first_name: "SIMI" ,
                last_name: "RAJ" ,password: "secret")


Home.create(title: "Moms and Tots - Sylvan Park neighborhood",content: "We are a community of a group of mothers and our kids who  often meet 
			 together and conduct  activities to make our kids  more social and interactive.
 We Initially started this as a small group of moms who used to meet regularly in a local 
 community park. Our vision to inculcate social responsibility and awareness in kids gradually transformed 
into this small social community. Our community conducts year round activities that observes significant events 
 in United States as well as other States or Cultures that keeps children  
  informed about the significance of these days of the year.")

 Contact.create(:name=>"Moms and Tots - Sylvan Park neighborhood",
 				:facebook=>"https://www.facebook.com/MomsAndTotsSylvanParkNeighborhood",
 				:emailid=>"momsntotsbayarea@gmail.com")