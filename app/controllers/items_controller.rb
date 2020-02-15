class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
  end

  def new
    @item = Item.new
    @item.pictures.new
    # binding.pry
  end

  def create
    
    @item = Item.new(item_params)
    binding.pry
    if @item.save
    
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def item_params
    params.require(:item).permit( :name, :text, :price, :category_id,:brand_id, :status, pictures_attributes: [:id])
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def show
  end
  
end
