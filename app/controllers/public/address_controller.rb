class Public::AddressController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to address_index_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to address_index_path
  end

  def destroy
    @adderss = Address.find(params[:id])
    @address.destoy
    redirect_to address_index_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
