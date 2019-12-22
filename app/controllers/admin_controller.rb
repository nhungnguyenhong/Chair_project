class AdminController < ApplicationController
  before_filter :verify_is_admin
  layout 'admin'
  def dashboard
    @summary_user = User.count
    @summary_chair = Chair.where("quantity > 0").sum(:quantity)
    @summary_billing = Billing.count
    @summary_chair_sold_out = Chair.where(quantity: 0).count
    @total_payment = Billing.sum(:total)
    @billing_max = Billing.maximum(:total)
    @billing_min = Billing.minimum(:total)

  end
  
  def show_chart
    @summary =  Billing.all
    @sum_by_month = [0,0,0,0,0,0,0,0,0,0,0,0]
    @summary.each do |i|
      (0..11).each do |m|
        if (i.created_at.month.to_i-1) == m
          @sum_by_month[m]+=i.total
        end
      end
    end
    render json:@sum_by_month
  end
  
  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end
