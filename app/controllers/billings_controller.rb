class BillingsController < ApplicationController
  def new
    @billing = Billing.new
  end

  def create
    @billing = Billing.new billing_params
    @billing.order = current_order
    @order = current_order
    @order_items = @order.order_items;
    @order_items.each do |order_item|
      @chair = order_item.chair
      @new_quantity = @chair.quantity - order_item.quantity
      @chair.update(quantity: @new_quantity)
    end
    @billing.user = current_user
    if @billing.save
      session.delete(:order_id)
      flash[:success] = "Successfully checkout!"
      redirect_to billing_path(@billing)
    else
      flash[:danger] = "Can not checkout, please try again!"
      redirect_to :back
    end
  end

  def show
    @billing = Billing.find params[:id]
  end

  def billing_params
    params.require(:billing).permit(:first_name, :last_name, :country, :address, :phone_number, :email, :note, :payment_method)
  end
end
