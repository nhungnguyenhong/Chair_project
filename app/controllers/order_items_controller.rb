class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @order = current_order
    chair_ids = @order.order_items.pluck(:chair_id)
    # update lai item neu item da co trong cart
    if chair_ids.include?(params[:chair_id].to_i)
      @order_item = @order.order_items.find_by(chair_id: params[:chair_id].to_i)
      new_quantity = @order_item.quantity + params[:quantity].to_i
      @order_item.update_attributes(quantity: new_quantity)
    else
      # them vao cart neu la item moi
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_to cart_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to cart_path
  end

private
  def order_item_params
    params.permit(:quantity, :chair_id)
  end
end
