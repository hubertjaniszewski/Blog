class UserMailer < ApplicationMailer

 
  def welcome_email(message)
    @message = message 
    mail(to: "hubert.janisz@gmail.com", subject: "#{@message.title}")
  end
end
