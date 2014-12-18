class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(user)
    mail(to: user.email, subject: 'Verify your Airlift account')
  end

  def welcome_email(user)
    mail(to: user.email, subject: 'Welcome to Airlift!')
  end
end
