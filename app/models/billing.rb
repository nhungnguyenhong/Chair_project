class Billing < ApplicationRecord
  belongs_to :user
  belongs_to :order
  enum payment_method: [:cod, :paypal]
  enum status: [:on_shipping, :successful , :canceled]

  before_save :get_order_info

  def get_order_info
    self.subtotal = self.order.subtotal
    self.shipping = 50
    self.total = self.subtotal + 50
  end

end
