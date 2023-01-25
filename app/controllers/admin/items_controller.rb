class Admin::ItemsController < ApplicationController
  def new
    @imte = Item.new
  end

  def create
    @item = Item.all
    @item.save
    redirect_to admin_item(@item.id)
  end

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :profile_image)
  end
end
