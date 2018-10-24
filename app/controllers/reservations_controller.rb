class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :update]
  def index
     @reservations = Reservation.includes(:aquabike).all
   end

   def show
   end

   def destroy
     @reservation.destroy
     head :ok
   end

   def edit
   end

   def update
     @reservation.update(reservation_params)
     redirect_to reservation_path(@reservation)
   end

   def new
     @aquabike = Aquabike.find(params[:aquabike_id])
     @reservation = Reservation.new
   end

   def create
     @reservation = Reservation.create!(reservation_params)
     aquabike = @reservation.aquabike
     if @reservation.save
       redirect_to reservation_path(@reservation)
       else
           redirect_to new_reservation_path
       end

   end

   private

   def reservation_params
     params.require(:reservation).permit(:start_at, :creneau, :aquabike_id)
   end

   def set_reservation
     @reservation = Reservation.find(params[:id])
   end
end
