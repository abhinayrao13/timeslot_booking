class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :reason
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
