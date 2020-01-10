class AddStartDateToReservationgyms < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationgyms, :start_date, :datetime
  end
end
