class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: 'TRUE').order("created_at DESC").limit(4)
  end

  def about
  end
end
