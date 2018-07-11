class AddressesController < ApplicationController
  def index
    @address = Address.new
    render 'new'
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    render 'new'
  end

  private

  def address_params
    params.require(:address).permit(:city, :state, :street_address, :zip_code)
  end
end
