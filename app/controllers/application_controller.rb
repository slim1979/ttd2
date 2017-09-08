class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resourse)
    if resourse.admin?
      admin_tickets_path
    else
      new_search_path
    end
  end
end
