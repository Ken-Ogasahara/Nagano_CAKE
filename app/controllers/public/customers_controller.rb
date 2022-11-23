class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to public_customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
    customer = Customer.find(current_customer.id)
    customer.is_deleted = true
    customer.save
    reset_session
    flash[:notice] = "退会が完了しました。"
    redirect_to public_root_path
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
