class Admin::SessionController < AdminController
  skip_before_action :check_login
  layout false
  def new
    if session[:user_id]
      redirect_to admin_path
    end
  end

  def create
    prms = params.permit(:username, :password, :modal)
    admin = Admin::User.find_by_username(prms[:username])
    if admin && verify_rucaptcha?(admin)
      session[:user_id] = admin.id
      session[:username] = admin.username
      if !prms[:modal].nil?
        redirect_to root_path
      else
        redirect_to admin_login_path
      end
    else
      if !prms[:modal].nil?
        redirect_to root_path
      else
        redirect_to admin_login_path
      end
    end
  end

  def destroy
    session[:user_id] = session[:username] = nil
    redirect_to root_path
  end
end
