class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    #@order_item = @order.order_item
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :email, :telephone_number)
  end

end
