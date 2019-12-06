class FlatsController < ApplicationController
  def index
    if params[:query].present? && params[:query1].present? && params[:query2].present?
      @bookings = Booking.where(flat: @flat)
      @flats = policy_scope(Flat.geocoded).joins(:bookings).where('flats.address ILIKE ? AND bookings.checkin_date > ? AND bookings.checkout_date < ?', "%#{params[:query]}%", "%#{params[:query1]}%", "%#{params[:query2]}%") #returns flats with coordinates
      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
      else
      @flats = policy_scope(Flat.geocoded)
      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
  end


 def create
  @flat = Flat.new(flat_params)
  authorize @flat
  @flat.user_id = current_user.id
  if @flat.save
    redirect_to @flat
  else
    render 'new'
  end
end


def show
  @flat = Flat.find(params[:id])
  @bookings = Booking.where(flat: @flat)
  @review = Review.where(booking: @booking)
  authorize @flat
end

def new
  @flat = Flat.new
  authorize @flat
end




def edit
  @flat = Flat.find(params[:id])
  authorize @flat
end


def update
  @flat = Flat.find(params[:id])
  @flat.update(flat_params)
  authorize @flat
  if @flat.save
    redirect_to @flat
  else
    render 'new'

  end
end

private
def flat_params
  params.require(:flat).permit(:name, :description, :daily_price, :address, :features, :photo)
end
end
