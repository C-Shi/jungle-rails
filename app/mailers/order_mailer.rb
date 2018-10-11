class OrderMailer < ApplicationMailer
  default from: 'kyleshi82@gmail.com'

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: 'You have just place an order')
  end
end
