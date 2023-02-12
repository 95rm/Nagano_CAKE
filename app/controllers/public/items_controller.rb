class Public::ItemsController < ApplicationController
  def index
    @item = Item.all.page(params[:page]).per(8)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to cart_items_path
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
end
