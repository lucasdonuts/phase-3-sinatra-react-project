class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.integer :price
      t.string :package
      t.datetime :time
    end
  end
end
