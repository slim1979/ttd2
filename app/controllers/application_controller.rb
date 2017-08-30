class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resourse)
    if resourse.admin?
      admin_tickets_path
    else
      new_search_path
    end
  end
end
