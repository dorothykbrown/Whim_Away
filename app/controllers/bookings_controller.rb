class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

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
    authorize @booking

    if @booking.save
      redirect_to property_path, notice: 'Booking was successfully created.'
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :num_guests, :tot_price, :user, :property)
  end
end
