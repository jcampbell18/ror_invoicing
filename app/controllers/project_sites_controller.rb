class ProjectSitesController < ApplicationController
  before_action :set_project_site, only: [:show, :edit, :update, :destroy]

  # GET /project_sites
  # GET /project_sites.json
  def index
    @project_sites = ProjectSite.all
  end

  # GET /project_sites/1
  # GET /project_sites/1.json
  def show
  end

  # GET /project_sites/new
  def new
    @project_site = ProjectSite.new
  end

  # GET /project_sites/1/edit
  def edit
  end

  # POST /project_sites
  # POST /project_sites.json
  def create
    @project_site = ProjectSite.new(project_site_params)

    respond_to do |format|
      if @project_site.save
        format.html { redirect_to @project_site, notice: 'Project site was successfully created.' }
        format.json { render :show, status: :created, location: @project_site }
      else
        format.html { render :new }
        format.json { render json: @project_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_sites/1
  # PATCH/PUT /project_sites/1.json
  def update
    respond_to do |format|
      if @project_site.update(project_site_params)
        format.html { redirect_to @project_site, notice: 'Project site was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_site }
      else
        format.html { render :edit }
        format.json { render json: @project_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_sites/1
  # DELETE /project_sites/1.json
  def destroy
    @project_site.destroy
    respond_to do |format|
      format.html { redirect_to project_sites_url, notice: 'Project site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_site
      @project_site = ProjectSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_site_params
      params.require(:project_site).permit(:address, :city, :state_id, :zipcode, :access_code, :map_link)
    end
end
