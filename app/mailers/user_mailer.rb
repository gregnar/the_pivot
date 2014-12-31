class UserMailer < ActionMailer::Base
  default from: "reliefbot@airlift.com"

  def confirmation_email(user)
    @user = user
    mail(to: user.email, subject: 'Verify your Airlift account', content_type: "text/html")
    puts "sent dat shit yo."
  end

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Airlift!', content_type: "text/html")
  end
end
