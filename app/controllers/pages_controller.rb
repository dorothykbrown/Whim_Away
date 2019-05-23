class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_properties
    @user = current_user
    @properties = @user.properties
  end

  def my_bookings
    @user = current_user
    @bookings = @user.bookings
  end


end
