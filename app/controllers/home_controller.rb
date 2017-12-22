class HomeController < ApplicationController
  skip_before_action :check_roles
  def index

  end

end