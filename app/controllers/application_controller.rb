class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  private
  def handle_no_access
    redirect_to root_path, :alert => "You don't have permission to do that. This action is notified." and return
  end
end
