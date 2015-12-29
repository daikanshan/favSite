class Admin::SitesController < AdminController
  before_action :set_admin_site, only: [:show, :edit, :update, :destroy]

  # GET /admin/sites
  # GET /admin/sites.json
  def index
    @admin_sites = login_user.sites
  end

  # GET /admin/sites/1
  # GET /admin/sites/1.json
  def show
  end

  # GET /admin/sites/new
  def new
    @admin_site = Admin::Site.new
    @categories = login_user.categories

  end

  # GET /admin/sites/1/edit
  def edit
    @categories = Admin::Category.all
    @current_category_id = @admin_site.category.id

  end

  # POST /admin/sites
  # POST /admin/sites.json
  def create
    @admin_site = Admin::Site.new(admin_site_params)

    respond_to do |format|
      if @admin_site.save
        format.html { redirect_to @admin_site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @admin_site }
      else
        format.html { render :new }
        format.json { render json: @admin_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sites/1
  # PATCH/PUT /admin/sites/1.json
  def update
    respond_to do |format|
      if @admin_site.update(admin_site_params)
        format.html { redirect_to @admin_site, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_site }
      else
        format.html { render :edit }
        format.json { render json: @admin_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sites/1
  # DELETE /admin/sites/1.json
  def destroy
    @admin_site.destroy
    respond_to do |format|
      format.html { redirect_to admin_sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    ids = params[:ids].split(",").flatten
    if ids.nil?||ids.empty?
      respond_to do |format|
        format.html { redirect_to admin_sites_url,notice:'未选择站点！'}
        format.json { head :no_content }
      end
    else
      ids.each do |id|
        Admin::Site.find(id).destroy
      end
      respond_to do |format|
        format.html { redirect_to admin_sites_url,notice:'操作成功！'}
        format.json { head :no_content }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_site
      @admin_site = Admin::Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_site_params
      params.require(:admin_site).permit(:name, :url, :avatar,:category_id, :weight, :user_id)
    end
end
