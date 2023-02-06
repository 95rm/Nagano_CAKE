class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:item).permit(:customer_is, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total_payment, :payment_method, :status)
  end

end
