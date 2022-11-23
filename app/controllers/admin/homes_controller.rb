class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all
    @orders = Order.all

    # @order_amount = ""
    # @customer.orders.order_details.each do |order_detail|
    #   @order_amount += order_detail.amount
    # end

  end
end
