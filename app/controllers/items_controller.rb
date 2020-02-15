class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
  end

  def new
    @item = Item.new
    @category = Category.where(category_id: nil)
  end

  def create
    if params[:category_id] == nil
      render :new
    else
      @category = Category.find(params[:category_id])
      @item = Item.new(
        name: params[:name],
        text: params[:text],
        price: params[:price],
        brand: params[:brand],
        status_id: params[:status_id],
        category: @category,
        user_id: current_user.id,
        status_id: params[:status_id]
      )
      if @item.valid?
        @delivery = Delivery.new(
          item_id: @item.id,
          deliverycharge_id: params[:deliverycharge_id],
          deliveryday_id: params[:deliveryday_id],
          prefecture_id: params[:prefecture_id]
        )
        if @delivery.valid?
          count = 0
          if params[:picture1] != nil
            @picture1 = Picture.new(
              picture: params[:picture1],
              item_id: @item.id
            )
            count += 1 if @picture1.valid?
          end
          if params[:picture2] != nil
            @picture2 = Picture.new(
              picture: params[:picture2],
              item_id: @item.id
            )
            count += 1 if @picture2.valid?
          end
          if params[:picture3] != nil
            @picture3 = Picture.new(
              picture: params[:picture3],
              item_id: @item.id
            )
            count += 1 if @picture3.valid?
          end
          if params[:picture4] != nil
            @picture4 = Picture.new(
              picture: params[:picture4],
              item_id: @item.id
            )
            count += 1 if @picture4.valid?
          end
          if params[:picture5] != nil
            @picture5 = Picture.new(
              picture: params[:picture5],
              item_id: @item.id
            )
            count += 1 if @picture5.valid?
          end
          if count > 0
            @item.save
            Delivery.crewate(
            item_id: @item.id,
            deliverycharge_id: params[:deliverycharge_id],
            deliveryday_id: params[:deliveryday_id],
            prefecture_id: params[:prefecture_id]
            )
            @picture1.save
            @picture2.save
            @picture3.save
            @picture4.save
            @picture5.save
            redirect_to root_path
          else
            render :new
          end
        else
          render :new
        end
      else
        render :new
      end
  end
  end

  def get_category_children
    @category_children = Category.find(params[:id]).children
  end
 
  def show
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

end
