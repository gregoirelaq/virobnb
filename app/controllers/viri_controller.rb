class ViriController < ApplicationController
  def index
    @viri = Virus.all
  end

  def new
    @virus = Virus.new
  end

  def create
    @virus = Virus.new(virus_params)
    @virus.save
    redirect_to virus_path(@virus)
  end

  private

  def virus_params
    params.require(:virus).permit(:name, :price, :description)
  end

end
