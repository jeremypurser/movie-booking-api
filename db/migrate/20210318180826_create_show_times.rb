class CreateShowTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :show_times do |t|
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :seat_count, null: false
      t.belongs_to :movie

      t.timestamps
    end
  end
end
