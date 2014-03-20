#require 'aws/s3'
class Recipe < ActiveRecord::Base
   
   attr_accessible :recipephoto,:title, :content,:posted_by
   has_attached_file :recipephoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }

   #has_attached_file :recipephoto                                                            ,
                      :storage        => :s3                                                ,
                      :s3_credentials => {:bucket            => ENV['clubbykids'           ],
                                          :access_key_id     => ENV['AKIAIQTSJOAYFPMC7TKA'    ],
                                          :secret_access_key => ENV['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']},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-eu-west-1.amazonaws.com" 




   validates_attachment_content_type :recipephoto, 
                              :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
 
    
    
      validates :title,:presence => { :message => "missing" }
      
     validates  :content,:presence => { :message => "missing" }
       
     validates :posted_by, :presence => { :message => "missing" }
    
    
 
    
       def self.search(search)
         if search
           find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
         else
           find(:all)
         end
       end
 
end

 