class FishingTripsController < ApplicationController
  before_action :set_fishing_trip, only: [:show, :edit, :update, :destroy]

  def index
    @fishing_trips = FishingTrip.all
  end

  def show
  end

  def new
    @fishing_trip = FishingTrip.new
  end

  def create
    @fishing_trip = FishingTrip.new(fishing_trip_params)
    if @fishing_trip.save
      redirect_to fishing_trip_path(@fishing_trip), notice: "Fishing trip created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @fishing_trip.update(fishing_trip_params)
      redirect_to fishing_trip_path(@fishing_trip), notice: "Fishing trip updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fishing_trip.destroy
    redirect_to fishing_trips_path, notice: "Fishing trip deleted successfully."
  end

  private

  def set_fishing_trip
    @fishing_trip = FishingTrip.find(params[:id])
  end

  def fishing_trip_params
    params.require(:fishing_trip).permit(
      :lake_id,
      :custom_location_name,
      :latitude,
      :longitude,
      :fish_species,
      :lure_used,
      :date_fished,
      :notes
    )
  end
end
