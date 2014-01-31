require "digest/sha1"
class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  before_create { generate_token(:auth_token) }
  attr_accessible :memberphoto,:username, :first_name,:last_name,:password,:password_confirmation
   has_attached_file :memberphoto, :styles => { :medium => "300x300>", :thumb =>"50x50>" }
   before_save :create_hashed_password
     after_save :clear_password
     attr_accessor :password

 
   before_save {|member| member.username = member.username.downcase}

        #---------------Member SignUp Validation
        EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

     validates :first_name, :presence => true, :length => { :maximum => 30 }
     validates :last_name, :presence => true, :length => { :maximum => 50 }
     validates :username, :presence => true, :length => { :maximum => 100 },
                   :format => EMAIL_REGEX, :uniqueness => {:case_sensitive => false}
     validates :password, :presence => true, :confirmation => true, :length => { :minimum => 6 } ,:on => :create  
    
    #generate a random token for password reset functionality
    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      MemberMailer.password_reset(self).deliver
    end  

    #generate a random tokem for remember me function.
    def generate_token(column)
       begin
       self[column] = SecureRandom.urlsafe_base64
       end while Member.exists?(column => self[column])
    end
 
     #authorizing the Member
     def self.authorize(username="",password="")
       member=Member.find_by_username(username)
       if member && member.password_match?(password)
         return member
       else
         return false
       end

      end


      #password comparison

      def password_match?(password="")
        hashed_password == Member.hash_with_salt(password,salt)
      end


     #make salt
     def self.make_salt(username="")
       Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
   end
     #make hash
     def self.hash_with_salt(password="",salt="")
       Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
     end

     #method to return name of the Member
     def name
       "#{first_name}  #{last_name}"

     end

     private

        def create_hashed_password
          # Whenever :password has a value hashing is needed
          unless password.blank?
            # always use "self" when assigning values
            self.salt = Member.make_salt(username) if salt.blank?
            self.hashed_password = Member.hash_with_salt(password, salt)
          end
        end

        def clear_password
          # for security and b/c hashing is not needed
          self.password = nil
        end
 
end
