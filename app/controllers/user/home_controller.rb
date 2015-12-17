class User::HomeController < UserController
  def index
    @categories = Admin::Category.where(user_id:session[:user_id])
    @sites = {}
    @categories.each do |category|
      @sites[category.id] = category.sites 
    end
  end
end
