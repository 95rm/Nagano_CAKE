class Admin::OrdersController < ApplicationController
  def show
    @order = Orders.find(params[:id])
  end

  def update

  end
end
