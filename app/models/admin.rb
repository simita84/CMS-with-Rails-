require "digest/sha1"
class Admin < ActiveRecord::Base
  attr_accessible :emailId, :first_name, :hashed_password, :last_name, :salt, :username

   attr_accessor :password
  attr_protected :hashed_password,:salt
  
   #Admin Email ID validation
  before_save {|admin| admin.emailId = admin.emailId.downcase}

        #---------------Member SignUp Validation
        EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :emailId, :presence => { :message => "missing" }, :length => { :maximum => 100 },
                   :format => EMAIL_REGEX, :uniqueness => {:case_sensitive => false}



 validates :first_name, :presence => { :message => "missing" },
          :length => { :maximum => 50 }
 
            
validates :last_name, :presence => { :message => "missing" }, :length => { :maximum => 50 }
validates :username, :presence => { :message => "missing" }, :length => { :maximum => 50 }
#validates :password, :presence =>true
#=> { :message => "missing" }

   # attr_accessible :title, :body
    before_save :create_hashed_password
    after_save :clear_password
    
    #scope to sort by name
    scope :sorted,order("admin_users.last_name ASC,admin_users.first_name ASC")



      #authorizing the user
      def self.authorize(username="",password="")
        user=Admin.find_by_username(username)
        if user && user.password_match?(password)
          return user
        else
          return false
        end

       end


       #password comparison

       def password_match?(password="")
         hashed_password == Admin.hash_with_salt(password,salt)
       end


      #make salt
      def self.make_salt(username="")
        Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
    end
      #make hash
      def self.hash_with_salt(password="",salt="")
        Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
      end

      private

         def create_hashed_password
           # Whenever :password has a value hashing is needed
           unless password.blank?
             # always use "self" when assigning values
             self.salt = Admin.make_salt(username) if salt.blank?
             self.hashed_password = Admin.hash_with_salt(password, salt)
           end
         end

         def clear_password
           # for security and b/c hashing is not needed
           self.password = nil
         end


      #method to return name of the AdminUser
      def name
        "#{first_name}  #{last_name}"

      end


end
