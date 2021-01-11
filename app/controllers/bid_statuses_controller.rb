class BidStatusesController < ApplicationController
  before_action :set_bid_status, only: [:show, :edit, :update, :destroy]

  # GET /bid_statuses
  # GET /bid_statuses.json
  def index
    @bid_statuses = BidStatus.all
  end

  # GET /bid_statuses/1
  # GET /bid_statuses/1.json
  def show
  end

  # GET /bid_statuses/new
  def new
    @bid_status = BidStatus.new
  end

  # GET /bid_statuses/1/edit
  def edit
  end

  # POST /bid_statuses
  # POST /bid_statuses.json
  def create
    @bid_status = BidStatus.new(bid_status_params)

    respond_to do |format|
      if @bid_status.save
        format.html { redirect_to @bid_status, notice: 'Bid status was successfully created.' }
        format.json { render :show, status: :created, location: @bid_status }
      else
        format.html { render :new }
        format.json { render json: @bid_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bid_statuses/1
  # PATCH/PUT /bid_statuses/1.json
  def update
    respond_to do |format|
      if @bid_status.update(bid_status_params)
        format.html { redirect_to @bid_status, notice: 'Bid status was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_status }
      else
        format.html { render :edit }
        format.json { render json: @bid_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_statuses/1
  # DELETE /bid_statuses/1.json
  def destroy
    @bid_status.destroy
    respond_to do |format|
      format.html { redirect_to bid_statuses_url, notice: 'Bid status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_status
      @bid_status = BidStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bid_status_params
      params.require(:bid_status).permit(:name)
    end
end
