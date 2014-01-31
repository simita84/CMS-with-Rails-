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