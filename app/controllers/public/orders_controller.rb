class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def verification
    @total = 0
    @order = Order.new(order_params)
    if params[:order][:address_select] == "0"
       @order.shipping_postal_code = current_customer.postal_code
       @order.shipping_address = current_customer.address
       @order.shipping_name = current_customer.full_name
    elsif params[:order][:address_select] == "1"
       address = Address.find(params[:order][:address_id])
       @order.shipping_postal_code = address.postal_code
       @order.shipping_address = address.address
       @order.shipping_name = address.name
    elsif params[:order][:address_select] == "2"
    end
    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.orders_id = @order_id
      order_item.number = cart_item.amount
      order_item.unit_price = cart_item.item.price
      order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total_payment, :payment_method, :status)
  end

end
