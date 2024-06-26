class RegionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_region, only: %i[ show edit update destroy ]

  # GET /regions or /regions.json
  def index
    @q = Region.ransack(params[:q])
    @regions = @q.result.page(params[:page])
  end

  # GET /regions/1 or /regions/1.json
  def show
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions or /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to region_url(@region), notice: "Region was successfully created." }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1 or /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to region_url(@region), notice: "Region was successfully updated." }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1 or /regions/1.json
  def destroy
    @region.destroy!

    respond_to do |format|
      format.html { redirect_to regions_url, notice: "Region was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name, :code)
    end
end
