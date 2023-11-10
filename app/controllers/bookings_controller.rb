class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :update]


  def new
    @user = current_user
    @booking = Booking.new(user: @user)
  end

  def create
    @user = current_user

    @monster = Monster.find(params[:booking][:monster_id])
    @booking = Booking.new(user: @user, monster: @monster)
    personal_message = params[:booking][:personal_message]

    if @booking.save
      MonsterMailer.reservation_email(current_user, @monster, personal_message).deliver_now
      redirect_to user_bookings_path, notice: "Demande de réservation créée avec succès"
    else

      render 'monsters/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @user = current_user
    @bookings = Booking.order(created_at: :asc).all
  end

  def edit
    # The before_action :find_booking already finds the booking, so you don't need to find it again here.
    @user = @booking.user
    @monster = @booking.monster
  end

  def update
    if @booking.update(booking_params)
      if @booking.approved?
        MonsterMailer.booking_confirmation_email(@booking.user, @booking.monster).deliver_now
      end
      redirect_to user_bookings_path, notice: "Demande de réservation mise à jour avec succès"
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:monster_id, :user_id, :approved)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
