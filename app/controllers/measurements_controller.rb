class MeasurementsController < ApplicationController
  include PageableConcern
  before_action :set_measurement, only: %i[show edit update destroy]

  # GET /measurements or /measurements.json
  def index
    @measurements = Measurement.page(page).order(:name).per(items_per_page)
  end

  # GET /measurements/1 or /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements or /measurements.json
  def create
    @measurement = Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to measurement_url(@measurement), notice: "Measurement was successfully created." }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1 or /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to measurement_url(@measurement), notice: "Measurement was successfully updated." }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1 or /measurements/1.json
  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to measurements_url, notice: "Measurement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def pageable_model
      Measurement
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurement_params
      #params.fetch(:measurement, { :name, :abbreviation })
      params.require(:measurement).permit(:name, :abbreviation)
    end
end
