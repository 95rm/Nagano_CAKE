class Public::ItemsController < ApplicationController
  def index
    @item = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
end
