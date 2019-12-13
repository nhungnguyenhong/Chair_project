class BillingsController < ApplicationController
  def new
    @billing = Billing.new
  end

  def create
    @billing = Billing.new billing_params
    @billing.order = current_order
    @billing.user = current_user
    if @billing.save
      session.delete(:order_id)
      @billing.order.status_id = 2
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
