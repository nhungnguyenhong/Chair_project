class StaticPagesController < ApplicationController
  def home
    @list_chair = Chair.limit(8).order(id: :desc)
    @order_item = current_order.order_items.new
    @categories = Category.all
    @brands = Brand.all
  end
  def contact
    SendMailer.contact_email("hongnhungnguyen4092@gmail.com", "test").deliver_now

  end
  def about

  end
end
