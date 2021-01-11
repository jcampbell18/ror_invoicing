class MileagesController < ApplicationController
  before_action :set_mileage, only: [:show, :edit, :update, :destroy]

  # GET /mileages
  # GET /mileages.json
  def index
    @mileages = Mileage.all
  end

  # GET /mileages/1
  # GET /mileages/1.json
  def show
  end

  # GET /mileages/new
  def new
    @mileage = Mileage.new
  end

  # GET /mileages/1/edit
  def edit
  end

  # POST /mileages
  # POST /mileages.json
  def create
    @mileage = Mileage.new(mileage_params)

    respond_to do |format|
      if @mileage.save
        format.html { redirect_to @mileage, notice: 'Mileage was successfully created.' }
        format.json { render :show, status: :created, location: @mileage }
      else
        format.html { render :new }
        format.json { render json: @mileage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mileages/1
  # PATCH/PUT /mileages/1.json
  def update
    respond_to do |format|
      if @mileage.update(mileage_params)
        format.html { redirect_to @mileage, notice: 'Mileage was successfully updated.' }
        format.json { render :show, status: :ok, location: @mileage }
      else
        format.html { render :edit }
        format.json { render json: @mileage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mileages/1
  # DELETE /mileages/1.json
  def destroy
    @mileage.destroy
    respond_to do |format|
      format.html { redirect_to mileages_url, notice: 'Mileage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mileage
      @mileage = Mileage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mileage_params
      params.require(:mileage).permit(:project_site_id, :vehicle_id, :invoice_id, :drive_date, :start_mileage, :end_mileage, :subtotal, :notes)
    end
end
