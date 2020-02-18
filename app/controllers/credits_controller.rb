class CreditsController < ApplicationController
  require "payjp"
  before_action :set_credit
  before_action :set_api_key, except: [:index, :new]

  def index
    redirect_to credit_path(@credit) if @credit.present?
  end

  def new
    redirect_to credits_path if @credit.present?
  end

  def create
    if params[:payjp_token].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params[:payjp_token]
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
    end
  end

  def show
    customer = Payjp::Customer.retrieve(@credit.customer_id)
    @credit_information = customer.cards.retrieve(@credit.card_id)
  end

  def destroy
    customer = Payjp::Customer.retrieve(@credit.customer_id)
    customer.delete
    if @credit.destroy
      redirect_to action: "index"
    else 
      redirect_to action: "index"
    end
  end

  def pay
    @item = Item.find(params[:format])
    if @item.soldout == "true"
      redirect_to root_path
    else
      Payjp::Charge.create(
      amount: @item.price,
      customer: @credit.customer_id,
      currency: 'jpy'
      )
      @item.update(
        soldout: "true"
      )
      @item.delivery.update(
        user: current_user
      )
      redirect_to root_path
    end
  end

  private

  def set_credit
    @credit = Credit.find_by(user_id: current_user.id) if Credit.find_by(user_id: current_user.id).present?
  end

  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_access_key]
  end

end