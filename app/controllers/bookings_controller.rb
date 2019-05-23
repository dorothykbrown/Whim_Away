class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_property

  def index
    @bookings = policy_scope(Booking).all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.property = @property
    @booking.tot_price = calculate_tot_price(@property, @booking)
    authorize @booking

    if @booking.save
      redirect_to property_path(@property), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to property_bookings_path, notice: 'Booking was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
  end

  private

  def set_property
    @property = Property.find_by_id(params[:property_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :num_guests, :tot_price, :user, :property)
  end

  def calculate_tot_price(property, booking)
    num_nights = booking.check_out_date - booking.check_in_date

    property.price * num_nights
  end
end
