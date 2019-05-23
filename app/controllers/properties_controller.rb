class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authorize_property, only: %i[show update destroy]

  def index
    # @properties = policy_scope(Property).all
    # use javascript to filter all properties

    @properties = policy_scope(Property).where.not(latitude: nil, longitude: nil)
    # @properties.where.not(latitude: nil, longitude: nil)

    @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end

  def show
    # @properties = Property.where(category: params[:category
    @property = Property.find(params[:id])
    @booking = Booking.new
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    authorize @property

    if @property.save
      redirect_to properties_path, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
  end

  private

  def authorize_property
    authorize @property
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :address, :photo, :rating, :category, :price, :available, :user, :description)
  end
end
