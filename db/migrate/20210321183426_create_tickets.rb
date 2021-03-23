class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :show_time
      t.belongs_to :user

      t.timestamps
    end
  end
end
