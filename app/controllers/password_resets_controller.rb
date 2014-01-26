class PasswordResetsController < ApplicationController
def new
  end


  def create
   member = Member.find_by_username(params[:username])
   #member.send_password_reset if member
   #redirect_to root_url, :notice => "Email sent with password reset instructions."

   if !member.nil? 
           member.send_password_reset
           redirect_to root_url, :notice => "Email sent with password reset instructions."
    else 
           redirect_to root_url, :notice => "Sorry our records indicate that you are not registered yet. 
                                            Please signup"
    end

  end


 def edit
  @member = Member.find_by_password_reset_token!(params[:id])
 end


  def update
     @member = Member.find_by_password_reset_token!(params[:id])
     if @member.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, :alert => "Password reset has expired. Please try to reset again."
     elsif @member.update_attributes(params[:member])
        redirect_to root_url, :notice => "Password has been reset!. Please login using your new password."
     else
     render :edit
     end
end


end
