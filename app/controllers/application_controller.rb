class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def check_roles
    requested_role = request.path.split('/')[1]
    user_roles = current_user.roles.keys
    redirect_to root_path, notice: 'You do not have this role.' unless user_roles.include?(requested_role) || current_user.manager
  end
   
   # formats multiple errors for flash messages
  def errors_for(resource)
    @errors_string = ""
    resource.errors.full_messages.each do |msg|
      @errors_string << "#{msg} "
    end
    @errors_string
  end
end
