class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def verification
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
    @cart_items = CartItem.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
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
