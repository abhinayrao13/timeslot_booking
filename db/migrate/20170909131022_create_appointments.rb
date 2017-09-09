class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :from_time
      t.datetime :to_time

      t.timestamps
    end
  end
end
