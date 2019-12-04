class ReviewsController < ApplicationController

  def index
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find_by(flat_id: @flat)
    @reviews = Review.where(booking_id: @booking)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    @review.rating = review_params["rating"].to_i
    if @review.save
      redirect_to flat_path(@booking.flat)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
