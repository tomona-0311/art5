class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  def after_sign_in_path_for(resource)
    flash[:notice] = "新規登録完了しました。次に名前を入力してください"#遷移先のパス
    new_post_path
  end
end
