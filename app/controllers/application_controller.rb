class ApplicationController < ActionController::Base
  
  # バリテーションの実装＞新規投稿が失敗したとき
  before_action :authenticate_user!, except: [:top]
  
  # deviseを使用するviewの作成にて
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # sign upページの編集
  # アプリケーションを完成させよう2＞7章
  def after_sign_in_path_for(resource)
    about_path
  end

  # sign upページの編集
  # アプリケーションを完成させよう2＞7章
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
