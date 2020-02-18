class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,　:show,　:update, :buy]
  def index
    @items = Item.all
    @items = @items.order("created_at DESC").limit(5)
  end

  def new
    @item = Item.new
  end

  def create
    if params[:category_id] == nil
      render :new
    else
      @category = Category.find(params[:category_id])
      @item = Item.new(
        name: item_params[:name],
        text: item_params[:text],
        price: item_params[:price],
        brand: item_params[:brand],
        status_id: item_params[:status_id],
        category: @category,
        user_id: current_user.id
      )
      if @item.save
        count = 0
        if params[:picture1] != nil
          @picture1 = Picture.new(
            picture: params[:picture1],
            item_id: @item.id
          )
          count += 1 if @picture1.save
        end
        if params[:picture2] != nil
          @picture2 = Picture.new(
            picture: params[:picture2],
            item_id: @item.id
          )
          count += 1 if @picture2.save
        end
        if params[:picture3] != nil
          @picture3 = Picture.new(
            picture: params[:picture3],
            item_id: @item.id
          )
          count += 1 if @picture3.save
        end
        if params[:picture4] != nil
          @picture4 = Picture.new(
            picture: params[:picture4],
            item_id: @item.id
          )
          count += 1 if @picture4.save
        end
        if params[:picture5] != nil
          @picture5 = Picture.new(
            picture: params[:picture5],
            item_id: @item.id
          )
          count += 1 if @picture5.save
        end
        if count > 0
          Delivery.create(
          item_id: @item.id,
          deliverycharge_id: delivery_params[:deliverycharge_id],
          deliveryday_id: delivery_params[:deliveryday_id],
          prefecture_id: delivery_params[:prefecture_id]
          )
          redirect_to root_path
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

  def edit
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      @item.delivery.update(delivery_params)
      @item.pictures.each_with_index do |picture, index|
        if params[:"image#{index + 1}"] != "true" && params[:"params#{index + 1}"] != nil 
          picture.update(picture: params[:"params#{index + 1}"])
        elsif params[:"image#{index + 1}"] != "true" && params[:"params#{index + 1}"] ==  nil
          picture.destroy
        end
      end
      (5 - @item.pictures.length).times do |x|
        picture = Picture.create(
          picture: params[:"picture#{5 - x}"],
          item_id: @item.id
        )
      end
        redirect_to　root_path
    else
      render 'edit'
    end
  end
  
  def show
    @items = Item.all
    @items = @items.order("created_at DESC").limit(5)
    @item = Item.includes(:user, :delivery).find(params[:id])
  end

  def buy
    if Credit.find_by(user_id: current_user.id).present?
      @credit = Credit.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name,:text,:price,:brand,:status_id)
  end

  def delivery_params
    params.permit(:deliverycharge_id,:deliveryday_id,:prefecture_id)
  end
end