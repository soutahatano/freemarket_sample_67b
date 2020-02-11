class SignupsController < ApplicationController
  before_action :validates_user, only: :address
  before_action :validates_address, only: :phone_number
  before_action :validates_phone, only: :create
  def new
  end

  def identification
    @user = User.new
  end

  def address
    @address = Address.new
  end

  def phone_number
    @user = User.new
  end

  def create
    @user.save
    Address.create(
      user: @user,
      first_name: session[:address]["first_name"],
      last_name: session[:address]["last_name"],
      first_name_kana: session[:address]["first_name_kana"],
      last_name_kana: session[:address]["last_name_kana"],
      prefecture_id: session[:address]["prefecture_id"],
      city: session[:address]["city"],
      house_number: session[:address]["house_number"],
      post_number: session[:address]["post_number"],
      phone_number: session[:address]["phone_number"]
    )
    sign_in @user unless user_signed_in?
  end
  
  private
  
  def validates_user
    session[:user] = User.new()
    session[:user][:nickname] = user_params[:nickname]
    session[:user][:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:user][:first_name] = user_params[:first_name]
    session[:user][:last_name] = user_params[:last_name]
    session[:user][:first_name_kana] = user_params[:first_name_kana]
    session[:user][:last_name_kana] = user_params[:last_name_kana]
    if Date.valid_date?(params[:birthday]["birthday(1i)"].to_i,params[:birthday]["birthday(2i)"].to_i,params[:birthday]["birthday(3i)"].to_i)
      session[:user][:birthday] = Date.new(params[:birthday]["birthday(1i)"].to_i,params[:birthday]["birthday(2i)"].to_i,params[:birthday]["birthday(3i)"].to_i)
    else
      session[:user][:birthday] = nil
    end  
    @user = User.new(
      nickname: session[:user][:nickname],
      email: session[:user][:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:user][:first_name],
      last_name: session[:user][:last_name], 
      first_name_kana: session[:user][:first_name_kana], 
      last_name_kana: session[:user][:last_name_kana], 
      birthday: session[:user][:birthday],
      phone_number: "09009876543"
    )
    unless @user.valid?
      render '/signups/identification'
    end
  end
  
  def validates_address
    session[:address] = Address.new()
    session[:address][:first_name] = address_params[:first_name]
    session[:address][:last_name] = address_params[:last_name]
    session[:address][:first_name_kana] = address_params[:first_name_kana]
    session[:address][:last_name_kana] = address_params[:last_name_kana]
    session[:address][:prefecture_id] = address_params[:prefecture_id]
    session[:address][:city] = address_params[:city]
    session[:address][:house_number] = address_params[:house_number]
    session[:address][:post_number] = address_params[:post_number]
    session[:address][:phone_number] = address_params[:phone_number]

    @user = User.new
    @address = Address.new(
      user: @user,
      first_name: session[:address][:first_name],
      last_name: session[:address][:last_name],
      first_name_kana: session[:address][:first_name_kana],
      last_name_kana: session[:address][:last_name_kana],
      prefecture_id: session[:address][:prefecture_id],
      city: session[:address][:city],
      house_number: session[:address][:house_number],
      post_number: session[:address][:post_number],
      phone_number: session[:address][:phone_number]
    )
    unless @address.valid?
      render '/signups/address'
    end
  end

  def validates_phone
    @user = User.new(
      nickname: session[:user]["nickname"],
      email: session[:user]["email"],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:user]["first_name"],
      last_name: session[:user]["last_name"], 
      first_name_kana: session[:user]["first_name_kana"], 
      last_name_kana: session[:user]["last_name_kana"], 
      birthday: session[:user]["birthday"],
      phone_number: user_params[:phone_number]
    )
    unless @user.valid?
      render '/signups/phone_number'
    end
  end

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number)
  end

  def address_params
    params.require(:address).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:prefecture_id,:city,:house_number,:building,:phone_number,:post_number)
  end

end
