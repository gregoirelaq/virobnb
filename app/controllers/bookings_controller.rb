class BookingsController < ApplicationController
  before_action :authenticate_user! # Assure que l'utilisateur est connecté
  before_action :set_booking, only: [:destroy]

  # GET /bookings
  def index
    # Liste toutes les réservations de l'utilisateur connecté
    @bookings = current_user.bookings
  end

  # POST /bookings
  def create
    @virus = Virus.find(params[:virus_id]) # Trouve le virus à réserver
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.virus = @virus
    @booking.total_price = calculate_total_price(@virus.price, @booking.start_date, @booking.end_date)

    if @booking.save
      redirect_to virus_path(@virus), notice: 'Your booking was successfully created.'
    else
      redirect_to virus_path(@virus), alert: 'Unable to create booking. Please check the dates and try again.'
    end
  end

  # DELETE /bookings/:id
  def destroy
    if @booking.user == current_user
      @booking.destroy
      redirect_to bookings_path, notice: 'Your booking was successfully canceled.'
    else
      redirect_to bookings_path, alert: 'You are not authorized to cancel this booking.'
    end
  end

  # Ajout d'une action pour gérer le calcul dynamique du prix lorsque les dates sont sélectionnées

    # GET /bookings/calculate_price
    def calculate_price
      @virus = Virus.find(params[:virus_id])
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date

      if start_date.present? && end_date.present? && start_date < end_date
        total_days = (end_date - start_date).to_i
        total_price = total_days * @virus.price

      end
    end

  private

  # Trouver une réservation spécifique pour l'action `destroy`
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Autoriser uniquement les paramètres nécessaires
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # Calculer le prix total de la réservation
  def calculate_total_price(price_per_day, start_date, end_date)
    return 0 if start_date.blank? || end_date.blank?

    days = (end_date - start_date).to_i
    days * price_per_day
  end

end
