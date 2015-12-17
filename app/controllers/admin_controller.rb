class AdminController < ApplicationController
  before_action :check_login

  def login_user
    admin =  Admin::User.find_by_id(session[:user_id])
    return admin if !admin.nil?
    nil
  end
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
