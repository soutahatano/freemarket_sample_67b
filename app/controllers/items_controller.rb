class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:pictures).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.pictures.new
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
  def show
  end
  private
  def item_params
    params.require(:item).permit( pictures_attributes: [:src])
  end
  def set_item
    @item = Item.find(params[:id])
  end 
end
