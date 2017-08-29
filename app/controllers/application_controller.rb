class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resourse)
    if resourse.admin?
      tickets_path
    else
      root_path
    end
  end
end
