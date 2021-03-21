class AddColumnTicketsSoldToShowTimes < ActiveRecord::Migration[6.1]
  def change
    add_column :show_times, :tickets_sold, :integer, null: false, default: 0
  end
end
