class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_item_params)
    redirect_to admin_order_path(order_item.id)

  end

   private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
