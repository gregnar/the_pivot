class UserMailer < ActionMailer::Base
  default from: "reliefbot@airlyft.io"

  def confirmation_email(user)
    @user = user
    mail(to: user.email, subject: 'Verify Your Airlift Account', content_type: "text/html")
  end

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Airlift!', content_type: "text/html")
  end
end
