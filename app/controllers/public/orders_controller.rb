class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)

    if params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    elsif params[:order][:select_address] == "1"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    else
    end

  end

  def complete
  end

  def create

    @order = Order.new(order_params)
    @order.save

    cart_items = current_customer.cart_items

    cart_items.each do |cart_item|

      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.order_price = Item.find(cart_item.item_id).with_tax_price
      order_detail.save

    end
    cart_items.destroy_all
    redirect_to complete_public_orders_path
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])

    @total = 0
    @order.order_details.each do |order_detail|
      @total += order_detail.order_price * order_detail.amount
    end
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :billing_amount, :customer_id)
    end

end
