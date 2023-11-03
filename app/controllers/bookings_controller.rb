class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :update]


  def new
    @user = current_user
    @booking = Booking.new(user: @user)
  end

  def create
    @user = current_user
    @booking = Booking.new(user: @user, monster: @monster)

    if @booking.save
      redirect_to bookings_path, notice: "Demande de réservation créée avec succès"
    else
      render :new
    end
  end

  def show

  end

  def index
    @user = current_user
    @bookings = Booking.all
  end

  def edit
    # The before_action :find_booking already finds the booking, so you don't need to find it again here.
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:monster_id, :user_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
