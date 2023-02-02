class Public::ItemsController < ApplicationController
  def index
    @item = Item.all.page(params[:page]).per(8)
    @item_name = Item.find(params[:item_id])
  end

  def show
    @item = Item.find(params[:id])
  end
end
