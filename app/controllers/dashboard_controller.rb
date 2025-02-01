class DashboardController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in

  def index
    @recent_bookings = Booking.order(created_at: :desc).limit(5) # Latest 5 bookings
  end

  def bookings
    @bookings = Booking.all.order(created_at: :desc) # Fetch all bookings
  end

end
