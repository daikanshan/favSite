class AdminController < ApplicationController
  before_action :check_login

  private
  def check_login
    if session[:user_id].nil?
      respond_to do |format|
        format.html { redirect_to admin_login_path}
        format.json { head :no_content }
      end
    end
  end
end
