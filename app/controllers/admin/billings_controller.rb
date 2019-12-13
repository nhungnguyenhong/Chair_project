class Admin::BillingsController < ApplicationController
  before_filter :verify_is_admin
  before_action :find_billing, only: [:show, :edit, :update, :destroy]
  
  layout 'admin'
  def index
    @billings = Billing.all.page(params[:page]).per(5)
  end
  
  def show
      
  end
  
  private
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
  def find_billing
    @billing = Billing.find_by id: params[:id]

    return @billing if @billing
    flash[:warning] = "No Billing"
    redirect_to root_path
  end
end
