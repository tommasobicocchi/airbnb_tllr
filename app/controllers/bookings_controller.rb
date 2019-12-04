class BookingsController < ApplicationController
   before_action :set_booking, only: [:show, :destroy]

   def index
    @bookings = policy_scope(Booking).where(user_id: current_user)
   end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat_id = params[:flat_id]
    @booking.user_id = current_user.id
    authorize @booking
    if @booking.save
      redirect_to @flat
    else
      render :new
    end
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to flat_path(@booking.flat)
  # end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checkin_date, :checkout_date)
  end
end
