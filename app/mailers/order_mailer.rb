class OrderMailer < ActionMailer::Base
  default from: "reliefbot@airlyft.io"

  def order_confirmation(order)
    @order = order
    mail(to: user.email, subject: 'Verify Your Airlift Account', content_type: "text/html")
  end
end
