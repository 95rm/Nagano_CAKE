class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_items = OrderItem(params[:id])
    @order_item.update(Order_item_params)
    redirect_to admin_order_path(order_item.id)

  end
end
