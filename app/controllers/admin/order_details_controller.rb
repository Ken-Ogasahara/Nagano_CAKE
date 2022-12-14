class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = "製作ステータス変更に成功しました。"

      if @order_detail.making_status == "completion_of_production"
        order = Order.find(@order_detail.order_id)
        order.order_status = "preparing_to_ship"
        order.save
      end

      redirect_to admin_order_path(@order_detail.order_id)
    else
      flash[:notice] = "製作ステータスの変更に失敗しました。"
      render admin_order_path(@order_detail.order_id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
