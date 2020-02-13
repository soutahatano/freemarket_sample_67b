class ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = @items.order("created_at DESC").limit(5)
  end

  def new
  end

  def show
  end
  
end
