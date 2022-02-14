class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_path, alert: "管理者権限がないのでアクセスできません" }
    end
  end

  def after_sign_in_path_for(resource)
      posts_path
  end

  def after_sign_out_path_for(resource)
    posts_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age, :gender, :work, :access])
  end

end
