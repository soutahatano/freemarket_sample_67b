class CreditsController < ApplicationController
  require "payjp"
  before_action :set_credit

  def index
    redirect_to credit_path(@credit) if @credit.present?
  end

  def new
    redirect_to credits_path if @credit.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_access_key]
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
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_access_key]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
  end

  def destroy
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_access_key]
    customer = Payjp::Customer.retrieve(@credit.customer_id)
    customer.delete
    if @credit.destroy
      redirect_to action: "index"
    else 
      redirect_to action: "index"
    end
  end

  private

  def set_credit
    @credit = Credit.find_by(user_id: current_user.id) if Credit.find_by(user_id: current_user.id).present?
  end
end