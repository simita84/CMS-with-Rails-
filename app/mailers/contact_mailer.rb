class ContactMailer < ActionMailer::Base
 

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.email_admin.subject
  #
  def email_admin(message)
    
    @message=message

    mail to: "momsntotsbayarea@gmail.com",subject:"Query from Site Contact form",
                                     from:  @message.email,
                                     content_type: "text/html"
  end




end
