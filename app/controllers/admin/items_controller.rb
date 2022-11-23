class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      flash[:notice] = "商品を新規追加しました。"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @price = @item.price.to_s(:delimited)
    @including_tax_price = (@item.price * 1.1).to_i.to_s(:delimited)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の詳細を変更しました。"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
