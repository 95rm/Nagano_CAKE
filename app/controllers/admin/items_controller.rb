class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @item = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to new_admin_item_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end
end
