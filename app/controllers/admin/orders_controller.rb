class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    if @order.update(order_params)
       @order_items.update_all(making_status: 1) if @order.status == "payment_confirmation"
    redirect_to admin_order_path(@order.id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
