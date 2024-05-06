class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    keys = [:nickname, :password, :encrypted_password, :family_name_kanji, :first_name_kanji, :family_name_kana,
            :first_name_kana, :birthday]
    devise_parameter_sanitizer.permit(:sign_up, keys:)
  end
end
