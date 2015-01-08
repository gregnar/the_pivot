class OrderMailer < ActionMailer::Base
  default from: "reliefbot@airlyft.io"

  def order_confirmation(order)
    @order = order
    emails = order.suppliers.map(&:email) << order.user.email
    mail(to: emails, subject: "Order ##{order.id} Confirmation", content_type: "text/html")
  end
end
