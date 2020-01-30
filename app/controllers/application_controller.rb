class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :basic_auth

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic][:auth_user] && password ==  Rails.application.credentials[:basic][:auth_password]
    end
  end
end
