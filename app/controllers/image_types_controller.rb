class ImageTypesController < ApplicationController
  before_action :set_image_type, only: [:show, :edit, :update, :destroy]

  # GET /image_types
  # GET /image_types.json
  def index
    @image_types = ImageType.all
  end

  # GET /image_types/1
  # GET /image_types/1.json
  def show
  end

  # GET /image_types/new
  def new
    @image_type = ImageType.new
  end

  # GET /image_types/1/edit
  def edit
  end

  # POST /image_types
  # POST /image_types.json
  def create
    @image_type = ImageType.new(image_type_params)

    respond_to do |format|
      if @image_type.save
        format.html { redirect_to @image_type, notice: 'Image type was successfully created.' }
        format.json { render :show, status: :created, location: @image_type }
      else
        format.html { render :new }
        format.json { render json: @image_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_types/1
  # PATCH/PUT /image_types/1.json
  def update
    respond_to do |format|
      if @image_type.update(image_type_params)
        format.html { redirect_to @image_type, notice: 'Image type was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_type }
      else
        format.html { render :edit }
        format.json { render json: @image_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_types/1
  # DELETE /image_types/1.json
  def destroy
    @image_type.destroy
    respond_to do |format|
      format.html { redirect_to image_types_url, notice: 'Image type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_type
      @image_type = ImageType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_type_params
      params.require(:image_type).permit(:name)
    end
end
