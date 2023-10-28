# db/migrate/20231028000000_create_bookings.rb (remplacez le nom de fichier par la date de votre migration réelle)
class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :monster_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
