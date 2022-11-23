class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を追加しました。"
      redirect_to public_addresses_path
    else
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を変更しました。"
      redirect_to public_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "配送先を削除しました。"
      redirect_to public_addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
