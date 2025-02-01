class ViriController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @viri = Virus.all
    if params[:query].present?
      @viri = @viri.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def new
    @virus = Virus.new
  end

  def create
    @virus = Virus.new(virus_params)
    @virus.user = current_user
    if @virus.save
      redirect_to @virus, notice: "Virus created successfully!"
    else
      render :new
    end
  end

  def show
    @virus = Virus.find(params[:id])
    @booking = Booking.new
  end

  private

  def virus_params
    params.require(:virus).permit(:name, :price, :description, :photo)
  end
end
