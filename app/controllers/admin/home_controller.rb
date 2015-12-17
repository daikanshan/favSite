class Admin::HomeController < AdminController
  def index
    @site_count = login_user.sites.count if !login_user.nil?
    @category_count = login_user.categories.count if !login_user.nil?
  end
end
