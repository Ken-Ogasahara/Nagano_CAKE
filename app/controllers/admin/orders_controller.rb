class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
    @order_details = @order.order_details

    @total = 0

    @order_detail = OrderDetail.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスの変更に成功しました。"
      redirect_to admin_order_path(@order.id)
    else
      flash[:notice] = "注文ステータスの変更に失敗しました。"
      render admin_order_path(@order.id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
