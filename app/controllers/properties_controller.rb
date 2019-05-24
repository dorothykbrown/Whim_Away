class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authorize_property, only: %i[show update destroy]

  # def index
  #   # @properties = policy_scope(Property).all
  #   # use javascript to filter all properties

  #   @properties = policy_scope(Property).where.not(latitude: nil, longitude: nil)
  #   # @properties.where.not(latitude: nil, longitude: nil)

  #   @markers = @properties.map do |property|
  #     {
  #       lat: property.latitude,
  #       lng: property.longitude
  #     }
  #   end
  # end

  def index
    if params[:category].present?
      @properties = Property.where(category: params[:category]).where.not(latitude: nil, longitude: nil)
    else
      @properties = Property.all
    end

    if params[:search].present?
      @check_in = params[:search][:check_in_date].to_datetime
      @check_out = params[:search][:check_out_date].to_datetime
      desired_dates = (@check_in..@check_out).to_a
      # @properties.each do |property|
        desired_dates.each do |date|
          @properties = @properties.select do |property|
            # booked_dates = property.availability.flatten
            property.availability.flatten.exclude? date
          end
        end
    @properties
          # byebug
    end

    @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { property: property })
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
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
  end

  def user_properties
    @properties = Property.all.where(user: current_user)
  end

  # def availability_params
  # params.require(:property).permit(:check_in_date, :check_out_date)
  # @check_in = params[:check_in_date].to_datetime
  # @check_out = params[:check_out_date].to_datetime
  # byebug
  # end

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

  def filtering_params(params)
    params.slice(:category)
  end
end
