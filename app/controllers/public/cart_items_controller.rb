class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.update(cart_item_params)
      flash[:notice] = "カート商品の個数を変更しました。"
      redirect_to public_cart_items_path
    else
      flash[:notice] = "カート商品の個数を変更できませんでした。"
      redirect_to public_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "カート商品の個数が追加されました。"
      redirect_to public_cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      if  @cart_item.save
        flash[:notice] = "カートに商品を追加しました。"
        redirect_to public_cart_items_path
      else
        render :new
      end
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id,:customer_id, :amount)
  end

end
