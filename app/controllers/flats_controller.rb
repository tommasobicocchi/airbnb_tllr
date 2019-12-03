class FlatsController < ApplicationController
  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
      @flat = Flat.new(flat_params)
    authorize @flat
    if @flat.save
    redirect_to @flat
    else
    render 'new'
  end

  end

  private
  def flat_params
    params.require(:flat).permit(:name, :description, :daily_price, :address, :features)
  end
end
