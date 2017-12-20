class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def check_roles
    requested_role = request.path.split('/')[1]
    user_roles = current_user.roles.keys
    redirect_to root_path, notice: 'You do not have this role.' unless user_roles.include?(requested_role) 
  end
end
